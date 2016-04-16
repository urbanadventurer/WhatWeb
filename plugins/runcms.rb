##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated version detection
##
Plugin.define "RunCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.2"
description "RunCms is Ease Of Use for webmasters. One of the worlds finest free CMS systems."
website "www.runcms.org/"

# Google results as at 2010-07-11 #
# 57 for "powered by RunCMS" -Vulnerability -exploit inurl:module inurl:viewcat.php

# Dorks #
dorks [
'"powered by RunCMS" -Vulnerability -exploit inurl:module inurl:viewcat.php'
]



# Matches #
matches [

# GHDB Match
{ :ghdb=>'"powered by RunCMS" inurl:module inurl:viewcat.php' },

# Version Detection # Powered by text
{ :version=>/<div align='center'><a href='http:\/\/www.runcms.org\/' target='_blank'> Powered by  RunCms ([\d\.a-z]+)[^&]* &copy; [\d]{4}-[\d]{4} / },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="[\s^"]*RUNCMS ([\d\.a-z]+)[^"]*"/i },

]

end

