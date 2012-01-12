module WhatWeb
class Processor

  attr_reader :opts
  attr_reader :aho_corasick_preprocessor
  def initialize(opts)
    self.opts=opts
    opts[:plugins]=Plugin.registered_plugins unless opts[:plugins]
    if opts[:enable_aho_corasick]
      @aho_corasick_preprocessor=WhatWeb::AhoCorasickPreprocessor.new
      aho_corasick_preprocessor.build_trigger_dictionary(opts[:plugins])
    end
  end

  def process(target)

    results=[]
    plugins=opt[:plugins]
    plugins=aho_corasick_preprocessor.find_plugins(target) if aho_corasick_preprocessor
    plugins.each do |name,plugin|
      begin			
        while plugin.locked?
          sleep 0.1
	  puts "Waiting for plugin:#{name} to unlock" if $verbose > 2
	end
	plugin.lock
        plugin.init(target)
	result=plugin.x
	plugin.unlock
      rescue StandardError => err
	error("ERROR: Plugin #{name} failed for #{target.to_s}. #{err}")
	plugin.unlock
        raise if $WWDEBUG==true
      end
      results << [name, result] unless result.nil? or result.empty?
    end
    results
  end

  private

  def self.convert_to_target(target)
      return target if target.is_a?(WhatWeb::Target)
  end

end
end
