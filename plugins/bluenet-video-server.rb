##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BlueNet-Video-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "video camera web interface"

# 2 results for intitle:"BlueNet Video Viewer" @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1813
examples %w|
75.15.47.149:7831/cgi-bin/client_execute.cgi?tUD=0
74.94.146.105:8888/cgi-bin/client_execute.cgi?tUD=0
|

matches [

{ :text=>"window.location.href='/cgi-bin/client_execute.cgi?tUD=0';" },

]

# an aggresive plugin could get the version from /cgi-bin/client_execute.cgi?tUD=0
def passive
        m=[]

        if @body =~ /<title>BlueNet Video Viewer Version [\d\.a-z]+<\/title>/
                version=@body.scan(/<title>BlueNet Video Viewer Version ([\d\.a-z]+)<\/title>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

