##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WhatWeb-Plugin" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-16
version "0.1"
description "This plugin detects instances of WhatWeb plugins. If this plugin is returned then chances are the other results are false positives."

# Plugin list: http://github.com/urbanadventurer/WhatWeb/tree/master/plugins/
examples %w|
http://github.com/urbanadventurer/WhatWeb/raw/master/plugins/1024-CMS.rb
|

# Extract plugin details
def passive
	m=[]

	if @body =~ /# redistribution and commercial restrictions. Please see the WhatWeb/ or @body =~ /# This file is part of WhatWeb and may be subject to/

		# Extract version
		if @body =~ /^version "([^\"]+)"/
			version=@body.scan(/^version "([^\"]+)"/)
			m<<{:version=>version}
		end

		# Extract plugin name
		if @body =~ /^Plugin.define "([^\"]+)" do/
			modules=@body.scan(/^Plugin.define "([^\"]+)" do/)
			m<<{:module=>modules}
		end

	end

	m

end

end

