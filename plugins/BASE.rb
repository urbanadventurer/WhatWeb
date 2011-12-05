##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BASE" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-05
version "0.1"
description "Basic Analysis and Security Engine (BASE) - front end for the snort IDS system. - Homepage: http://base.secureideas.net/"

# Google as at 2011-12-05 #
# 8 for "The following pages will prompt you for set up information to finish the install of BASE." intitle:"Basic Analysis and Security Engine (BASE)"

# Dorks #
dorks [
'"The following pages will prompt you for set up information to finish the install of BASE." intitle:"Basic Analysis and Security Engine (BASE)"'
]

# Examples #
examples %w|
www.dotacash.com/base/setup/
src.gnu-darwin.org/ports/security/base/work/base-1.3.9/
cloud.bake180.com/base/
base.runlevel5.dk/setup/index.php
|

# Matches #
matches [

# ./setup/*.php # HTML Comment
{ :text=>'<!-- Basic Analysis and Security Engine (BASE) -->' },

]

# Passive #
def passive
	m=[]

	# ./setup/index.php # PHP Version Detection
	if @body =~ /<tr><td class="setupKey" width="50%">Config Writeable:<\/td><td class="setupValue"><font color='#(336600|FF0000)'>(Yes|No)<\/font><\/td<\/tr>[\s]+<tr><td class="setupKey" width="50%">PHP Version:<\/td><td class="setupValue"><font color='#336600'>([^<]+)<\/font><\/td<\/tr>/
		m << { :string=>"PHP/#{$3}" }
	end

	# Return passive matches
	m
end
end

