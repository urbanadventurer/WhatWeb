##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Intellinet-IP-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "Intellinet IP camera - homepage: http://www.intellinet-network.com"
# default login: admin/admin

# 5 results for intitle:"INTELLINET" intitle:"IP Camera Homepage" @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1395
examples %w|
216.114.121.12
www.networkipcamera.com/550710_demo/index.html
imst.selfip.net:88
83.235.226.116
tcl.dyndns.info
|

matches [

{ :text=>'    <font size="4" color="#FFFFFF" face="Arial">NETWORK IP CAMERA<br>' },

{ :text=>'<TITLE>::::: INTELLINET IP Camera Homepage :::::</TITLE>' },
{ :text=>'<title>::::: INTELLINET ACTIVE NETWORKING Network IP Camera Homepage :::::</title>' },
{ :text=>'<TITLE>INTELLINET NETWORK SOLUTIONS: Professional Series Network IP Camera Homepage</TITLE>' },

]

def passive
        m=[]

        if @body =~ /&nbsp;FIRMWARE VERSION: [A-Z0-9\.]+[\s]*<\/font>/
                version=@body.scan(/&nbsp;FIRMWARE VERSION: ([A-Z0-9\.]+)[\s]*<\/font>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

