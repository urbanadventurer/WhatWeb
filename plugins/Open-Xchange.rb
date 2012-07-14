##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Open-Xchange" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-14
version "0.1"
description "Open-Xchange mail server - Homepage: http://www.open-xchange.com/"

# ShodanHQ results as at 2012-07-14 #
# 38 for Location ox6/ox.html

# Google results as at 2012-07-14 #
# 41 for inurl:"ox6/ox.html"
# 32 for "You need to enable JavaScript to access the Open-Xchange Server." +Version inurl:ox

# Dorks #
dorks [
'inurl:"ox6/ox.html"',
'"You need to enable JavaScript to access the Open-Xchange Server." +Version inurl:ox'
]

# Examples #
examples %w|
https://email.1and1.com/ox6/ox.html
http://amadigi.net/
https://www.mailxchange.de/ox6/
http://webmailer.co/ox6/ox.html
https://webmail.westcoastcloud.com/ox6/ox.html
https://webmail.eva.mpg.de/ox6/
http://hyperion.demo-openxchange.fr/ox/
http://ox.web-vision.de/ox6/
https://ox.ips-gruppe.de/
https://www.rheinahrcampus.de/ox/ox6/
https://webmail.hostpoint.ch/ox.html
https://webmail.ecloudpanel.com/ox6/ox.html
192.109.135.30
81.221.32.68
81.26.175.25
66.96.128.85
194.94.224.6
84.124.29.114
66.96.141.35
217.79.216.216
|

# Matches #
matches [

# noscriptmsg
{ :text=>'<noscript><div class="noscriptmsg">You need to enable JavaScript to access the Open-Xchange Server.' },

# browserchecktextnormal
{ :text=>'<td class="browserchecktextnormal" id="browserchecktext_id">You need to enable JavaScript to access the Open-Xchange Server.' },

# Version Detection
{ :version=>/<div class="login-bottomline">\W+<span id="[a-z]\d+[a-z]\d+">Version<\/span>\s+:\W+([^\s]+\W+[^\W]+)/ },

# Location # ox6/ox.html # 6.x
{ :certainty=>75, :search=>"headers[location]", :regexp=>/^https?:\/\/[^\/]+\/ox6\/ox\.html$/, :version=>"6.x" },

]

end

