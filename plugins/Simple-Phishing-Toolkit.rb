##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Simple-Phishing-Toolkit" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-12
version "0.1"
description "Simple Phishing Toolkit (SPT)"
website "http://www.sptoolkit.com/project/"

# Google results as at 2012-08-12 #
# 2 for intitle:"spt - simple phishing toolkit" "forgot password"
# 2 for intitle:"spt - simple phishing toolkit" "Installation files still exist!"

# Dorks #
dorks [
'intitle:"spt - simple phishing toolkit" "forgot password"'
]



# Matches #
matches [

# div id="browser_warning"
{ :text=>'<div id="browser_warning">You are running a web browser that has not been tested...Try the latest version of <a href="http://google.com/chrome">Google Chrome</a>, <a href="http://microsoft.com/ie">Microsoft Internet Explorer</a> or <a href="http://mozilla.org/firefox">Mozilla Firefox</a></div>' },

# Meta Description
{ :text=>'<meta name="description" content="welcome to spt - simple phishing toolkit.  spt is a super simple but powerful phishing toolkit." />' },

# Title
{ :certainty=>75, :text=>'<title>spt - simple phishing toolkit</title>' },

# Version Detection # ~0.4x
{ :version=>/<span id="spt"><a href="http:\/\/www\.sptoolkit\.com\/download\/" target="_blank">v([^\s^<]+)/ },

]

end

