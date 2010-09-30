##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Google-API" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-09 
version "0.1"
description "finds references to ajax.googleapis.com in <script> src."

def passive

        m=[]
        result=""
        if @body =~/<[\s]*script[\s]*src=[\"\']*http:\/\/ajax.googleapis.com\/[a-zA-Z0-9\/\.\'-_]+"[\s]*[type="text\/javascript"]*[\s]*>[\s]*<[\s]*\/script[\s]*>/i 
		v=@body.scan(/<[\s]*script[\s]*src=[\"\']*http:\/\/ajax.googleapis.com\/([a-zA-Z0-9\/\.\'-_]+)"[\s]*[type="text\/javascript"]*[\s]*>[\s]*<[\s]*\/script[\s]*>/i) { |match|
  result << "#{match} "
}
                m << {:name=>"google javascript API", :version=>result }
	end

        m

end

end

