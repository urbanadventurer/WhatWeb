##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "zFeeder" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.1"
description "check zFeeder if you want to show other's RSS content (news and much more) on your website, wapsite or use it on your PC (or intranet) as a news reader."
website "http://zvonnews.sourceforge.net/"

# Google results as at 2010-08-22 #
# 319 for "powered by zFeeder"
# 148 for "powered by zFeeder" inurl:zfposition|zfcategory

# Dorks #
dorks [
'"powered by zFeeder" inurl:zfposition|zfcategory'
]



# Matches #
matches [

# From the homepage: please keep the link: "powered by.." or use the logo
{ :text=>'<span style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: xx-small;">powered by <a href="http://zvonnews.sourceforge.net">zFeeder</a></span>' },

]

end

