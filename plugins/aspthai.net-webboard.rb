##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ASPThai_Net-Webboard"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-08-30
  # v0.2 # 2011-01-07 # Updated version detection. 
]
version "0.2"
description "ASPThai.Net Webboard"
website "http://www.aspthai.net/"

# Google results as at 2010-08-30 #
# 5 for "powered by ASPThai.Net Webboard version"

# Dorks #
dorks [
'"powered by ASPThai.Net Webboard version"'
]



# Matches #
matches [

# meta copyright text
{ :text=>'<meta name="copyright" content="Copyright (C) 2002-2005 Supap Wanawan" />' },

# Version Detection # Powered by text
{ :version=>/  <br \/><br \/><span class="text" style="font-size:10px">Powered by <a href="http:\/\/www.aspthai.net\/" target="_blank" style="font-size:10px">ASPThai.Net Webboard<\/a> version ([\d\.]+)<\/span><br \/>/ },

# Version Detection # HTML comment
{ :version=>/<!-- ASPThai.Net Webboard ver. ([\d\.]+) is written and produced by Supap Wanawan/ },

]

end

