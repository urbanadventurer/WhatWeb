##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-23 # Brendan Coles <bcoles at gmail dot com>
# Fixed regex bug where WWW-Authenticate header is present but regex match fails
# Updated regex to accept more than one www-authenticate header
# Added examples
##
Plugin.define "WWW-Authenticate" do
author "Aung Khant, http://yehg.net" # modified by Andrew Horton
version "0.2"
description "This plugin identifies the WWW-Authenticate HTTP header and extracts the authentication method and realm."

# More info #
# http://en.wikipedia.org/wiki/Basic_access_authentication"
# http://tools.ietf.org/html/rfc2617

# ShodanHQ results as at 2011-01-23 #
# About 7,089,753 results for "www authenticate"
# About 99,620 results for "www authenticate" -realm
# About 6,718,455 for HTTP/1.0 401 Unauthorized

# Examples #
examples %w|
82.49.124.235
201.79.241.196
117.47.199.51
201.229.168.193
219.118.34.194
83.30.160.90
41.34.153.197
96.10.146.58
190.251.88.123
125.24.135.214
60.249.16.14
184.40.9.50
217.166.163.153
147.213.192.33
62.245.215.22
64.78.35.76
70.90.134.129
75.147.182.117
81.30.146.62
82.148.34.106
89.160.54.6
120.96.51.124
120.96.56.146
198.144.208.179
205.209.140.195
119.161.149.220
221.199.150.103
210.82.53.46
213.190.195.41
58.61.37.48
email.nohold.com/exchange
britishlegion.org.uk
mail.sisohamilton.org
www.remax.net
web.ttmail.com
myfairmont.com
sylvania.com
www.teamcomcast.com
backview.net
jk51.com
geojit.net
sapco.ir
collaborationhost.net
greengazette.co.za
ftpgrupocanton.com
66460.com
mobilink.net
officialmerchshop.com
gymborebel.com
rss.game.tw
techlib.com
5maiya.com
gwynedd.gov.uk
casaminas.com.br
cals.nl
health.gov.ir
topaff.com
028xinyi.com
loweconnect.com
lovepopbag.info
sageminderdemo.com
eurasianhub.org
cadopolis.com
bwatchnetworks.com
imissyoudear.com
ordercontrol.net
diqiye.com
tntpostkantoorzoeker.nl
iiisci.org
mssinergija.net
shuijingzhilian.com.cn
comparateur-automobiles.com
notaris.nl
smart.net.ph
fantasyfootballdraft.com
onix.co.jp
netput2100.familydoctor.com.cn
yhwl.net.cn
emit.biz
gograph.com
promoopcion.com
|

# Passive #
def passive
	m=[]

	# Check HTTP Header for www-authenticate
	unless @meta['www-authenticate'].nil?

		# Detect Realm
		if @meta['www-authenticate'].to_s =~ /realm=/

			# Extract Authentication Method
			m << { :module=>@meta['www-authenticate'].scan(/([a-z]{3,20})[^\r^\n]{1,256}realm="/i) } if @meta['www-authenticate'].to_s =~ /[a-z]{3,20}[^\r^\n]{1,256}realm="/i

			# Extract Authentication Realm
			m << { :string=>@meta['www-authenticate'].scan(/realm="([^\"]{1,256})"/i) } if @meta['www-authenticate'].to_s =~ /realm="[^\"]{1,256}"/i

		else

			# No Realm # Extract Authentication Method
			m << { :module=>@meta['www-authenticate'].to_s }

		end

	end

	# Return passive matches
	m

end

end


