##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Indico" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-11
version "0.1"
description "Indico - Integrated Digital Conference - allows you to manage complex conferences, workshops and meetings."
website "http://indico.cern.ch/"

# Google results as at 2011-05-11 #
# 27 for "powered by Indico" inurl:wcalendar.py

# ShodanHQ results as at 2011-05-11 #
# 38 for MAKACSESSION

# Dorks #
dorks [
'"powered by Indico" inurl:wcalendar.py'
]



# Matches #
matches [

# td class
{ :text=>'<td class="menuConfTopCell" align="left" valign="bottom">' },

# Version Detection # Powered by link
{ :version=>/<\/span>&nbsp;Powered by(\ CERN)? <a href="http:\/\/cern\.ch\/indico">Indico ([^<]+)<\/a>&nbsp;<span class="separator">/, :offset=>1 },

]

# Passive #
def passive
	m=[]

	# MAKACSESSION Cookie
	m << { :name=>"MAKACSESSION Cookie" } if @headers["set-cookie"] =~ /^MAKACSESSION=[A-Z\d]{16}; Path=/

	# Return passive matches
	m
end

end

