##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FreeNAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-09
version "0.1"
description "FreeNAS is an Open Source Storage Platform based on FreeBSD and supports sharing across Windows, Apple, and UNIX-like systems."
website "http://www.freenas.org/"

# ShodanHQ results as at 2012-09-09 #
# 1,974 for location account/login next
#   335 for freenas

# Google results as at 2012-09-09 #
# 1 for "FreeNAS" "Please log in" inurl:"account/login/"

# Dorks #
dorks [
'"FreeNAS" "Please log in" inurl:"account/login/"'
]



# Matches #
matches [

# /account/login # Version Detection
{ :version=>/<div id="login" data-dojo-type="dijit\.Dialog" data-dojo-props="title: 'Welcome to FreeNAS&trade; ([^']+)'">/ },
{ :version=>/<div id="login" dojoType="dijit\.Dialog" title="Welcome to FreeNAS ([^\s]+)">/ },

# /account/login # HTML Comment # It's a login page? Thx bro
{ :text=>'<!-- THIS IS A LOGIN WEBPAGE -->' },

# /account/login # HTML Comment # Logo HTML
{ :text=>'<a href="/" title="FreeNAS&trade;"><img src="/static/images/ui/freenas-logo.png?cache=" alt="FreeNAS&trade;" style="padding-left:10px;"/></a>' },

# /static/images/ui/freenas-logo.png
{ :url=>"/static/images/ui/freenas-logo.png", :md5=>"e9f74076206e249ead75559119c028c6" },

# Location Header
{ :url=>"/", :search=>"headers[location]", :regexp=>/https?:\/\/[^\/]+\/account\/login\/\?next=\// },

]

end

