##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-08-23 # Brendan Coles <bcoles@gmail.com>
# Added version detection and google dorks
##
Plugin.define "AvantFAX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-10
version "0.2"
description "AvantFAX is a web application for managing faxes on HylaFAX fax servers. - Homepage: http://avantfax.com/"

# ShodanHQ results as at 2011-05-10 #
# 216 for AvantFAX

# Google results as at 2011-08-23 #
# 18 for "avantfax login" "Enter your username and password to access the fax interface."

# Dorks #
dorks [
'"avantfax login" "Enter your username and password to access the fax interface."'
]

# Examples #
examples %w|
213.155.192.10
205.134.248.165
95.39.23.118
216.30.213.178
77.38.12.137
94.100.70.33
188.130.75.245avantfax
ns3.callipigia.com
4all.lvtestavantfax
neselresummesreeaai.perta.it
novella.it
|

# Matches #
matches [

# Meta description
{ :text=>'<meta name="description" content="Web 2.0 HylaFAX management" />' },

# Password input HTML
{ :text=>'</label><br /><br /><input type="password" name="password" id="password" style="width: 12em" maxlength="15" /></p><br />' },

# AvantFAX Cookie
{ :search=>"headers[set-cookie]", :regexp=>/AvantFAX=[a-z\d]{26}; path=\// },

# Version Detection # Login page
{ :version=>/<p><a href="http:\/\/www\.avantfax\.com" target="_blank"><img src="images\/avantfax-big\.png" border="0" alt="AvantFAX" \/><\/a><\/p>[\s]+<p align="center">([^\s^<]+)<\/p>/ },

]

end

