##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Funkwerk-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-24
version "0.1"
description "Funkwerk Gateway"
website "http://www.funkwerk-ec.com/"

# Google results as at 2011-11-24 #
# 36 for intitle:"Funkwerk * Home Page" "Initial Configuration" "Advanced Configuration"

# Dorks #
dorks [
'intitle:"Funkwerk * Home Page" "Initial Configuration" "Advanced Configuration"'
]



# Matches #
matches [

# HTTP Header # Server
{ :search=>"headers[server]", :regexp=>/^fec\/[\d\.]+ \(Funkwerk BOSS\)$/ },

# / # System Name
{ :string=>/Welcome to your Funkwerk Gateway <b>([^<]+)<\/b>\.<\/font><br><\/td><\/tr><\/tbody><\/table><\/blockquote>/ },

# /state # System Name
{ :url=>"/state", :string=>/<TR>[\s]+<TD BGCOLOR="#C0C0C0">System Name<\/TD>[\s]+<TD><FONT COLOR="#0000FF">([^<]+)<\/FONT><BR><\/TD>/ },

# /state # Model Detection
{ :url=>"/state", :model=>/<TR>[\s]+<TD BGCOLOR="#C0C0C0">Type of System<\/TD>[\s]+<TD><FONT COLOR="#0000FF">([^<]+)<\/FONT><BR><\/TD>/ },

# /state # Version Detection
{ :url=>"/state", :version=>/<TR>[\s]+<TD BGCOLOR="#C0C0C0">Software<\/TD>[\s]+<TD><FONT COLOR="#0000FF">V\.(.+) IPSec from [\d]{4}\/[\d]{2}\/[\d]{2} [\d]{2}:[\d]{2}:[\d]{2}<\/FONT><BR><\/TD>/ },

]

end

