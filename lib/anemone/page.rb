require 'lib/anemone/http.rb'
#require 'nokogiri'
require 'ostruct'

module Anemone
  class Page

    # The URL of the page
    attr_reader :url
    # Array of distinct A tag HREFs from the page
    attr_reader :links
    # Headers of the HTTP response
    attr_reader :headers
    
    # OpenStruct for user-stored data
    attr_accessor :data
    # Nokogiri document for the HTML body
    attr_accessor :doc    
    # Integer response code of the page
    attr_accessor :code	
    # Array of redirect-aliases for the page
    attr_accessor :aliases
    # Boolean indicating whether or not this page has been visited in PageHash#shortest_paths!
    attr_accessor :visited
    # Depth of this page from the root of the crawl. This is not necessarily the
    # shortest path; use PageHash#shortest_paths! to find that value.
    attr_accessor :depth
    # URL of the page that brought us to this page
    attr_accessor :referer
    attr_accessor :original_doc

    #
    # Create a new Page from the response of an HTTP request to *url*
    #
    def self.fetch(url, from_page = nil)
      begin
        url = URI(url) unless url.is_a?(URI)

        if from_page
          referer = from_page.url
          depth = from_page.depth + 1
        end

        response, code, location = Anemone::HTTP.get(url, referer)

        aka = nil
        if !url.eql?(location)
          aka = location
        end

        return Page.new(url, response.body, code, response.to_hash, aka, referer, depth)
      rescue
        return Page.new(url)
      end
    end
    
    #
    # Create a new page
    #
    def initialize(url, body = nil, code = nil, headers = nil, aka = nil, referer = nil, depth = 0)
      @url = url
      @code = code
      @headers = headers
      @links = []
      @aliases = []
      @data = OpenStruct.new
      @referer = referer
      @depth = depth || 0
      @original_doc = body
      @aliases << aka if !aka.nil?

      if body
        begin
          #@doc = Nokogiri::HTML(body)
          @doc=body
        rescue
          return
        end

        return if @doc.nil?

=begin
        #get a list of distinct links on the page, in absolute url form        
        @doc.css('a').each do |a| 
          u = a.attributes['href'].content if a.attributes['href']
#          pp u
          next if u.nil?
          
          begin
            abs = to_absolute(URI(u))
          rescue
            next
          end

          @links << abs if in_domain?(abs)
        end
@links.uniq!
#puts "found #{@links.size} links with nokogiri"
=end

@links=[]
		@original_doc.scan(/<a[^>]+href=(["][^"]+["]|['][^']+[']|[^ >]+)?/i).flatten.each do |a|
		  a=a[1..-1] if ['"',"'"].include?(a[0..0])
		  a=a[0..-2] if ['"',"'"].include?(a[-1..-1])	  
          begin
#            puts a
            abs = to_absolute(URI(a))         
#            abs = URI(to_absolute2(a))
            
#            if abs.to_s!=abs2.to_s
#		        puts "1:"+abs1.to_s
#		        puts "2:"+abs2.to_s
#		        puts
 #           end
            
          rescue StandardError=>err
#            puts a + err
            next
          end
          @links << abs if in_domain?(abs)
        end       
        @links.uniq!
#      	puts "found #{@links.size} links without nokogiri"      	
      end
      
    end

    
    #
    # Return a new page with the same *response* and *url*, but
    # with a 200 response code
    #    
    def alias_clone(url)
      p = clone
	  p.add_alias!(@aka) if !@aka.nil?
	  p.code = 200
	  p
    end

    #
    # Add a redirect-alias String *aka* to the list of the page's aliases
    #
    # Returns *self*
    #
    def add_alias!(aka)
      @aliases << aka if !@aliases.include?(aka)
      self
    end
    
    #
    # Returns an Array of all links from this page, and all the 
    # redirect-aliases of those pages, as String objects.
    #
    # *page_hash* is a PageHash object with the results of the current crawl.
    #
    def links_and_their_aliases(page_hash)
      @links.inject([]) do |results, link|
        results.concat([link].concat(page_hash[link].aliases))
      end
    end
    
    #
    # The content-type returned by the HTTP request for this page
    #
    def content_type
      @headers['content-type'][0] rescue nil
    end
    
    #
    # Returns +true+ if the page is a HTML document, returns +false+
    # otherwise.
    #
    def html?
      (@content_type =~ /text\/html/) == 0
    end
    
    #
    # Returns +true+ if the page is a HTTP redirect, returns +false+
    # otherwise.
    #    
    def redirect?
      (300..399).include?(@code)
    end
    
    #
    # Returns +true+ if the page was not found (returned 404 code),
    # returns +false+ otherwise.
    #
    def not_found?
      404 == @code
    end
    
    #
    # Converts relative URL *link* into an absolute URL based on the
    # location of the page
    #
    def to_absolute(link)
      # remove anchor
      link = URI.encode(link.to_s.gsub(/#[a-zA-Z0-9_-]*$/,''))
      relative = URI(link)
      absolute = @url.merge(relative)
      absolute.path = '/' if absolute.path.empty?
      return absolute
    end

def to_absolute2(link)
 # fast compared to using URI? 
 page = @url.to_s
 return "" if link[0..10] == "javascript:"

 # remove anchor
 link=link.split("#")[0].to_s

 # is it relative?
 relative = link[0..6]!="http://"

 # work out relative part
 # after 3rd / if starts with http://  http://jflsjfsjj/
 return link if !relative

 # if it starts with /, combine page host name with link

 hostname = page.split("/")[0..2].join("/") +"/"
 page_path=page.split("/")[3..-1].join("/")

 if link[0..0]=="/"
  return hostname[0..-2]+link
 end

 if link[0..2]=="../"
  updirs=0
  while link[0..2]=="../"
   link = link[3..-1]
   updirs+=1
  end

  return hostname + page_path.split("?")[0].to_s.split("/")[0..(0-updirs-2)].join("/") + "/"+ link
 end

 hostname + page_path.split("?")[0].to_s.split("/")[0..-2].join("/") +"/"+ link
end






    
    #
    # Returns +true+ if *uri* is in the same domain as the page, returns
    # +false+ otherwise
    #
    def in_domain?(uri)
      uri.host == @url.host
    end
  end
end
