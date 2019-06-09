##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "360-Web-Manager"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-12
  # v0.2 # Updated regex and version detection. 
]
version "0.2"
description "360-Web-Manager"
website "http://www.360webmanager.com"

# About 36,800 results for "powered by 360 Web Manager" @ 2010-06-12

matches [

# Powered by text
{ :ghdb=>'"powered by 360 Web Manager"', :certainty=>75 },

# Redirect page
{ :regexp=>/360WebManager Software :: administrador contenidos web/, :certainty=>75 },

# Version detection # Powered by text
{ :version=>/<div align="center"><span class="copyr">Powered by <a href="http:\/\/www.360webmanager.com" target="_blank" class="copyrlink">360 Web Manager<\/a> ([\d\.]+)/ },

]

end

