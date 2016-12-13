##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-18 #
# Updated version detection
##
Plugin.define "PHP-Layers" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.2"
description 'PHP Layers Menu is a hierarchical menu system to prepare "on the fly" DHTML menus relying on the PHP scripting engine for the processing of data items."
website "http://phplayersmenu.sourceforge.net'

# Google results as at 2010-06-13 #
# 33 for "Powered by PHP Layers"

# Dorks #
dorks [
'"Powered by PHP Layers"'
]



# Matches #
matches [

# GHDB: "Powered by PHP Layers"
{ :certainty=>75, :ghdb=>'"Powered by PHP Layers"' },

# Default JavaScript Comment
{ :text=>"// because Konqueror 3 sets IE = 1 ... AAAAAAAAAARGHHH!!!" },

# Default logo HTML
{ :text=>'.png" alt="Powered by PHP Layers Menu" height="31" width="88" /></a>' },

# Version Detection # HTML Comment
{ :version=>/<!-- end of menu header - PHP Layers Menu ([^\s]+) \(C\) [0-9]{4}-[0-9]{4} Marco Pratesi/ },

# Version Detection # JavaScript Comment
{ :version=>/\/\/ PHP Layers Menu ([^\s]+) \(C\) [0-9]{4}-[0-9]{4} Marco Pratesi/ },

]

end

