##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 #
# Fixed Changelog version detection now prefixed with >
##
# Version 0.2 #
# remove :certainty and :name, change :regexp to :text
##
Plugin.define "phpBB" do
author "Andrew Horton"
version "0.3"
description "phpBB is a free forum"
website "http://phpbb.org/"

# Dorks #
dorks [
'"Powered by phpBB"'
]



=begin

Set-Cookie: phpbb2mysql_data=a%3A2%3A%7Bs%3A11%3A%22autologinid%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22userid%22%3Bi%3A-1%3B%7D; expires=Monday, 22-Nov-10 12:21:54 GMT; path=/
Set-Cookie: phpbb2mysql_sid=8e6085bf4b138a7576f3701370e4d2b3; path=/

Set-Cookie: ghfv3_u=1; expires=Mon, 22-Nov-2010 12:22:08 GMT; path=/; domain=.globalhardstyle.com; HttpOnly
Set-Cookie: ghfv3_k=; expires=Mon, 22-Nov-2010 12:22:08 GMT; path=/; domain=.globalhardstyle.com; HttpOnly
Set-Cookie: ghfv3_sid=77a3fe24f8b5c3327c6bdcf11e6a51dd; expires=Mon, 22-Nov-2010 12:22:08 GMT; path=/; domain=.globalhardstyle.com; HttpOnly

Set-Cookie: phpbb3_bzhya_u=1; expires=Mon, 22-Nov-2010 12:20:58 GMT; path=/; domain=.sgscwelisten.com; HttpOnly
Set-Cookie: phpbb3_bzhya_k=; expires=Mon, 22-Nov-2010 12:20:58 GMT; path=/; domain=.sgscwelisten.com; HttpOnly
Set-Cookie: phpbb3_bzhya_sid=1148a65e6041640b22c3b16044125469; expires=Mon, 22-Nov-2010 12:20:58 GMT; path=/; domain=.sgscwelisten.com; HttpOnly
=end

# Matches #
matches [

{:text=>'<!-- link rel="stylesheet" href="templates/subSilver/subSilver.css'},
{:text=>'/images/logo_phpBB.gif', :certainty=>75},
{:text=>'We request you retain the full copyright notice below including the link to www.phpbb.com.'},

{:name=>"Powered by...",
:regexp=>/Powered by <a href="http:\/\/www.phpbb.com\/"( target="_phpbb")?( class="copyright")?>phpBB<\/a>[ ]+&copy;[ 0-9,\.]+ phpBB Group/},

#Powered by <a href="http://www.phpbb.com/" target="_phpbb">phpBB</a>  &copy; phpBB Group<br />
#Powered by <a href="http://www.phpbb.com/">phpBB</a> &copy; 2000, 2002, 2005, 2007 phpBB Group
#Powered by <a href="http://www.phpbb.com/" target="_phpbb" class="copyright">phpBB</a>  &copy; 2001, 2002 phpBB Group
#Powered by <a href="http://www.phpbb.com/" target="_phpbb" class="copyright">phpBB</a> &copy; 2001, 2005 phpBB Group

{:name=>"folder icons",
:regexp=>/<td width="20" align="center"><img src="[^"]+images\/folder_new_big.gif" alt="New posts"\/><\/td>/}, # "

{:name=>"In total there are x users online ::",
:regexp=>/In total there are <b>[0-9]+<\/b> users online :: [0-9]+ Registered, [0-9]+ Hidden and [0-9]+ Guests/},

# Version Detection # Cookie
{ :search=>"headers[set-cookie]", :version=>/phpbb([\d])mysql_(data=a%3A|sid=[a-f\d]{32};)/ },

]

# Passive #
def passive
	m=[]

	if @headers["set-cookie"] =~ /([^ ]+)_u=1; expires/
		p=@headers["set-cookie"].scan(/([^ ]+)_u=1; expires/).flatten.first
		m << {:name=>"phpbb3 _u, _k, _sid cookies", :version=>"3" } if @headers["set-cookie"] =~ /#{p}_u=.*#{p}_k=.*#{p}_sid=[0-9a-z]{32}/
	end

	# Return passive matches
	m
