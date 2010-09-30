##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Lucky-Tech-iGuard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "iGuard security system, based on latest biometric fingerprint technology. - homepage: http://www.lucky-tech.com/"

# 2 results for intitle:"iGuard Fingerprint Security System" @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1782
examples %w|
66.208.250.26
43.244.235.47:1081/Admins/index.html
|

matches [

{ :text=>'	<TITLE>iGuard Fingerprint Security System</TITLE>' },

]

# an aggresive plugin could get the version from /Admins/Content.vtml
def passive
        m=[]

        if @body =~ /	<meta content="Lucky-Tech iGuard [\d\.]+" name="GENERATOR">/
                version=@body.scan(/	<meta content="Lucky-Tech iGuard ([\d\.]+)" name="GENERATOR">/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /<td>iGuard Security System<\/td><\/tr><tr><td>Firmware Version<\/td><td>[0-9A-Z]+/
                version=@body.scan(/<td>iGuard Security System<\/td><\/tr><tr><td>Firmware Version<\/td><td>([0-9A-Z]+)/)[0][0]
                m << {:version=>version}
        end

        m

end


end

