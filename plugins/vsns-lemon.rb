##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "VSNSLemon"
authors [
  "Andrew Horton",
  # v0.2 # removed :certainty=>100 & :name
  # v0.3 # Uses :version=>//
]
version "0.3"
description "VSNS is a Very Simple News System written in PHP. VSNS Lemon vulnerabilities: http://evuln.com/vulns/106/summary.html"



# Matches #
matches [

# http://johnny.ihackstuff.com/ghdb?function=detail&id=1840
{:ghdb=>'"Powered by Vsns Lemon" intitle:"Vsns Lemon"'},
{:text=>'<p>Powered by <abbr title="very simple news system">'},

{:regexp=>/<a[^>]+title="Blog powered by VSNS Lemon">/},

{:certainty=>50, :regexp=>/<div id="vsns-(inner|container)">/},

{:regexp=>/<img[^>]+alt="VSNS Lemon"[^>]+title="Blog powered by VSNS Lemon"/},

{:version=>/<p>Powered by <abbr title="very simple news system">VSNS<\/abbr> (Lemon) ([0-9.a-z]*) by <a href="http:\/\/tachyondecay.net\/">Tachyon<\/a>/, :offset=>1,  :name=>"powered by link" }

]


end

