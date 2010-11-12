##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# remove :certainty and :name, change :regexp to :text
# Version 0.3
# Fixed Changelog version detection now prefixed with >

Plugin.define "phpBB" do
author "Andrew Horton"
version "0.3"
description "phpBB is a free forum phpbb.org"
examples %w|http://phpbbmodders.net/board/ http://smartor.is-root.com/forum/ http://narutoc.phpbbnow.com/ http://www.bikeradar.com/forum/index.php http://forum.djmag.com/ http://www.rotationz.be/forum/ http://www.sgscwelisten.com/forum/ http://www.globalhardstyle.com/forum/ http://www.soapforum.co.uk/ www.ostriches.org/forum/ forum.comicostrich.com forum.ectune.com pokerforums.fulltiltpoker.com www.bettertransport.org.nz/forum/ back2basics.hiphopnz.com/ www.oldschool.co.nz/|

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

matches [
{:text=>'<!-- link rel="stylesheet" href="templates/subSilver/subSilver.css'},
{:text=>'/images/logo_phpBB.gif'},
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

{:url=>"/docs/CHANGELOG.html", :md5=>"931e4dd982451b9baf4dbfa3a6d6da4e", :version=>"3.0.5"}
]

def passive
	m=[]
	
	m << {:name=>"phpbb2mysql_data cookie", :version=>"2" } if @meta["set-cookie"] =~ /phpbb2mysql_data/i
	
	if @meta["set-cookie"] =~ /([^ ]+)_u=1; expires/
		p=@meta["set-cookie"].scan(/([^ ]+)_u=1; expires/).to_s
		m << {:name=>"phpbb3 _u, _k, _sid cookies", :version=>"3" } if @meta["set-cookie"] =~ /#{p}_u=.*#{p}_k=.*#{p}_sid=[0-9a-z]{32}/
	end
	
	m
end

def aggressive
	m=[]

	target = URI.join(@base_uri.to_s,"docs/CHANGELOG.html").to_s
	status,url,ip,body,headers=open_target(target)
	
	unless body.nil?
		# /docs/CHANGELOG.html
		# <li><a href="#v303">Changes since 3.0.3</a></li>
		# <li><a href="#2018">Changes since 2.0.18</a></li>
		if body =~ /<li><a href="[^"]+">Changes since ([0-9\.]+)<\/a><\/li>/
			v=body.scan(/<li><a href="[^"]+">Changes since ([0-9\.]+)<\/a><\/li>/)[0].to_s
			m << {:name=>"phpbb changelog", :version=>">"+v }
		end
	end	
	m
end

end

