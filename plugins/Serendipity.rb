##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Serendipity" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "Serendipity - a PHP Weblog/Blog software. Serendipity is a PHP-powered weblog application which gives the user an easy way to maintain an online diary, weblog or even a complete homepage. - homepage: http://www.s9y.org"

# Google results as at 2011-02-24 #
# 342 for "powered by Serendipity"
# 299 for "My weblog is proudly powered by Serendipity"

# ShodanHQ results as at 2011-02-24 #
# 339 for X-blog: Serendipity
# 26 for x-serendipity-interfacelang
# 12 for X-serendipity-ml-sl-reset
# 5 for x-serendipity-contentlang

# Examples #
examples %w|
213.133.110.49
95.64.115.3
72.232.233.131
46.4.166.78
82.38.46.207
174.97.231.22
67.55.71.103
64.120.5.175
129.121.73.47
86.83.236.157
217.69.84.26
89.161.175.123
89.110.145.40
88.198.149.117
arizonapowernetwork.com
blog.chris.de
dcoles.net/blog/
idempot.net/blog/
livinggratefully.co.uk/blog/index.php
reggaemania.com/serendipity/
www.brokenthumb.co.uk
www.thunderboltmountain.com/serendipity/
www.camerongray.net
www.harvestdream.org
www.n2ition.com/serendipity/
www.latrobe.edu.au/blogs/hsresearch/
www.pontification.com/serendipity/
www.jimjag.com/imo/
www.bradrippe.com/serendipity/
|

# Matches #
matches [

# Version Detection # Meta Powered-By
{ :version=>/<meta name="Powered-By" content="Serendipity v.([^"]+)" \/>/i },

# Version Detection # Proudly powered by text
{ :version=>/My weblog is proudly powered by <a href="http:\/\/www.s9y.org">Serendipity ([^<]+)<\/a>.<br \/>/ },

# Powered by text
{ :text=>'<p>Powered by <a href="http://www.s9y.org" target="_blank">Serendipity</a>' },

# Copyright text
{ :text=>'<div class="copyright">Powered by <a href="http://www.s9y.org" title="a PHP Weblog/Blog software">Serendipity</a>' },

]

# Passive #
def passive
	m=[]

	# x-serendipity-interfacelang
	m << { :name=>'x-serendipity-interfacelang' } unless @meta['x-serendipity-interfacelang'].nil?

	# x-serendipity-contentlang
	m << { :name=>'x-serendipity-contentlang' } unless @meta['x-serendipity-contentlang'].nil?

	# x-blog: serendipity
	m << { :name=>'x-blog: serendipity' } if @meta['x-blog'] =~ /^Serendipity$/

	# Return passive matches
	m
end

end


