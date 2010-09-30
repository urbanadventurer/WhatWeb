##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# remove :certainty

Plugin.define "MetaGenerator" do
author "Andrew Horton"
version "0.2"
description "meta generator tag"
examples %w| foo |

#<meta name="generator" content="Plone - http://plone.org" />
#<meta name="generator" content="Movable Type Pro 4.21-en" />
#<meta name="generator" http-equiv="generator" content="SilverStripe - http://www.silverstripe.com" >


def passive
	m=[]
 	if @body =~ /<meta name="generator"[^>]+content="[^"]+"/i
                content=@body.scan(/<meta name="generator"[^>]+content="([^"]+)"/i)[0][0]                
                m << {:name=>"meta generator tag",:string=>content} 
    end
 	m
end

end

