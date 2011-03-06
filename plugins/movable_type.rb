##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# remove :certainty
# Version 0.3
# Uses :version=>//

Plugin.define "MovableType" do
author "Andrew Horton"
version "0.3"
description "Blogging platform  http://www.movabletype.org/"

# /mt/mt-tags.fcgi
# /mt-tb.fcgi
# /mt-cp.[f]?cgi
# /mt-search.cgi
# /mt-user-login.cgi
# /mt-recommend.cgi
#
# <meta name="generator" content="Movable Type Pro 4.23-en" />
# <meta name="generator" content="Movable Type Pro 4.24-en" />
# <meta name="generator" content="Movable Type Enterprise 1.52-en-voltron-r47459-20070213" />
# <meta name="generator" content="Movable Type 3.2" />
# <meta name="generator" content="http://www.movabletype.org/" /> seen on Movable Type 3.34

# <script type="text/javascript" src="http://awearnessblog.com/mt.js"></script>

# <a href="http://sixapart.com">Powered by Movable Type</a>

#/cgi-bin/mt4/plugins/openid-server/server.cgi
#
# example sites:
# www.movabletype.com/showcase/
#
# can't detect tests: boeingblogs.com.randy , .electricartists.com.corporate, filminfocus.com, muledesign.com, www.radaronline.com, 
# www.theatlantic.com, www.thehuffingtonpost.com, www.plasticmind.com
#

# mt-site.js

# to detect for sure
# try /mt, /mt/mt-check.cgi (discloses versions, paths)

matches [
{:name=>"javascript with 'mt' in the name",
:certainty=>50, :regexp=>/<script type="text\/javascript" src="[^"]+mt[-site]?.js"><\/script>/}, #"

{:name=>"mt-tags|mt-tb|mt-cp|mt-search|mt-user-login|mt-recommend cgi",
:certainty=>75,
:regexp=>/"[^"]+\/(mt-tags|mt-tb|mt-cp|mt-search|mt-user-login|mt-recommend)\.[f]?cgi[^"]*"/},

{:name=>"meta generator tag", :regexp=>/<meta name="generator" content="http:\/\/www.movabletype.org\/" \/>/},

{:name=>"Powered by link", :regexp=>/<a href="http:\/\/sixapart.com">Powered by Movable Type<\/a>/},

{:version=>/<meta name="generator" content="Movable Type ([^"]*)/,  :name=>"meta generator tag" } 
] 


end

