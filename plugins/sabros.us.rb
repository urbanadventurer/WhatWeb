##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "sabros_us" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.2"
description "sabros.us  is a CMS to put your bookmarks online with folksonomy support; just like del.icio.us, but the big diference is you will have the complete control of the source code."
website "http://sabros.us/"

# Google results as at 2010-08-06 #
# 81 for "Powered by sabros.us"



# Matches #
matches [

# Default Title
{ :text=>'	<title>sabros.us/' },

# Powered By Text
{ :text=>'		<p class="powered">powered by: <a title="sabros.us" href="http://sabros.us/">sabros.us</a></p>', :version=>"1.8" },
{ :text=>'		<p class="powered">powered by: <a title="sabros.us" href="http://sourceforge.net/projects/sabrosus/">sabros.us</a></p>', :version=>"1.7" },

# Version Detection # Meta Generator
{ :version=>/	<meta name="generator" content="sabros.us ([\d\.]+)" \/>/ },

]

end

