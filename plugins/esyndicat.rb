##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-25 #
# Updated version detection
##
Plugin.define "eSyndiCat" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.2"
description "eSyndiCat is a professional, affordable directory software solution."
website "http://www.esyndicat.com/"

# 8 results for "Powered by eSyndiCat Web Directory" @ 2010-08-08

# Dorks #
dorks [
'"Powered by eSyndiCat Web Directory"'
]



# Matches #
matches [

	# Copyright Footer
	{ :regexp=>/<div class="copyright">&copy; [0-9]{4}[\-0-9]{0,5} Powered by <a href="http:\/\/www.esyndicat.com\/">eSyndiCat[^<]{0,5} Directory [^<]{5,8}<\/a><\/div>/ },

	# Admin Panel
	{ :text=>'<title>Login To eSyndiCat Admin Panel</title>' },

	# Version Detection # Meta Generator
	{ :version=>/<meta name="generator" content="eSyndiCat Web Directory Software ([\d\.]+)" \/>/ },

	# Version Detection # Powered by text
	{ :version=>/Powered by <a href="http:\/\/www.esyndicat.com\/">eSyndiCat Pro v([\d\.]+)<\/a><br \/>/ },
	{ :version=>/Powered by <a href="http:\/\/www.esyndicat.com\/">eSyndiCat<\/a> Version ([\d\.]+)<br \/>/ },

]

end

