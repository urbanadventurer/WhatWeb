##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-09-14 # Brendan Coles <bcoles@gmail.com>
# Updated random string generation
# Updated cookie match
# Changed :string to :name
# Added JavaScript match, aggressive image match and google dork
##
Plugin.define "Fortinet-Firewall" do
author "Aung Khant, http://yehg.net"
version "0.2"
description "Fortinet firewall technology combines ASIC-accelerated stateful inspection with an arsenal of integrated application security engines to quickly identify and block complex threats."
website "http://www.fortinet.com/solutions/firewall.html"

# Google results as at 2011-09-14 #
# 8 for intitle:"Please Login" "Warning: this page requires Javascript. To correctly view, please enable it in your browser."

# Dorks #
dorks [
'intitle:"Please Login" "Warning: this page requires Javascript. To correctly view, please enable it in your browser."'
]



# Matches #
matches [

# Redirect Page # /index.html
{ :certainty=>75, :url=>"/", :md5=>"c647dc149f55829659640751e9184f8c" },
{ :certainty=>75, :url=>"/index.html", :md5=>"c647dc149f55829659640751e9184f8c" },

# JavaScript # /login
{ :url=>"/login", :certainty=>75, :regexp=>/str_table\.token_needed = "Please input your token code.";[\s]+str_table\.ncode_needed = "FortiToken clock drift detected\. Please input the next code and continue\.";[\s]+str_table\.mail_token_msg = "An email message containing a Token Code will be sent to";/ },

# Aggressive # /images/logon_merge.gif
#{:url=>"/images/logon_merge.gif", :md5=>"3955ddaf1229f63f94f4a20781b3ade4" },

# Aggressive # login.js?nocache= + 8 random characters # MD5
{:url=>'login.js?nocache='+rand(36**8).to_s(36), :name=>'Login.js MD5 Hash', :md5=>'6032999e08978b317d8382249866232a'},

# Aggressive # login.js?nocache= + 8 random characters # Copyright text
{:url=>'login.js?nocache='+rand(36**8).to_s(36), :name=>'Login.js Copyright Text',:regex=>/login.js(\n|\r\n)Copyright Fortinet, Inc\.(\n|\r\n)All rights reserved\./},

# Aggressive # login # MD5
{:url=>'login', :name=>'Login page MD5 hash', :md5=>'8bc0d101e3a25c98a9cbcf18240bd271'},

# Aggressive # success # MD5
{:url=>'success', :name=>'Success Page MD5', :md5=>'1451298ccf3a24e342b20e6684cbb0dc'},

]

# Passive #
def passive
	m=[]

	# APSCOOKIE and log_filters cookies
	cookie = @headers['set-cookie'] if @headers.keys.include?('set-cookie')
	if cookie =~ /APSCOOKIE(_[\d]+)?=/ and cookie =~ /log_filters=/
		m << {:name=>'HTTP Cookie'}
	end

	# Return passive matches
	m
end

end

