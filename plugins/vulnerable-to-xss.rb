##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Vulnerable-To-XSS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-06
  # v0.2 # Fixed regex. 
]
version "0.2"
description "This plugin can be used as a very basic xss scanner. It searches for instances of <script>alert(*)</script> in the HTML source."

passive do
        m=[]
        result=""
        if @body =~ /<script>([\s]*)(alert\([a-zA-Z0-9\/\'\"]+\))([\s]*[\;]?[\s]*)<\/script>/i
                version = @body.scan(/<script>([\s]*)(alert\([a-zA-Z0-9\/\'\"]+\))[\s]*[\;]?[\s]*<\/script>/i) { |match|
                        result << "#{match} "
                }
                m << {:version=>result, :certainty=>25}
        end

        m
end

end


