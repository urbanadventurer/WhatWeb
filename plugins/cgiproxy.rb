##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CGIProxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.1"
description "This CGI script acts as an HTTP or FTP proxy. Through it, you can retrieve any resource that is accessible from the server it runs on. - homepage: http://www.jmarshall.com/tools/cgiproxy/"
examples %w|
forrestspick.com/proxy/newcgi/nph-proxy.cgi
www.awxcnx.de/cgi-bin/proxy3/nph-proxy.cgi
www.tecmet.com/cgiproxy/nph-proxy.cgi
elwario91.zouig.org/proxy.cgi
webringlink.com/cgi-bin/nph-os.cgi
|

matches [

# http://johnny.ihackstuff.com/ghdb?function=detail&id=531
# About 15 results @ 2010-06-06
{:name=>'GHDB: +filetype:cgi "Start browsing through this CGI-based proxy by entering a URL below"',
:certainty=>25,
:ghdb=>'+filetype:cgi "Start browsing through this CGI-based proxy by entering a URL below"'
},

{:name=>"default title",
:text=>'<title>Start Using CGIProxy</title>'
}

]

def passive
        m=[]

        if @body =~ /<a href="http:\/\/www.jmarshall.com\/tools\/cgiproxy\/"><i>CGIProxy [a-z0-9_\.]+<\/i><\/a>/
		v=@body.scan(/<a href="http:\/\/www.jmarshall.com\/tools\/cgiproxy\/"><i>CGIProxy ([a-z0-9_\.]+)<\/i><\/a>/)[0].to_s
		m << {:name=>"powered by version", :version=>v }
        end
        m

end

end

