##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zabbix" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-25
version "0.1"
description "Zabbix is an enterprise-class open source distributed monitoring solution for networks and applications."
website "http://www.zabbix.com/"

# Google results as at 2011-11-25 #
# 229 for "Zabbix * Copyright * by SIA Zabbix"
# 196 for inurl:"tr_status.php?sid=" intitle:"refreshed every"
# 122 for inurl:"srv_status.php?sid=" intitle:"refreshed every"

# Dorks #
dorks [
'"Zabbix * Copyright * by SIA Zabbix"',
'inurl:"tr_status.php?sid=" intitle:"refreshed every"'
]



# Matches #
matches [

# Version Detection # JavaScript
{ :version=>/<script type="text\/javascript" src="jsLoader\.php\?ver=([^\s&]+)&lang=en_[a-zA-Z]{2}"><\/script>/ },

# Version Detection # Powered by footer # 1.8.x
{ :version=>/<td class="page_footer_l">[\s]*<a class="highlight" href="http:\/\/www\.zabbix\.com">Zabbix&nbsp;([^\s&]+)&nbsp;Copyright 2001-20[\d]{2} by&nbsp;SIA Zabbix<\/a><\/td>/ },

# Version Detection # Powered by footer # 1.9.x+
{ :version=>/<a class="highlight" href="http:\/\/www\.zabbix\.com">Zabbix ([^\s]+) Copyright 2001-20[\d]{2} by Zabbix SIA<\/a>/ },

# Version Detection # Powered by footer # early versions
{ :version=>/<a href="http:\/\/www\.zabbix\.com" class="highlight">ZABBIX ([^\s<]+)<\/a>&nbsp;Copyright 2001-20[\d]{2} by <a href="http:\/\/www\.zabbix\.com" class="highlight">SIA Zabbix<\/a>/ },

]

end

