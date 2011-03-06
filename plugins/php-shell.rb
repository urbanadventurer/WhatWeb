##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Fixed regex
##
Plugin.define "PHP-Shell" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.2"
description "php remote shell and file explorer"

# http://johnny.ihackstuff.com/ghdb/?function=detail&id=833
# About 48 results for +filetype:php +HAXPLORER +"Server Files Browser" +Browsing +"Script Location" @ 2010-06-06
examples %w|
www.raveneye1.com/1.php
www.s-solution.sk/honey/filemanager/1.php
www.amorphias.com/mc.php
www.nwo.net/hh/1.php
www.abyss.cba.pl/hnpt/haxplorer/1.php
www.island.net/~zapper/cgi.php
|

matches [

# GHDB Match
{ :ghdb=>'+filetype:php +HAXPLORER +"Server Files Browser" +Browsing +"Script Location"', :certainty=>75 },

# Version detection
{ :version=>/PHPShell by [a-zA-Z0-9]+ - Version ([0-9a-z\.]+)/ },

]

end


