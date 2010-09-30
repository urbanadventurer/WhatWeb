##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Umbraco" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-12
version "0.1"
description "umbraco is an open source project with roots back to year 2000 even though it wasn't released as open source until 2004. - homepage: http://www.umbraco.org"
examples %w|
store.umbraco.org
webguruservices.com
greg.berlin.net.au
www.hoosiertrailsbsa.org
www.bataviacando.org
baty-barr.com
kasperb.dk
aelsharif.com
www.ucc-bln.de
www.xsltreference.com
www.battain.at
www.littlewebempire.com
www.method2madness.org
kenny.no
www.mortenbock.dk
www.innwebtech.com.au
www.manhattanheavy.com
www.bpk.cc
|

matches [

# "powered by umbraco" - About 24,400 results @ 2010-06-08
# "site powered by umbraco" - 27 results @ 2010-06-08
# "site powered by umbraco v4" - 17 results @ 2010-06-08
{:name=>'GHDB: "powered by umbraco"',
:certainty=>75,
:ghdb=>'"powered by umbraco"'
},

{:name=>'meta generator', :text=>'<meta name="generator" content="umbraco" />'
},

# Powered by <a href="http://umbraco.org">umbraco</a>
# Powered by <a href="http://umbraco.org/" target="_blank">Umbraco v4</a>
# Powered by <a href="http://umbraco.org" title="umbraco.org">umbraco</a>
# powered by <br/><a href="http://www.umbraco.org">Umbraco</a>
# site powered by <a href="http://www.umbraco.org/v4">umbraco v4</a>
# site powered by <a href="http://umbraco.org" title="visit umbraco.org">umbraco</a>
# Site powered by <a href="http://www.umbraco.org" title="Umbraco">Umbraco v4 RC3</a>
# site powered by <a  href="http://www.umbraco.org">umbraco</a>
# powered by <br/><a href="http://www.umbraco.org">Umbraco</a>
{:name=>'powered by text',
:certainty=>100,
:regexp=>/[site\ ]*powered by[\s]*[<br \/>]*<a[\s]+href="http:\/\/[www.]*umbraco.org[\/]*[v4]*"[\ target="_blank"]*[\ title="umbraco.org"]*[\ title="visit\ umbraco.org"]*>umbraco[\ v4]*[\ 0-9a-zA-Z]*<\/a>/i
}

]

def passive
        m=[]

        if @body =~ /<meta name="generator"[^>]*content="umbraco  [0-9\.]"+/
                        v=@body.scan(/<meta name="generator"[^>]*content="umbraco  ([0-9\.]+)"/)[0].to_s
                        m << {:name=>"meta generator version", :version=>v }
        end

        m
end


end

