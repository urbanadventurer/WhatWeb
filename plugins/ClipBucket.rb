##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ClipBucket" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-18
version "0.1"
description "ClipBucket is an OpenSource Multimedia Management Script - Homepage: http://clip-bucket.com"

# ShodanHQ  results as at 2012-01-18 #
# 193 for pageredir

# Google results as at 2012-01-18 #
# 370 for "Forged by ClipBucket"

# Dorks #
dorks [
'"Forged by ClipBucket"'
]

# Examples #
examples %w|
clipbucket.net/v2/
clipbucket.net/v2-1/
222.189.163.250
50.61.239.246
12.158.188.207
184.107.189.20
119.75.234.225
107.22.188.73
69.57.164.58
200.20.0.88
109.235.70.116
tendancetv.us/videoclub/
brandyfans.com/vault/
vision.rcinet.ca/clipbucket_2-6/
ucsc.tv/view_page.php
libriummedia.com
clchaup.projects.si.umich.edu/clip/view_page.php
|

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

