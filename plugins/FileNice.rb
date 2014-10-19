##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FileNice" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "fileNice is a free php file browser, particularly useful if you have a 'dump' folder on your server where you regularly upload files and you want to be able to see what.s there."
website "http://filenice.com/"

# Google results as at 2011-03-03 #
# 12 for "Files in" "Free open source file browser available from fileNice.com"

# Dorks #
dorks [
'"Files in" "Free open source file browser available from fileNice.com"'
]



# Matches #
matches [

# HTML Comments
{ :text=>"<!-- please leave the word fileNice visible on the page, it's only polite really isn't it. -->" },
{ :text=>"<!-- please leave the word fileNice and the link to fileNice.com in the about, it's only polite really isn't it. I didn't do all this work just for you to try to pass it off as your own. -->" },

# fileNice.com link
{ :text=>'Free open source file browser available from <a href="http://fileNice.com" title="fileNice.com">fileNice.com</a><br />' },

# Meta Generator
{ :text=>'	<meta name="generator" content="the fantabulous mechanical eviltwin code machine" />' },

]

end


