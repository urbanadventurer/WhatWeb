##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100

Plugin.define "Title" do
author "Andrew Horton"
version "0.2"
description "The HTML page title"
examples %w| www.google.com |

#

def passive
	m=[]
 	if @body =~ /<title>[^<]+<\/title>/i
                title=@body.scan(/<title>([^<]+)<\/title>/i)[0][0]                
                m << {:name=>"page title",:string=>title} 
    end
 	m
end

end

