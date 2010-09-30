##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eLitius" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.1"
description "eLitius is a free software package that allows a person to easily create and manage his own Affiliate Program, recruit affiliates, track visitors and sales. - homepage: http://www.elitius.com/"

# 21 results for "Powered by eLitius Version" -exploit -vulnerabilities
examples %w|
www.elitius.com/demo/
www.kernbits.com/affiliate/
secure.iicinternet.com/affilate/
www.scherrer.tv/eLitius/
|

matches [

{ :text=>'	<meta name="description" content="eLitius Affiliate Management Software" />' },

]

def passive
        m=[]

        if @body =~ /[\s]+Powered by <a href="http:\/\/www.elitius.com\/" target="_blank" title="Affiliate [Tracking|Management]* Software">eLitius<\/a> Version [\d\.]+<br \/>/
                version=@body.scan(/[\s]+Powered by <a href="http:\/\/www.elitius.com\/" target="_blank" title="Affiliate [Tracking|Management]* Software">eLitius<\/a> Version ([\d\.]+)<br \/>/)[0][0]
                m << {:version=>version}
        end
 
	m

end


end

