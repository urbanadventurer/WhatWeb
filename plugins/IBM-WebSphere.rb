##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-WebSphere" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-20
version "0.1"
description "IBM WebSphere - Homepage: https://www-01.ibm.com/software/websphere/"

# ShodanHQ results as at 2011-03-13 #
# 2,176 for WebSphere

# Google results as at 2013-04-11 #
# 36 for inurl:"snoop" intitle:"Snoop Servlet" "Request method"

# Dorks #
dorks [
'inurl:"snoop" intitle:"Snoop Servlet" "Request method"'
]

# Examples #
examples %w|
60.30.108.221
210.28.216.232
111.75.206.14
216.105.250.20
218.31.157.93
209.5.145.203
150.183.158.184
www.cassaedilepg.it:7080/snoop
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^WebSphere Application Server\/([^\s]+)$/ },

# Title # Snoop Servlet
{ :text=>'<HTML><HEAD><TITLE>Snoop Servlet</TITLE></HEAD><BODY BGCOLOR="#FFFFEE">', :module=>"Snoop Servlet" },

]

end

