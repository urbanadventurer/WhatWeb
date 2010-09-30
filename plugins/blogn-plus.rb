##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BlognPlus" do
author "Brendan Coles <bcoles at gmail dot com>" # 2010-06-15
version "0.1"
description " - homepage: http://www.blogn.org/"
examples %w|
fuc.byethost2.com/blog/
www.acute-girls.com/nega/renew/
quatrefoil.net
www.kickout.org
www.eg2mix.com
www.hyperntn.net/weblog/
www.sendai-c.ed.jp/~koorisyo/blognplus/
www.okinawanet.info/oki/
f34.aaa.livedoor.jp/~lsws/whirwind/
www.teamhanes.com/contents/surfin/
www.q-v-p.com/kyui/
|

matches [

# 106 results @ 2010-06-15
{:name=>'GHDB: "powered by BlognPlus"',
:certainty=>75,
:ghdb=>'"powered by BlognPlus"'
},

# powered by <a href="http://www.blogn.org/" target="_blank">BLOGNPLUS(????+)</a>
# Powered by <a href="http://www.blogn.org/" target="_blank">BlognPlus</a>
# Powered by <a href="http://www.blogn.org/" target="_blank">BLOGNPLUS</a>
# Powered by  <a href="http://www.blogn.org/" title="BlognPlus">BlognPlus</a>
# powered by <a href="http://www.blogn.org/" target="_blank">BlognPlus</a>
# Powered by <a href="http://www.blogn.org/" target="_blank">BlognPlus</a>
{:name=>'default powered by text',
:certainty=>100,
:regexp=>/Powered by[\s]*<a href="http:\/\/www.blogn.org\/"[\ target="_blank"]*[\ title="BlognPlus"]*>BlognPlus/i,
},

]

def passive
        m=[]

        if @body =~ /<meta name="generator"[^>]*content="BlognPlus [0-9\.]+/
                        v=@body.scan(/<meta name="generator"[^>]*content="BlognPlus ([0-9\.]+)/)[0].to_s
                        m << {:name=>"meta generator version", :certainty=>100, :version=>v }
        end
        m
end


end

# It may be possible to guess the version depending on the copyright dates:
# <META name="copyright" content="Copyright 2000-2006 CMScontrol-GervaWeb">
# <META NAME='copyright' CONTENT='Copyright © Gerva Srl'>

