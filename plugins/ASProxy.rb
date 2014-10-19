##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ASProxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-25
version "0.1"
description "ASProxy is a free and open-source web proxy which allows the user to surf the net anonymously."
website "http://asproxy.sourceforge.net/"

# Google results as at 2011-05-25 #
# 26 for "Surf the web with ASProxy" inurl:(surf|noscript)
# 12 for "Surf the web with ASProxy" inurl:(surf|noscript) inurl:B6X!

# Dorks #
dorks [
'"Surf the web with ASProxy" inurl:(surf|noscript)'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- Surf the web invisibly using ASProxy power. A Powerfull web proxy is in your hands. -->' },
{ :text=>'<!--This is ASProxy powered by SalarSoft. -->' },

# input button id="btnASProxyDisplayButton"
{ :text=>'<input type="button" onclick="_Page_SubmitForm()" value="Display" id="btnASProxyDisplayButton" class="Button" />' },

# Version Detection
{ :version=>/asproxydone="2"(\ style="font-weight:[\s]*bold;[\s]*text-decoration:[\s]*none")?>ASProxy ([^\s^<]+)<\/a>/, :offset=>1 },

]

end

