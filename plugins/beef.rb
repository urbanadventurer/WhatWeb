##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-03-26 #
# Added version detection
##
# Version 0.2 # 2011-03-02 #
# Added favicon and beefmagic.js.php matches
##
Plugin.define "BeEF" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-04
version "0.2"
description "BeEF - Browser Exploitation Framework - homepage: http://www.bindshell.net/tools/beef/"

# Examples #
examples %w|
stage3i.free.fr/ui/
showcase1.se/sosse/beef/ui/
manyeikshramit.com/beef/ui/
|

# Matches #
matches [

# Default Logo HTML
{ :name=>"default logo", :text=>'<img src="../images/beef.gif" onclick="new Effect.Shake(\'sidebar\');"></div> BeEF</h1>' },

# Favicon
{ :url=>"favicon.ico", :md5=>"749749ba87e84d48b44b69ed2241987c" },

# Injected script
{ :regexp=>/<script[^>]+src=['|"]?[^>^=]+\/hook\/beefmagic.js.php['|"]?[^>]+>/, :certainty=>75, :string=>"Injected Script" },

]

# Passive #
def passive
	m=[]

	# HTTP # Server # Version Detection
	m << { :version=>@meta["server"].scan(/^BeEF ([^\s]+)$/).to_s } if @meta["server"] =~ /^BeEF ([^\s]+)$/

	# Return passive matches
	m
end

end

