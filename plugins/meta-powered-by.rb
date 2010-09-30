##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# remove :certainty

Plugin.define "MetaPoweredBy" do
author "Andrew Horton"
version "0.2"
description "meta generator tag"
examples %w| idempot.net/blog/ |


# <meta name="Powered-By" content="Serendipity v.1.5.1" />
# matches poweredby, powered-by, and powered by

def passive
	m=[]
 	if @body =~ /<meta[^>]+name="powered[\- ]?by"[^>]+content="[^"]+"/i
                content=@body.scan(/<meta[^>]+name=["']powered[\- ]?by["'][^>]+content=["']([^"]+)["']/i)[0][0]
                m << {:name=>"meta powered-by tag",:string=>content} 
    end
 	m
end

end

