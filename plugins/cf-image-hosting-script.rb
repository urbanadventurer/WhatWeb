##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CF-Image-Hosting-Script"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-09-17
  # v0.2 # 2011-02-25 # Updated version detection. 
]
version "0.2"
description "A simple easy to use standalone image hosting script. This script aims to make it easy to setup image hosting site or just a site for you to share your photo with your friends,family,and collegues."
website "http://codefuture.co.uk/projects/imagehost/"

# Google results as at 2010-09-17 #
# 224 for "powered by CF Image Hosting Script"

# Dorks #
dorks [
'"powered by CF Image Hosting Script"'
]



# Matches #
matches [

# Powered by text
{ :text=>'<p>Powered By <a href="http://codefuture.co.uk/projects/imagehost/" title="Free PHP Image Hosting Script">CF Image Hosting script</a>' },

# Version Detection # Powered by text
{ :version=>/<p>Powered By <a href="http[s]*:\/\/codefuture.co.uk\/projects\/imagehost[\d\.]*[^>]+>CF Image Hosting script ([\d\.]+)<\/a>/ },

]

end

