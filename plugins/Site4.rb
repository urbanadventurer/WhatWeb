##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Site4" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "Site4 is a danish CMS system for webshops and homepages."
website "http://www.Site4.dk/"

# 4 results for "SITE4.dk is a danish CMS system for webshops and homepages."


matches [

# Error Page # Default Title # Danish
{ :path=>"/error.asp", :text=>'<title>SITE4.dk Site4 Setup Error..</title>' },

# Error page # Default logo HTML
{ :text=>'<img src="http://www.site4.dk/images/site4logo.jpg">
' },

# Error page # Error message
{ :text=>'<div class="caption" align="center"><b>A Site4 event or error occured..</b></div></td>' },

# Error page # To read more text
{ :text=>'To read more about SITE4.dk please <a class="smalltext" style="text-decoration:none;" href="http://www.site4.dk"><b>click here</b></a>' },

]

end

