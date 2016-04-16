##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "Open-Blog" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.2"
description "Open blog is a free and open source blogging platform built using the CodeIgniter PHP framework and released under the GPL v3 license."
website "http://www.open-blog.info/"

# Google results for 2010-08-06 #
# 107 for "powered by Open blog"

# Dorks #
dorks [
'"powered by Open blog"'
]



# Matches #
matches [

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.open-blog.info[\/]*" target="_blank">Open Blog<\/a>/ },
{ :text=>'Powered by <a href="http://www.open-blog.info"' },
{ :text=>'    	Powered by <a href="http://www.open-blog.info" target="_blank">Open Blog</a>' },

# Version Detection # Install Page # Install Link
{ :version=>/			<a href="install.php">Install Open Blog<\/a> - choose this option, if you would like to install Open Blog ([\d\.]+)<br \/>/ },

]

end

