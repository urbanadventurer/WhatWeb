##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Microsoft-IIS" do
author "Andrew Horton"
version "0.1"
description "Microsoft Internet Information Services (IIS) for Windows Server is a flexible, secure and easy-to-manage Web server for hosting anything on the Web. From media streaming to web application hosting, IIS's scalable and open architecture is ready to handle the most demanding tasks."
website "http://www.iis.net/"

# About 3137957 ShodanHQ results for "server: IIS" @ 2010-10-26



# Matches #
matches [

# Site Not Found # From iis-site-not-found.rb by Andrew Horton
{ :text=>"<html><head><title>Site Not Found</title></head>.<body>No web site is configured at this address.</body></html>", :module=>"Site Not Found" },

# Under Construction # 5.x # Error Text # From iis-underconstruction.rb by Andrew Horton
{ :text=>'<id id="Comment1"><!--Problem--></id><id id="errorText">Under Construction</id></h1>', :module=>"Under Construction" },

# Under Construction # 6.x # Error Text # From iis-underconstruction.rb by Andrew Horton
{ :text=>'<P ID=Comment1><!--Problem--><P ID="errorText">Under Construction</h1>', :module=>"Under Construction" },

# Under Construction # 6.x # If you are the Web site administrator text # From iis-underconstruction.rb by Andrew Horton
{ :text=>'If you are the Web site administrator and feel you have received this message in error, please see &quot;Enabling and Disabling Dynamic Content&quot; in IIS Help.', :module=>"Under Construction" },

# Under Construction # 7.x # Welcome image link # From iis-underconstruction.rb by Andrew Horton
{ :text=>'<a href="http://go.microsoft.com/fwlink/?linkid=66138&amp;clcid=0x409"><img src="welcome.png" alt="IIS7" width="571" height="411" /></a>', :module=>"Under Construction" },

# 5.x # 404
{ :status=>404, :text=>'<h1 style="COLOR:000000; FONT: 13pt/15pt verdana"><!--Problem-->The page cannot be found</h1>' },

# 5.x # 404 # Version Detection
{ :status=>404, :version=>/<a href="http:\/\/www\.microsoft\.com\/ContentRedirect\.asp\?prd=iis&sbp=&pver=([\d\.]+)&pid=&ID=404&cat=web&os=&over=&hrd=&Opt1=&Opt2=&Opt3=" target="_blank">Microsoft Support<\/a>/ },

# 6.x # 404
{ :status=>404, :text=>'<li>Go to <a href="http://go.microsoft.com/fwlink/?linkid=8180">Microsoft Product Support Services</a> and perform a title search for the words <b>HTTP</b> and <b>404</b>.</li>' },

# 6.x # 403
{ :status=>403, :text=>'<li>Go to <a href="http://go.microsoft.com/fwlink/?linkid=8180">Microsoft Product Support Services</a> and perform a title search for the words <b>HTTP</b> and <b>403</b>.</li>' },

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/Microsoft-IIS\/([\d\.]+)/i },

]

end

