##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GridSite" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-31
version "0.1"
description "In its simplest application, GridSite uses X.509 certificates loaded into unmodified versions of web browsers like Internet Explorer, Netscape or Mozilla to authenticate users, and then grants read and write authorization on this basis. HTML and text files can be edited within a browser window, or pages and binary files can be uploaded from local disk. Certificate based authentification of users is now far more practical with the start of large scale issuing of X.509 certificates within Grid projects."
website "http://www.gridsite.org/"

# Google results as at 2011-01-31 #
# 87,100 for inurl:gridsite-admin.cgi filetype:cgi -inurl

# Dorks #
dorks [
'inurl:gridsite-admin.cgi filetype:cgi -inurl'
]



# Matches #
matches [

# Default Menu HTML
{ :text=>'<a href="gridsite-admin.cgi?cmd=history&amp;file=index.html">View&nbsp;page&nbsp;history</a>' },
{ :text=>'<a href="gridsite-admin.cgi?cmd=print&amp;file=index.html">Print&nbsp;View</a>' },

# Version Detection # Built with text
{ :version=>/Built with <a href="http:\/\/www.gridsite.org\/">GridSite<\/a>&nbsp;([\d\.]+)/ },
{ :version=>/Built with <a href="http:\/\/www.gridsite.org\/">GridSite<\/a> ([\d\.]+)/ },

# FAQ # HTML Comment
{ :text=>"<!-- start of gridsitefoot.txt -->" },

]

end


