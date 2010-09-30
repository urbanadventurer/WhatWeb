##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MyPHP-Forum" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-31
version "0.1"
description "Forum - homepage: http://www.myphp.ws/"

# 23 results for "powered by MyPHP Forum" -Vulnerability @ 2010-08-31
examples %w|
dance.pl/old/pl/forum/topic.php
life-log.dk/kemi2/menu/pages/forum3/faq.php
mrphotoshop.altervista.org/blog2/topic.php
neapolisleague.altervista.org/forum/faq.php
www.m-150.com/forums/forum.php
www.m-150.in/forums/forum.php
www.shopforall.it/forum/index.php
www.studentkm.net/forums/topic.php
www.uck.at/forum/search.php
|

matches [

]

# Version detection using powered by text
def passive
        m=[]

#    <td width="50%" class="copy" height="24">Powered by: <a href="http://www.myphp.ws">MyPHP Forum v3.0 (Final)</a></td>
#    <td width="50%" class="copy" height="24">Powered by: MyPHP Forum v3.1 (nuova versione by Max Pezzali)</td>
#    <td width="50%" class="copy" height="24">Powered by: <a href="http://www.myphp.ws">MyPHP Forum v3.0</a></td>

        if @body =~ /    <td width="50%" class="copy" height="24">Powered by: [<a href="http:\/\/www.myphp.ws">]*MyPHP Forum v([\d\.]+)/
                version=@body.scan(/    <td width="50%" class="copy" height="24">Powered by: [<a href="http:\/\/www.myphp.ws">]*MyPHP Forum v([\d\.]+)/)[0][0]
                m << {:version=>version}
        end

        m

end


end

