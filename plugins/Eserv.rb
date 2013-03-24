##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Eserv" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-10-22
version "0.1"
description "Eserv - Mail Server - SMTP/POP3/IMAP/HTTP - Homepage: http://www.eserv.ru/"

# ShodanHQ results as at 2012-10-22 #
# 14 for 404 Path not found (E4 WIKI)

# Examples #
examples %w|
www.eserv.ru
85.15.69.141
62.5.186.10
194.186.66.222
195.182.159.38
195.239.73.190
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Eserv\/([^\s]+)/ },

# Meta Generator # Version Detection
{ :version=>/<meta name="generator" content="Eserv\/([^\s^"]+)" \/>/ },

# Powered by footer # Version Detection
{ :version=>/<span id='powered_by'>[^<]+<a href="http:\/\/www\.eserv\.ru\/"><span itemprop="name">Eserv<\/span><\/a>\/([^\s]+)/ },

]

end

