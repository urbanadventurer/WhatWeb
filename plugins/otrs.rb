##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Open-Source-Ticket-Request-System"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-06
  # v0.2 # Updated matches and version detection. 
]
version "0.2"
description "OTRS is an Open source Ticket Request System (also well known as trouble ticket system) with many features to manage customer telephone calls and e-mails."
website "http://otrs.org/"

# About 529 results for "Powered by OTRS" inurl:customer.pl @ 2010-60-06

# Dorks #
dorks [
'"Powered by OTRS" inurl:customer.pl'
]



matches [

# GHDB Match
{ :ghdb=>'"Powered by OTRS" inurl:customer.pl', :certainty=>75 },

# Default title
{ :text=>'<title>OTRS  :: Login</title>' },

# Version detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/otrs.org[\/]*" class="small">OTRS ([^<]+)<\/a>/ },

]

end

