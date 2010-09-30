##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FluentNET" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "FluentNET, DotContent's powerful content management software, empowers business users to create, manage and publish web content for both general public access as well as internal use, and maximises the value of web-based information. - homepage: http://www.dotcontent.net"

# 14 results for "powered by FluentCMS from DotContent" @ 2010-08-08
examples %w|
www.eepublishers.co.za
www.resolve.co.za
www.getclosure.co.za
resolvetraining.co.za.dedi5a.your-server.co.za
|

matches [
{ :ghdb=>'powered by FluentCMS from DotContent', :certainty=>75 }
]

# Version detection from meta generator
# <meta name="GENERATOR" content="FluentNET 5.6.1 (July 2010) - http://dotcontent.net">
# <meta name="GENERATOR" content="FluentCMS 5.2.1 (April 2009) - http://dotcontent.net">
# <meta name="GENERATOR" content="FluentNET 5.6.0 (July 2010) - http://dotcontent.net">
# <meta name="GENERATOR" content="FluentNET 5.5.0 (December 2009) - http://dotcontent.net">
# <meta name="GENERATOR" content="FluentCMS 4.7.4 (September 2007) - http://dotcontent.net" />

def passive
        m=[]

        if @body =~ /<meta name="GENERATOR" content="Fluent[CMS|NET]+ [\d\.]+ /
                version=@body.scan(/<meta name="GENERATOR" content="Fluent[CMS|NET]+ ([\d\.]+) /)[0][0]
                m << {:version=>version}
        end

        m

end


end

