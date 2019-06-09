##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "PHP-Link-Directory"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-13 
  # v0.2 # Fixed regex. 
]
version "0.2"
description "phpLD is the most widely used directory script on the internet, installed on over 100,000 websites. phpLD is a great addition to any site, and is easy to install."
website "http://www.phplinkdirectory.com/"

# 186 results for "powered by phpLinkDirectory" @ 2010-08-07

# Dorks #
dorks [
'"powered by phpLinkDirectory"'
]



matches [

# Powered by text
{ :ghdb=>'"powered by phpLinkDirectory"', :certainty=>25 },
{ :regexp=>/<a href="http:\/\/www.phplinkdirectory.com[^>]*Phplinkdirectory/i },

# Version detection # Meta generator
{ :version=>/<meta name="generator"[^>]*content="PHP Link Directory ([0-9\.]+)"/ },

]

end

