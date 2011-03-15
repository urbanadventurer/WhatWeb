##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cype-MSCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Cype MSCMS - a CMS for managing MapleStory server stats - http://cypedev.com/"

# Google results as at 2011-03-15 #
# 30 for intitle:"Powered By Cype" intext:"Powered By Cype MSCMS"

# Examples #
examples %w|
z99.no-ip.org
hellms.no-ip.org
www.jacems.com
71.224.180.150:8080
the.nisusms.com
nonamems.comuf.com
www.ms-u.co.il
finaldev.netai.net
piratesms.comoj.com
katlamaple.co.il
|

# Matches #
matches [

# Title
{ :certainty=>25, :regexp=>/<title>[^\(^<]+ \(Powered by Cype\)<\/title>/ },

# Meta Author
{ :text=>'<meta name="author" content="cypedev.com" />' },

# MapleStory copyright notice
{ :text=>"<li><i>All images and other contents related to <a href='http://maplestory.com/' target='_blank'>MapleStory</a>&trade; are owned by <a href='http://nexon.net/' target='_blank'>Nexon Corporation</a></i><br /></li>" },

# Version Detection # Powered by link
{ :version=>/<li>Powered By Cype MSCMS ([\d\.]+) &copy; 20[\d]{2} <a href="http:\/\/www.imurad.net" target="_blank">CypeDEV\/iMurad.net<\/a><br \/><\/li>/ },

# Version Detection # Powered by link
{ :version=>/<li>Powered By Cype MSCMS ([\d\.]+) &copy; 20[\d]{2} <a href="http:\/\/www.cypedev.com" target="_blank">Cype Developments<\/a><br \/><\/li>/ },

]

end


