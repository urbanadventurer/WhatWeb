##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Linksys-USB-HDD" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-27
version "0.1"
description "Linksys external USB HDD web frontend - homepage: http://www.linksys.com/"
examples %w|
94.224.183.90:8080
82.90.216.198
193.206.101.3
kinsella.dnsalias.org
|

matches [

# http://www.hackersforcharity.org/ghdb/?function=detail&id=1382
# 7 results @ 2010-06-27
{:name=>'GHDB: intitle:"Network Storage Link for USB 2.0 Disks" Firmware',
:certainty=>75,
:ghdb=>'intitle:"Network Storage Link for USB 2.0 Disks" Firmware'
},

{:name=>'default title',
:certainty=>100,
:text=>'<title>Network Storage Link for USB 2.0 Disks</title>'
},

]

def passive
        m=[]

        if @body =~ /          Version: &nbsp;V[\d\.\-a-zA-Z]+<\/span> &nbsp;&nbsp;<\/td>/
                version=@body.scan(/          Version: &nbsp;V([\d\.\-a-zA-Z]+)<\/span> &nbsp;&nbsp;<\/td>/)[0][0]
                m << {:certainty=>100,:name=>"powered by version text",:version=>version}
        end

        m

end


end

