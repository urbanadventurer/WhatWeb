##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Loggix" do
author "Brendan Coles <bcoles at gmail dot com>" # 2010-06-15
version "0.1"
description "Loggix is a really simple, lightweight PHP and SQlite driven weblog/cms engine. - homepage: http://loggix.gotdns.org/"
examples %w|
loggix.gotdns.org
jamlog.podzone.org
quatrefoil.net/tale/
d85.jp
monolog.devgiri.org
hbkt.scrapping.cc
blog.apoderus.net
|

matches [

# 22 results @ 2010-06-15
{:name=>'GHDB: "Powered by Loggix"',
:certainty=>25,
:ghdb=>'"Powered by Loggix"'
},

{:name=>'default meta generator',
:certainty=>100,
:text=>'<meta name="generator" content="Loggix" />'
}

]

# Powered by <a href="http://loggix.gotdns.org">Loggix</a> ver.9.8.20</address>
# Powered by <a href="http://loggix.gotdns.org">Loggix</a> ver.9.5.20</address>
def passive
        m=[]

        if @body =~ /Powered by <a href="http:\/\/loggix.gotdns.org">Loggix<\/a> ver.[\d\.]+<\/address>/
                version=@body.scan(/Powered by <a href="http:\/\/loggix.gotdns.org">Loggix<\/a> ver.([\d\.]+)<\/address>/)[0][0]
                m << {:certainty=>100,:name=>"powered by version text",:version=>version}
        end

        m
end


end

