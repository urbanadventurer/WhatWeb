##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SocketKB" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-08
version "0.1"
description "Deploy your own professional knowledge base or knowledge repository. Provide your customers the answers to their questions with SocketKB. Increase customer satisfaction and confidence. Easy and fast to install. - homepage: http://socketkb.com/site/home/"

# 15 results for "Powered by SocketKB version" -intext
examples %w|
socketkb.com/site/home/demo_coolblue.php
socketmail.info/kb/home/
socketkb.com/site/home/demo_default.php
ask.simul8.com/home/
support.simul8.com/kb/
kb.c-comsat.com
kb2.c-comsat.com/home/
www.classiclandscapes.com/socketkb/
|

matches [

# Version Detection # Powered by text
{ :version=>/<a[^>]*href="http:\/\/www.socketkb.com[^>]*>Powered by SocketKB version ([\d\.]+)<\/a>/, :offset=>0 },
{ :version=>/<a[^>]*href=[^>]*>Powered by SocketKB version ([\d\.]+)<\/a>/, :offset=>0, :certainty=>75 },

]

end

