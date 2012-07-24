##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ChiliProject" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-24
version "0.1"
description "ChiliProject is a web based project management system. - Homepage: https://www.chiliproject.org/"

# ShodanHQ results as at 2012-07-24 #
# 25 for _chiliproject_session

# Google results as at 2012-07-24 #
# 113 for "Powered by ChiliProject" intitle:"ChiliProject" -site:chiliproject.org

# Dorks #
dorks [
'"Powered by ChiliProject" intitle:"ChiliProject" -site:chiliproject.org'
]

# Examples #
examples %w|
81.252.167.65
129.132.27.201
140.211.169.171
78.47.114.189
130.83.160.73
173.255.246.180
85.214.238.37
demo.chiliproject.org
www.sourcemage.org
issues.webos-ports.org
yourhosts.org
chiliproject.tetaneutral.net
https://projects.littlestreamsoftware.com
https://issues.gitorious.org
https://chiliproject.finn.de
https://chili.descom-consulting.ch
|

# Matches #
matches [

# Powered by link
{ :text=>'Powered by <a href="https://www.chiliproject.org/">ChiliProject</a>' },

# Meta Description
{ :text=>'<meta name="description" content="ChiliProject" />' },

# HTML Comment
{ :text=>'<!-- page specific tags -->' },

# Help Link # Version Detection
{ :version=>/<li><a href="https:\/\/www\.chiliproject\.org\/help\/v([^\s^"]+)" class="help">/ },

# Set-Cookie # _chiliproject_session
{ :search=>"headers[set-cookie]", :regexp=>/_chiliproject_session=/ },

]

end

