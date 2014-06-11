##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eDirectory" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-27
version "0.1"
description "Arca Solutions eDirectory provides a php and .NET software platform to allow site owners to publish directory-driven websites with ease. - Hompage: http://www.edirectory.com/"

# Google results as at 2011-06-27 #
# 309 for "Powered by eDirectory" "type a keyword" +listings +events

# Dorks #
dorks [
'"Powered by eDirectory" "type a keyword" "listings" "events"'
]



# Matches #
matches [

# Powered by text
{ :text=>'<span class="basePowered">Powered by <a href="http://www.edirectory.com" target="_blank">eDirectory&trade;</a>.</span>' },

{ :regexp=>/ class="basePowered">Powered by <a href="[^"]+" target="_blank">eDirectory&trade;[\s]?<\/a>/ },

# Version Detection # /sitemgr/login.php
{ :version=>/<blockquote class="eDirectoryVersion"><span class="basePowered">Powered by <a href="http:\/\/www\.edirectory\.com" target="_blank">eDirectory&trade;<\/a> <\/span> v\.([^<^\s]+)<\/blockquote>/ },

]

end

