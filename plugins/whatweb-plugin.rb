##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "WhatWeb-Plugin"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-16
  # v0.2 # 2011-04-12 # Updated regex. 
]
version "0.2"
description "This plugin detects instances of WhatWeb plugins. If this plugin is returned then chances are the other results are false positives."

# Plugin list: http://github.com/urbanadventurer/WhatWeb/tree/master/plugins/


# Passive #
passive do
	m=[]

	# Extract plugin details
	if @body =~ /^# redistribution and commercial restrictions. Please see the WhatWeb/ or @body =~ /^# This file is part of WhatWeb and may be subject to/

		# Extract version
		if @body =~ /^version "([^\"]+)"/
			m << { :version=>@body.scan(/^version "([^\"]+)"/) }
		end

		# Extract plugin name
		if @body =~ /^Plugin.define "([^\"]+)" do/
			m << { :string=>@body.scan(/^Plugin.define "([^\"]+)" do/) }
		end

		# Extract modules
		if @body =~ /^def ([a-z]+)[\s]?$/
			m << { :module=>@body.scan(/^def ([a-z]+)[\s]?$/) }
		end

	end

	# Return passive matches
	m
end

end

