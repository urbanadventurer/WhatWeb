require 'lib/anemone/page.rb'

module Anemone
  class Tentacle
    
    #
    # Create a new Tentacle
    #
    def initialize(link_queue, page_queue)
      @link_queue = link_queue
      @page_queue = page_queue
    end
    
    #
    # Gets links from @link_queue, and returns the fetched
    # Page objects into @page_queue
    #
    def run
      while true do
        link, from_page = @link_queue.deq
        
        break if link == :END
        
        if from_page
          page = Page.fetch(link, from_page)
        else
          page = Page.fetch(link)
        end
        
        @page_queue.enq(page)

        sleep Anemone.options.delay
      end
    end
    
  end
end