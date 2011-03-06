##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # Brendan Coles <bcoles@gmail.com>
# Added version detection. Added OS detection.
##
# Version 0.2
# removed :name and :certainty=>100
##
Plugin.define "CPanel" do
author "Andrew Horton"
version "0.3"
description "Site configuration and management software application. Supporting many operating systems while allowing endusers to control every aspect of their webhosting experience. - homepage: http://www.cpanel.net/"

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

matches [

# Welcome page # Default title
{:text=>"<title>cPanel&reg;</title>" },

# Welcome page # Default logo HTML
{ :text=>'<div id="footer_images"><img src="sys_cpanel/images/powered_by.gif" />' },

# Welcome page # Default text
{ :text=>"Apache is working on your cPanel<sup>&reg;</sup> and WHM&#8482; Server", :module=>"Apache" },

# Login page # Default CSS
{ :regexp=>/<link rel="stylesheet" href="[^>]*\/unprotected\/cpanel\/style_optimized.css" type="text\/css" \/>/ },

# Version detection # Login page # Default title
{ :version=>/<title>cPanel&reg;[\s]*([\d\.]+)<\/title>/ },

]

# Version detection # HTTP Server header
def passive
	m=[]

	if @meta["server"].to_s =~ /cpsrvd\/([\d\.]+)/
		version=@meta["server"].scan(/cpsrvd\/([\d\.]+)/).to_s
		m << { :version=>version }
	end

	m

end

end


