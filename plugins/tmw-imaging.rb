##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TMW-Imaging" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-11-16
version "0.1"
description "TMW Imaging - Document management system"
website "http://www.tmwsystems.com/imaging"

# ShodanHQ results as at 2012-11-16 #
# 9 for TMWImagingSession



# Matches #
matches [

# Version Detection # /cgi-bin/img-system-status.pl?server
{ :url=>"/cgi-bin/img-system-status.pl?server", :version=>/<TD>TMW Imaging Version<\/TD>\s+<TD>([^\s^<]+)<\/TD>/ },

# Set-Cookie # TMWImagingSession
{ :search=>"headers[set-cookie]", :regexp=>/TMWImagingSession=[^;]+/ },

# HTML Comments
{ :text=>'<!-- TMW Document Imaging -->' },
{ :text=>'<!-- HTML Library is $Id: TmwHTML.pm' },

]

end

