##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ClipBucket" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-18
version "0.1"
description "ClipBucket is an OpenSource Multimedia Management Script"
website "http://clip-bucket.com"

# ShodanHQ  results as at 2012-01-18 #
# 193 for pageredir

# Google results as at 2012-01-18 #
# 370 for "Forged by ClipBucket"

# Dorks #
dorks [
'"Forged by ClipBucket"'
]



# Matches #
matches [

# Meta Copyright
{ :string=>/<meta name="copyright" content="ClipBucket - PHPBucket ClipBucket 2007 - (20[\d]{2})" \/>/ },

# Meta Author
{ :text=>'<meta name="author" content="Arslan Hassan - http://clip-bucket.com/arslan-hassan" />' },

# HTML Comments # Version Detection
{ :text=>'<!-- ClipBucket v2 -->', :version=>"2.x" },
{ :version=>/<!-- ClipBucket version ([\d\.]+) -->/ },

# HTML Comments
{ :text=>'<!-- Setting Template Variables -->' },
{ :text=>'<!-- Forged by ClipBucket -->' },
{ :text=>'<!-- Forged by ClipBucket ends -->' },
{ :text=>'<!-- Please do not remove this unless you have license -->' },

# Forged by ClipBucket
{ :text=>'Forged by <a href="http://clip-bucket.com/">ClipBucket</a>' },

# Set-Cookie # pageredir
{ :search=>"headers[set-cookie]", :regexp=>/pageredir=https?%3A%2F%2F/, :certainty=>25 },

]

end

