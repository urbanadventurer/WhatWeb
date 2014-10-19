##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cachelogic-Expired-Domains-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-20
version "0.1"
description "Expired Domains Script runs daily and updates the database with the latest expiring domains. Requires: Unix Host, PHP5, MYSQL5, CURL Enabled, Cron, Support for the zip extension in PHP."
website "http://cachelogic.net/"

# Google results as at 2011-03-20 #
# 40 for "Developed by Cachelogic.net" "Domain contains(keyword):" "All TLDs" -inurl:"cachelogic.net"
# 36 for allinurl:page domain ext filter hyphen numbers ncharacter

# Dorks #
dorks [
'"Developed by Cachelogic.net" "Domain contains(keyword):" "All TLDs" -inurl:"cachelogic.net"',
'allinurl:page domain ext filter hyphen numbers ncharacter'
]



# Matches #
matches [

# searchdays select options
{ :text=>'<option value="30">Last 30 days</option><option value="21">Last 21 days</option><option value="14">Last 14 days</option><option value="7">Last 7 days</option><option value="6">Last 6 days</option><option value="5">Last 5 days</option><option value="4">Last 4 days</option><option value="3">Last 3 days</option><option value="2">Last 2 days</option><option value="1">Last 1 days</option>' },

# ncharacters select options
{ :text=>'<option value="15">15</option><option value="12">12</option><option value="10">10</option><option value="8">8</option><option value="7">7</option><option value="6">6</option><option value="5">5</option><option value="4">4</option><option value="3">3</option><option value="2">2</option>' },

# stats.php
{ :text=>'<br><br><br>Website is powered by <a href="http://cachelogic.net">Cachelogic.net</a>' },

# HTML Comment # Free Edition
{ :string=>"Free", :text=>"<!-- Please do not remove. It is illegal to remove this footer in Cachelogic Expired Domains Free Edition-->" },

# Cachelogic.net Link
{ :text=>'href="http://cachelogic.net">Cachelogic.net</a></td></tr>' },

]

end


