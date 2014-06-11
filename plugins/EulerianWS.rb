##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EulerianWS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-08
version "0.1"
description "Eulerian Technologies Web Server (EulerianWS) [French] - homepage: http://www.eulerian.com/fr/"

# About 127 ShodanHQ results for server EulerianWS @ 2011-01-08



# Matches #
matches [

	# Version Detection # Version footer HTML
	{ :version=>/<td align="right"><address>EulerianWS\/([\d\.]+)<\/address><\/td><\/tr>/ },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@headers["server"].to_s.scan(/^[\s]*EulerianWS\/([^\s^\r^\n]+)/i).flatten } if @headers["server"].to_s =~ /^[\s]*EulerianWS\/([^\s^\r^\n]+)/i

	m

end

end

