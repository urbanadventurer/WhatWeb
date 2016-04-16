##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpMySport" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-01
version "0.1"
description "PhpMySport is an open source software designed for all sport clubs and leagues which want to easily create and manage their website."
website "phpmysport.sourceforge.net"

# Google results as at 2011-02-01 #
# 9 for intext:"Powered by phpMySport" -intext

# Dorks #
dorks [
'intext:"Powered by phpMySport" -intext'
]



# Matches #
matches [

# Powered by text
{ :text=>'Powered by phpMySport <a href="http://phpmysport.sourceforge.net" title="phpMySport">' },

# Powered by logo HTML
{ :text=>'<a href="http://phpmysport.sourceforge.net" title="phpMySport">', :certainty=>25 },

# Powered by footer
{ :text=>'<div id="footer">R&eacute;alisation phpMySport' },

# Default logo HTML
{ :text=>'/tpl_image/by_phpmysport.gif" border="0"' },

]

end


