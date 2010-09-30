module Anemone
  class PageHash < Hash
    
    # We typically index the hash with a URI,
    # but convert it to a String for easier retrieval
    def [](index)
      super(index.to_s)
    end
    
    def []=(index, other)
      super(index.to_s, other)
    end
    
    def has_key?(key)
      super(key.to_s)
    end
    
    #
    # Use a breadth-first search to calculate the single-source
    # shortest paths from *root* to all pages in the PageHash
    #
    def shortest_paths!(root)
      root = URI(root) if root.is_a?(String)
      raise "Root node not found" if !has_key?(root)
      
      each_value {|p| p.visited = false if p}
      
      q = Queue.new
      
      q.enq(root)
      self[root].depth = 0
      self[root].visited = true
      while(!q.empty?)
        url = q.deq
        
        next if !has_key?(url)
        
        page = self[url]
        
        page.links.each do |u|
          next if !has_key?(u) or self[u].nil?
          link = self[u]
          aliases = [link].concat(link.aliases.map {|a| self[a] })
          
          aliases.each do |node|
            if node.depth.nil? or page.depth + 1 < node.depth
              node.depth = page.depth + 1
            end
          end
          
          q.enq(self[u].url) if !self[u].visited
          self[u].visited = true
        end
      end
      
      self
    end
    
    #
    # Returns a new PageHash by removing redirect-aliases for each
    # non-redirect Page
    #
    def uniq
      results = PageHash.new
      each do |url, page|
        #if none of the aliases of this page have been added, and this isn't a redirect page, add this page
        page_added = page.aliases.inject(false) { |r, a| r ||= results.has_key? a}
        if !page.redirect? and !page_added
          results[url] = page.clone 
          results[url].aliases = []
        end
      end
      
      results
    end
    
    #
    # If given a single URL (as a String or URI), returns an Array of Pages which link to that URL
    # If given an Array of URLs, returns a Hash (URI => [Page, Page...]) of Pages linking to those URLs
    #
    def pages_linking_to(urls)
      unless urls.is_a?(Array)
        urls = [urls] unless urls.is_a?(Array)
        single = true
      end

      urls.map! do |url|
        if url.is_a?(String)
          URI(url) rescue nil
        else
          url
        end
      end
      urls.compact

      links = {}
      urls.each { |url| links[url] = [] }
      values.each do |page|
        urls.each { |url| links[url] << page if page.links.include?(url) }
      end

      if single and !links.empty?
        return links.first
      else
        return links
      end
    end

    #
    # If given a single URL (as a String or URI), returns an Array of URLs which link to that URL
    # If given an Array of URLs, returns a Hash (URI => [URI, URI...]) of URLs linking to those URLs
    #
    def urls_linking_to(urls)
      unless urls.is_a?(Array)
        urls = [urls] unless urls.is_a?(Array)
        single = true
      end

      links = pages_linking_to(urls)
      links.each { |url, pages| links[url] = pages.map{|p| p.url} }

      if single and !links.empty?
        return links.first
      else
        return links
      end	  
    end

  end
end