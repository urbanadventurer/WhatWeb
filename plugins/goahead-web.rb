##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :name & :probability
Plugin.define "GoAhead-Webs" do
author "Andrew Horton"
version "0.2"
description "Opensource, embedded webserver. Homepage: http://www.goahead.com/products/webserver/default.aspx"
examples %w| 120.138.16.61 202.89.36.233 |

#http://120.138.16.61 server-header = 'GoAhead-Webs'


matches [
{:text=>"response_code_begin ERIC_RESPONSE_OK response_code_end response_msg_begin  response_msg_end" }
]

def passive
	m=[]
      unless @meta.nil?
                server=nil      
                server=@meta["server"] if @meta.keys.include?("server")
                server=@meta["Server"] if @meta.keys.include?("Server")
        
                
                if server =~ /GoAhead-Webs/i
                        m << {:name=>"server string",:string=>server}
                end
      end
     m
end

end

