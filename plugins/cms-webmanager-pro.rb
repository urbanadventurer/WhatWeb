##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CMS-WebManager-Pro"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-09-04
  # v0.2 # 2011-01-10 # Updated version detection. 
]
version "0.2"
description "CMS WebManager-Pro - is a software product for creating and maintaining websites of any complexity."
website "http://webmanager-pro.com/"

# Google results as at 2010-09-04 #
# 2 for "powered by CMS WebManager-Pro"

# Dorks #
dorks [
'"powered by CMS WebManager-Pro"'
]



# Matches #
matches [

	# Powered by text
	{ :text=>'Powered by <a style="color:#555555;" href="http://webmanager-pro.com/">CMS Webmanager-pro</a>' },

	# Version detection # Meta generator
	{ :version=>/<meta name="generator" content="Webmanager-pro v([\d\.]+)" \/>/ },

]

end

