##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # Brendan Coles <bcoles@gmail.com>
# Updated random string generation
# Changed :string to :name
##
Plugin.define "Fortinet-Firewall" do
author "Aung Khant, http://yehg.net"
version "0.2"
description "Detect Fortinet-Firewall Web Interface usually running on port 443 - Homepage: http://www.fortinet.com/"

# Examples #
examples %w|

|

# Matches #
matches [

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

# Examples cookies:
#    Set-Cookie: APSCOOKIE=0&0; path=/; expires=Sun, 06-Nov-1960 06:12:35 GMT
#    Set-Cookie: log_filters=; path=/log/; expires=Sun, 06-Nov-1960 06:12:35 GMT

	# APSCOOKIE and log_filters cookies
	cookie = @headers['set-cookie'] if @headers.keys.include?('set-cookie')
	if cookie =~ /APSCOOKIE=/ and cookie =~ /log_filters=/
		m << {:name=>'HTTP Cookie'}
	end

	# Return passive matches
	m
end

end

