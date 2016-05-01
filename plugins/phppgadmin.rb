##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpPgAdmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-14 
version "0.1"
description "phpPgAdmin is a web-based administration tool for PostgreSQL. It is perfect for PostgreSQL DBAs, newbies and hosting services"
website "http://phppgadmin.sourceforge.net/"
# Source: https://github.com/xzilla/phppgadmin


# Dorks #
dorks [
'inurl:"phppgadmin/intro.php"'
]


# Matches #
matches [

{ :name=>"PPA_ID Cookie", :search=>"headers[set-cookie]", :regexp=>/^PPA_ID=[a-z0-9]+/ },

# intro.php
{ :text => '<td><span class="appname">phpPgAdmin</span></td>' },
{ :version => %r{<span class="appname">phpPgAdmin</span> <span class="version">([\d\.]+)</span>} },

]

end

