##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2011-04-06 # Brendan Coles <bcoles@gmail.com>
# Added /cgi-sys/defaultwebpage.cgi and /img-sys/header.jpg aggressive matches
##
# Version 0.3 # Brendan Coles <bcoles@gmail.com>
# Added version detection. Added OS detection.
##
# Version 0.2
# removed :name and :certainty=>100
##
Plugin.define "cPanel" do
author "Andrew Horton"
version "0.4"
description "Site configuration and management software application. Supporting many operating systems while allowing endusers to control every aspect of their webhosting experience. - homepage: http://www.cpanel.net/"

# Dorks #
dorks [
'inurl::2082/frontend -demo'
]

# Examples #
examples %w|
demo.cpanel.net
202.191.40.29
classyserver.com:2082
www.pinoakwebhosting.com:2082
mango.catalyst2.com:2082
www.bent-palestine.com:2082
cpanel.il-toys.com
il-kamasutra.com
|

# Matches #
matches [

# Welcome Page # Default title
{ :text=>"<title>cPanel&reg;</title>" },

# Welcome Page # Default logo HTML
{ :text=>'<div id="footer_images"><img src="sys_cpanel/images/powered_by.gif" />' },

# Welcome Page # Default text
{ :text=>"Apache is working on your cPanel<sup>&reg;</sup> and WHM&#8482; Server" },

# Login Page # Default CSS
{ :regexp=>/<link rel="stylesheet" href="[^>^"]*\/unprotected\/cpanel\/style_optimized\.css" type="text\/css" \/>/ },

# Version Detection # Login page # Default title
{ :version=>/<title>cPanel&reg;[\s]{0,2}([\d\.]+)<\/title>/ },

# Aggressive # /cgi-sys/defaultwebpage.cgi
{ :url=>"/cgi-sys/defaultwebpage.cgi", :text=>'<p class="troubleshoot">It may be possible to restore access to this site by <a href="http://www.cpanel.net/docs/dnscache/cleardns.html">following these instructions</a> for clearing your dns cache.</p>' },

# Aggressive # /img-sys/header.jpg
{ :url=>"/img-sys/header.jpg", :md5=>"b0f3863b68ff707c3fb586bd87b4f9c6" },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server header
	if @meta["server"].to_s =~ /^cpsrvd\/([\d\.]+)$/
		m << { :version=>@meta["server"].scan(/^cpsrvd\/([\d\.]+)$/) }
	end

	# Return passive matches
	m
end

end


