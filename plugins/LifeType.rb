##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-09 #
# Updated version detection
##
Plugin.define "LifeType" do
author "Aung Khant, http://yehg.net"
version "0.2"
description "LifeType is an open-source blogging platform with support for multiple blogs and users in a single installation. - homepage: http://lifetype.net"

# Examples #
examples %w|
demo.opensourcecms.com/lifetype/
hugi.to/blog/
iya.blogs.nowhere-else.org
hrbspecialties.com/lifetype/
cisc.twbbs.org/lifetype/
ccyes.tpc.edu.tw/lifetype/
cy-thompson.co.uk/lifetype/
bigbrakebrewing.com/lifetype/
journalofsustainability.com/lifetype/
140.120.80.32/lifetype/
linux.e-yen.info/lifetype/
cy-thompson.co.uk/lifetype/
chargingbull.net/lifetype/
books.mlc.tw/lifetype/
myfirstblog.net
blaogy.com
barbandrodger.com/LifeType/
|

# Matches #
matches [

	# Default powered by text
	{ :regexp=>/Powered by <a href="http:\/\/lifetype.net[^>]*>Lifetype<\/a>/i },
	{ :text=>'Powered by <a href="http://www.lifetype.net">LifeType</a>' },

	# Version Detection # Default meta generator
	{ :version=>/<meta name="generator" content="lifetype-([\w\.]+)"/ },

	# Not Installed message HTML
	{ :text=>'LifeType has not been installed yet, you\'ll have to <font color="red"><b><a href="wizard.php" title="Install LifeType">Install LifeType</a></b></font> first!' },

]

end

