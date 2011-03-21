##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-03-21 # Brendan Coles <bcoles@gmail.com>
# Updated regex
##
# Version 0.2 # 2011-03-06 # Andrew Horton
# fixed examples= bug
##
Plugin.define "OpenCms" do
author "Emilio Casbas" #mostly
version "0.3"
description "OpenCms, professional and easy to use CMS. - Homepage: http://www.opencms.org/"

# ShodanHQ results as at 2011-03-21 #
# 528 for opencms

# Examples #
examples %w|
demo.opencms.org
www.opencms.org
192.160.109.199
80.37.10.47
91.121.179.215
75.127.79.179
59.173.244.27
210.9.134.32
63.81.25.27
www.boersewien.at
www.ccbh.net
www.bng-galiza.org
www.area.trieste.it
www.eu2010.es
www.edgebox.net
www.bionet-intl.org
|

# Matches #
matches [

# Meta Generator
{ :regexp=>/<meta name="generator"[^>]+content="OpenCms"( \/)?>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator"[^>]+content="Opencms version ([\d\.]+)"( \/)?>/ },

# Relative link or img tag # /(opencms|export)/(sites|system)/
{ :certainty=>75, :regexp=>/<(link|img)[^>]+(href|src)="[^"^:]*\/(opencms|export)\/(sites|system)\/[^"]+"[^>]*>/ },

# Relative link or img tag # /opencms/
{ :certainty=>25, :regexp=>/<(link|img)[^>]+(href|src)="[^"^:]*\/opencms\/[^"]+"[^>]*>/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << {:name=>"HTTP Server String", :version=>@meta["server"].scan(/^OpenCms\/([a-z\d\.]+)/) } if @meta["server"] =~ /^OpenCms\/[a-z\d\.]+/

	# Return passive matches
	m
end

end



