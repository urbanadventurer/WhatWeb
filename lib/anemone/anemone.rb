require 'ostruct'
require 'lib/anemone/core.rb'

module Anemone
  # Version number
  VERSION = '0.2.0'

  #module-wide options
  def Anemone.options=(options)
    @options = options
  end
  
  def Anemone.options
    @options
  end
  
  #
  # Convenience method to start a crawl using Core
  #
  def Anemone.crawl(urls, options = {}, &block)
    Anemone.options = OpenStruct.new(options)
	
    # by default, run 4 Tentacle threads to fetch pages
    Anemone.options.threads ||= 4
	
    # disable verbose output by default
    Anemone.options.verbose ||= false
	
    # by default, don't throw away the page response body after scanning it for links
    Anemone.options.discard_page_bodies ||= false

    # by default, identify self as Anemone/VERSION
    Anemone.options.user_agent ||= "Anemone/#{self::VERSION}"   

    # no delay between requests by default
    Anemone.options.delay ||= 0

    # by default, don't obey the robots exclusion protocol
    if Anemone.options.obey_robots_txt ||= false
      begin
        require 'robots'
      rescue LoadError
        warn "To support the robot exclusion protocol, install the robots gem:\n" \
          "sudo gem sources -a http://gems.github.com\n" \
          "sudo gem install fizx-robots"
        exit
      end
    end
    
    # by default, don't limit the depth of the crawl
    Anemone.options.depth_limit ||= :infinity

    #use a single thread if a delay was requested
    if(Anemone.options.delay != 0)
      Anemone.options.threads = 1
    end
    
    Core.crawl(urls, &block)
  end
end
