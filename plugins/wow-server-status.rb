##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WoW-Server-Status" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-07
version "0.1"
description "This lightweight PHP script will parse Blizzard's XML feed and display realm status on your Guild's web page. The output can be configured as text/HTML, a dynamically generated image or as a PHP array."
website "http://53x11.com/blog/2005/04/21/WoW-Server-Status-41.10"

# 4 Google results for "It appears that your server can run WoW Server Status.  Game on."
# 1 Google result for "This lightweight PHP script will parse Blizzard's XML feed and display realm status on your Guild's web page." ext:txt


matches [

# Default image
{ :regexp=>/<img[^>]*src="wow_ss.php\?realm=/ }, #"

]

# Passive #
def passive
	m=[]

	# PHP Version # server_test.php
	m << { :string=>"PHP/"+@body.scan(/<h3 style="color: green">Your GD Library \(version [\d\.]+\) appears to be capable of running WoW Server Status.<\/h3><br \/><h3 style="color: green">You are running PHP version ([\d\.]+).  Horray!<\/h3><br \/><h3 style="color: green">It appears that your server can run WoW Server Status.  Game on./).flatten.to_s } if @body =~ /<h3 style="color: green">Your GD Library \(version [\d\.]+\) appears to be capable of running WoW Server Status.<\/h3><br \/><h3 style="color: green">You are running PHP version ([\d\.]+).  Horray!<\/h3><br \/><h3 style="color: green">It appears that your server can run WoW Server Status.  Game on./

	# GD Library version # server_test.php
	m << { :string=>"GD/"+@body.scan(/<h3 style="color: green">Your GD Library \(version ([\d\.]+)\) appears to be capable of running WoW Server Status.<\/h3><br \/><h3 style="color: green">You are running PHP version [\d\.]+.  Horray!<\/h3><br \/><h3 style="color: green">It appears that your server can run WoW Server Status.  Game on./).flatten.to_s } if @body =~ /<h3 style="color: green">Your GD Library \(version ([\d\.]+)\) appears to be capable of running WoW Server Status.<\/h3><br \/><h3 style="color: green">You are running PHP version [\d\.]+.  Horray!<\/h3><br \/><h3 style="color: green">It appears that your server can run WoW Server Status.  Game on./

	m

end

end

