##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DotA-OpenStats" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-19
version "0.1"
description "DotA OpenStats - MySQL based web statistics site for DotA games. - Requires PHP and MySQL"
website "https://sourceforge.net/projects/dotaopenstats/"

# Google results as at 2011-12-19 #
# 142 for intitle:"DotA OpenStats" "2011 Powered by DotA OpenStats" -dork

# Dorks #
dorks [
'intitle:"DotA OpenStats" "2011 Powered by DotA OpenStats" -dork'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="dota OpenStats" />' },

# Meta Copyright
{ :text=>'<meta name="copyright" content="openstats.iz.rs" />' },

# Logo
{ :text=>"<img alt='' width='16' height='16' style='vertical-align:middle' src='./style/dota/img/logo.png' />" },

# Powered by link
{ :string=>/&copy; (20[\d]{2}) Powered by <a target="_blank" href="http:\/\/openstats\.iz\.rs">DotA OpenStats<\/a>/ },

]

end

