##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Added :status=>200 matches
##
Plugin.define "Linksys-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-28
version "0.2"
description "Linksys router"
website "http://www.linksys.com/"

# Matches #
matches [

# WRT54GC # Logo
{ :model=>'WRT54GC', :md5=>"0b749361e0c9ab37b9f8875b0667d713", :url=>'/UI_Linksys.gif' },

]

end

=begin

md5 hashes are required for these images:

{ :model=>'WRT54GL', :url=>'/WRT56GL.gif' },
{ :model=>'WRT54G', :url=>'/WRT54G.gif' },
{ :model=>'WRT54GS', :url=>'/UILinksys.gif' },

=end

