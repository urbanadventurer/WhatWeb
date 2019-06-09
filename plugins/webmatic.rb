##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Webmatic"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-08-29
  # v0.2 # 2011-02-19 # Updated version detection. 
]
version "0.2"
description "Webmatic CMS"
website "http://www.webmatic.it/it/"

# Google results as at 2010-08-29 #
# 173 for "powered by Webmatic"



# Macthes #
matches [

# Powered by text
{ :text=>'Powered&nbsp;by&nbsp;<a href="http://www.webmatic.it">Webmatic</a>' },

# Version Detection # Powered by text
{ :version=>/ href="http:\/\/www.valarsoft.com"[^>]+>Powered by: Webmatic ([^<]+)<\/a>/i },

]

end

