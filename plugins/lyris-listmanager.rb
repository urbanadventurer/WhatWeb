##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Lyris-ListManager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-21
version "0.1"
description "Lyris ListManager email marketing software is a secure, installed solution with email deliverability and reporting"
website "http://www.lyris.com/solutions/listmanager/"

# Google results as at 2011-03-21 #
# 233 for inurl:lyris.pl filetype:pl

# Dorks #
dorks [
'inurl:lyris.pl filetype:pl'
]



# Matches #
matches [

# Version Detection # HTML Comment
{ :version=>/<!-- page: [^,]+, version: (Lyris )?ListManager(SQL)? (LINUX|WIN32) [^>]*version ([^-]+) - [A-Z][a-z]{2} [\d]{1,2} [\d]{4}( [\d]{2}:[\d]{2}:[\d]{2})?, interface:/, :offset=>3 },

# OS Detection # HTML Comment
{ :os=>/<!-- page: [^,]+, version: (Lyris )?ListManager(SQL)? (LINUX|WIN32) [^>]*version ([^-]+) - [A-Z][a-z]{2} [\d]{1,2} [\d]{4}( [\d]{2}:[\d]{2}:[\d]{2})?, interface:/, :offset=>2 },

# Local File Path Detection # HTML Comment
{ :filepath=>/<!-- this page created by: '([^'^\(]+)', line: [\d]+, package: 'lweb' -->/ },

# Version Detection # HTML Comment
{ :version=>/<!-- (Lyris )?List[\s]*Manager (WIN32|LINUX) version ([^\/]+) (- [A-Z][a-z]{2} [\d]{1,2} [\d]{4})?( [\d]{2}:[\d]{2}:[\d]{2})?\/ lyrispg.pl version [^>]+ -->/, :offset=>2 },

# OS Detection # HTML Comment
{ :os=>/<!-- (Lyris )?List[\s]*Manager (WIN32|LINUX) version ([^\/]+) (- [A-Z][a-z]{2} [\d]{1,2} [\d]{4})?( [\d]{2}:[\d]{2}:[\d]{2})?\/ lyrispg.pl version [^>]+ -->/, :offset=>1 },

# hidden input
{ :regexp=>/<INPUT TYPE="hidden" NAME="check_code" VALUE="[^"^>]+">/ },

# Server is currently unavailable
{ :text=>'<html><h3>This Lyris ListManager Server is currently unavailable.<br>' },

# Menu HTML
{ :text=>'<font face="Arial, Helvetica, sans-serif" color="#000000"><b><i>Main Menu</i></b></font><br>' },

]

end


