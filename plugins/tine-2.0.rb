##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tine-2" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-24
version "0.1"
description "Tine 2.0 is an open source project which combines groupware and CRM in one consistent interface. Tine 2.0 is web-based and optimises collaboration and organisation of groups in a lasting manner."
website "http://www.tine20.org/"

# 8 results for "You need to enable javascript to use Tine 2.0"

# Dorks #
dorks [
'"You need to enable javascript to use Tine 2.0"'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- Tine 2.0 static files -->' },

# HTML Comment # Setup page
{ :text=>'<!-- Tine 2.0 setup static files -->' },

# Powered by
{ :text=>'Powered by: <a target="_blank" href="http://www.tine20.org/">Tine 2.0</a></div>' },

# noscript
{ :text=>'<noscript><p>You need to enable javascript to use <a href="http://www.tine20.org/" title="online open source groupware and crm">Tine 2.0</a></p></noscript>' },

# noscript # Setup page
{ :text=>'<noscript>You need to enable javascript to use <a href="http://www.tine20.org">Tine 2.0 setup or use the CLI setup</a></noscript>' },

]

# Passive #
def passive
	m=[]

	# TINE20SESSID Cookie
	m << { :name=>"TINE20SESSID Cookie" } if @headers['set-cookie'] =~ /TINE20SESSID=[^;]+;/

	# TINE20SETUPSESSID Cookie
	m << { :name=>"TINE20SETUPSESSID Cookie" } if @headers['set-cookie'] =~ /TINE20SESSID=[^;]+;/

	# Return passive matches
	m

end
end

