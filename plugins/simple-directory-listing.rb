##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Simple-Directory-Listing" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-01
version "0.1"
description "A php application that provides a web-based graphical interface similar to apache directory listing. Functions:copy, move, delete, rename files, etc."
website "http://sourceforge.net/simpledirectory"

# Google results as at 2011-08-01 #
# 72 for "powered by SimpleDirectoryListing"

# Dorks #
dorks [
'"powered by SimpleDirectoryListing"'
]



# Matches #
matches [

# Meta Keywords
{ :text=>"<meta name='keywords' content='simple, directory, listing'></meta>" },

# Meta Keywords with directory path
{ :regexp=>/<meta name='keywords' content='simple, directory, listing, \/[^\/]*\/? - Simple Directory Listing'><\/meta>/ },

# Login Page # Form
{ :text=>"<form action='?system=login' method='post' onsubmit='Sdl.login.submit(); return false;'>" },

# Powered by link
{ :text=>"<i><b>powered by <a href='http://simpledirectorylisting.net'>SimpleDirectoryListing</a></b></i>" },
{ :text=>'Powered by <a href="http://sourceforge.net/simpledirectory">SimpleDirectoryListing</a>' },

]

end

