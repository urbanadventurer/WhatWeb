##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AutoIndex-PHP-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-30
version "0.1"
description "AutoIndex PHP Script - A Website Directory Indexer and File Manager"
website "autoindex.sourceforge.net"

# Dorks #
dorks [
'"Powered by AutoIndex PHP Script"'
]



# Matches #
matches [

# Default JavaScript
{ :text=>'<link rel="stylesheet" href="/stylesheet.css" type="text/css" title="AutoIndex Default" />' },
{ :text=>'<link href="./templates/default/default.css" rel="stylesheet" title="AutoIndex Default" type="text/css" />' },
{ :text=>'<link href="./templates/default/alternate.css" rel="alternate stylesheet" title="AutoIndex Alternate" type="text/css" />' },

# Powered by footer
{ :text=>'<div class="small" style="text-align: right;">Powered by <a class="default_a" href="autoindex.sourceforge.net/">AutoIndex PHP Script</a></div>' },
{ :text=>'<div class="autoindex_small" style="text-align: right;">Powered by <a class="autoindex_a" href="autoindex.sourceforge.net/" target="_blank">AutoIndex PHP Script</a></div>' },

# Version Detection # HTML Comment
{ :version=>/<!--[\r\n]*Powered by AutoIndex PHP Script \(version ([\d\.]+)\)[\r\n]*Copyright \(C\) 2002-[\d]{4} Justin Hagstrom[\r\n]*http:\/\/autoindex.sourceforge.net[\/]?/ },

]

end


