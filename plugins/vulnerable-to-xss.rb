##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Vulnerable-To-XSS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.1"
description "This plugin can be used as a very basic xss scanner. It searches for instances of <script>alert(*)</script> in the HTML source."

def passive
        m=[]
	result=""
        if @body =~ /<script>([\s]*)(alert\([a-zA-Z0-9\/\'\"]+\))([\s]*[\;]?[\s]*)<\/script>/i
                version = @body.scan(/<script>([\s]*)(alert\([a-zA-Z0-9\/\'\"]+\))[\s]*[\;]?[\s]*/i) { |match|
  result << "#{match} "
}
                m << {:certainty=>25,:name=>"vulnerable to XSS",:version=>result}
        end

        m
end

end

