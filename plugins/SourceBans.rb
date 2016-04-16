##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SourceBans" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-14
version "0.1"
description "SourceBans is a free global administration and banning system for Source engine based servers."
website "http://www.sourcebans.net/"

# Google results as at 2011-02-14 #
# 10 for inurl:exportbans.php
# 14 for inurl:web_upload ext:php +steam

# Dorks #
dorks [
'inurl:web_upload ext:php "steam"'
]



# Matches #
matches [

# Version Detection # Powered by footer HTML # English
{ :version=>/		<a href="http:\/\/www.sourcebans.net" target="_blank"><img src="images\/sb.png" alt="SourceBans" border="0" \/><\/a><br\/>\n		<div id="footqversion">Version ([\d\.]+) <\/div>/ },

# Default Logo HTML
{ :text=>'		<a href="http://www.sourcebans.net" target="_blank"><img src="images/sb.png" alt="SourceBans" border="0" /></a><br/>' },

# Error Message
{ :regexp=>/<div class='dbg' id='[0-9a-f]{7}'><span style='font-weight:bold'>Table '[a-z]+\.sb_settings' doesn't exist<\/span> <br \/><br \/><span>SQL Query type: <\/span><span style='font-weight:bold'>EXECUTE<\/span><span><br \/><span>/ },

]

end