end

# Aggressive #
def aggressive
	m=[]

	target = URI.join(@base_uri.to_s,"docs/CHANGELOG.html").to_s
	status,url,ip,body,headers=open_target(target)
	
	unless body.nil?
		# /docs/CHANGELOG.html
		# <li><a href="#v303">Changes since 3.0.3</a></li>
		# <li><a href="#2018">Changes since 2.0.18</a></li>
		if body =~ /<li><a href="[^"]+">Changes since ([0-9\.]+)<\/a><\/li>/
			v=body.scan(/<li><a href="[^"]+">Changes since ([0-9\.]+)<\/a><\/li>/).flatten.first
			m << {:name=>"phpbb changelog", :version=>">"+v }
		end
	end

	# Return aggressive matches	
	m
end

end


=begin

# MD5 Hash Reference #

{ :md5=>'3a3a98deb01ca9a41d60d0cd30f61e22', :version=>'2.0.4', :path=>'docs/CHANGELOG.html' },
{ :md5=>'d469f1cee34e4fb55f265bec0f0c14a8', :version=>'2.0.5', :path=>'docs/CHANGELOG.html' },
{ :md5=>'5905fc107b1a68762ac0d06c0fecc7b9', :version=>'2.0.6', :path=>'docs/CHANGELOG.html' },
{ :md5=>'7e9a7f6fb9aa3fc3debbdc09ca1941de', :version=>'2.0.7', :path=>'docs/CHANGELOG.html' },
{ :md5=>'d0406ed8e5cf4bd82192f3c88bb7fcd2', :version=>'2.0.8', :path=>'docs/CHANGELOG.html' },
{ :md5=>'734f0ecaeb1dc40ce64c1af60d082dcc', :version=>'2.0.8a', :path=>'docs/CHANGELOG.html' },
{ :md5=>'603328ab56f740a8eba90d435132da9f', :version=>'2.0.9', :path=>'docs/CHANGELOG.html' },
{ :md5=>'6dca72f720e5fd098e33e06ff7617bc2', :version=>'2.0.10', :path=>'docs/CHANGELOG.html' },
{ :md5=>'1e11b01aac9fe84682596d2fa38c9265', :version=>'2.0.11', :path=>'docs/CHANGELOG.html' },
{ :md5=>'7262663177c2cb9440a3250989de1847', :version=>'2.0.12', :path=>'docs/CHANGELOG.html' },
{ :md5=>'11771948789983e496646c12eb2709e6', :version=>'2.0.13', :path=>'docs/CHANGELOG.html' },
{ :md5=>'bd9d2285839fb7e15a556f0ba2f7ae2c', :version=>'2.0.14', :path=>'docs/CHANGELOG.html' },
{ :md5=>'d636b63d299cbfb2948450e80d5be7d6', :version=>'2.0.15', :path=>'docs/CHANGELOG.html' },
{ :md5=>'d4d2f1e38096a4b32e22dff57773c62d', :version=>'2.0.16', :path=>'docs/CHANGELOG.html' },
{ :md5=>'bb29b25a9734d10328f970001f0295b3', :version=>'2.0.17', :path=>'docs/CHANGELOG.html' },
{ :md5=>'3058647f25b2d3d4804cd8e3e69a938f', :version=>'2.0.18', :path=>'docs/CHANGELOG.html' },
{ :md5=>'4880b1bc3a16771e934b7f69b4d87f2e', :version=>'2.0.19', :path=>'docs/CHANGELOG.html' },
{ :md5=>'b90c8f20ebfb920cc9ac332b60960cef', :version=>'2.0.20', :path=>'docs/CHANGELOG.html' },
{ :md5=>'90520361b651f583853fc7058fe10256', :version=>'2.0.21', :path=>'docs/CHANGELOG.html' },
{ :md5=>'4f1e462f7da7df826a07d1cf0faae4ae', :version=>'2.0.22', :path=>'docs/CHANGELOG.html' },
{ :md5=>'3eba9db5133b98df8a54abc55be34307', :version=>'2.0.23', :path=>'docs/CHANGELOG.html' },
{ :md5=>'e60f14eba6d00d56956c16f8a94ca140', :version=>'3.0-B5', :path=>'docs/CHANGELOG.html' },
{ :md5=>'e60f14eba6d00d56956c16f8a94ca140', :version=>'3.0-RC1', :path=>'docs/CHANGELOG.html' },
{ :md5=>'565c3b1933cda61295e54c1f141ef8b7', :version=>'3.0-RC2', :path=>'docs/CHANGELOG.html' },
{ :md5=>'f3f30e22403564e99e64d09f7f731dea', :version=>'3.0-RC3', :path=>'docs/CHANGELOG.html' },
{ :md5=>'63b9c4065b2aabda328a1c9b0677f986', :version=>'3.0-RC4', :path=>'docs/CHANGELOG.html' },
{ :md5=>'3d7aed030411838411a91ae4fcd213e4', :version=>'3.0-RC5', :path=>'docs/CHANGELOG.html' },
{ :md5=>'074417fdfca31a8d7349c88e8081d8cd', :version=>'3.0-RC6', :path=>'docs/CHANGELOG.html' },
{ :md5=>'2e139da54418cd096405d58e049bffd9', :version=>'3.0-RC7', :path=>'docs/CHANGELOG.html' },
{ :md5=>'e7de4c40a4fbf920aa0ef8d935564ed2', :version=>'3.0-RC8', :path=>'docs/CHANGELOG.html' },
{ :md5=>'dc1866d542cfcfface533b024ac3da77', :version=>'3.0.0', :path=>'docs/CHANGELOG.html' },
{ :md5=>'cfa612fc182916fd76467cce11c2e708', :version=>'3.0.1', :path=>'docs/CHANGELOG.html' },
{ :md5=>'fe1e7b8f3fc448ebfb7b2c1c5ec1e2d7', :version=>'3.0.1-RC1', :path=>'docs/CHANGELOG.html' },
{ :md5=>'59d04c38f084936b68551a0acccd3ea2', :version=>'3.0.2', :path=>'docs/CHANGELOG.html' },
{ :md5=>'f8b7389f4d5e61d0041430b5986378e2', :version=>'3.0.2-RC1', :path=>'docs/CHANGELOG.html' },
{ :md5=>'59d04c38f084936b68551a0acccd3ea2', :version=>'3.0.2-RC2', :path=>'docs/CHANGELOG.html' },
{ :md5=>'f4a6893faa9918962db5858f8b96c600', :version=>'3.0.3', :path=>'docs/CHANGELOG.html' },
{ :md5=>'f4a6893faa9918962db5858f8b96c600', :version=>'3.0.3-RC1', :path=>'docs/CHANGELOG.html' },
{ :md5=>'d638931f610f6a7073cf7bb43bf6370f', :version=>'3.0.4', :path=>'docs/CHANGELOG.html' },
{ :md5=>'d638931f610f6a7073cf7bb43bf6370f', :version=>'3.0.4-RC1', :path=>'docs/CHANGELOG.html' },
{ :md5=>'931e4dd982451b9baf4dbfa3a6d6da4e', :version=>'3.0.5', :path=>'docs/CHANGELOG.html' },
{ :md5=>'0fdcbb67c9773f490d3f0691a6dd4db9', :version=>'3.0.5-RC1', :path=>'docs/CHANGELOG.html' },
{ :md5=>'aedf28d7599038cf0b07e9404c69ffca', :version=>'3.0.6', :path=>'docs/CHANGELOG.html' },

=end
