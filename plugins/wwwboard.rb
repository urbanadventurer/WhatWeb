##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WWWBoard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.1"
description "WWWBoard is a threaded World Wide Web discussion forum and message board, which allows users to post new messages, followup to existing ones and more. - homepage:http://www.scriptarchive.com/wwwboard.html"
examples %w|
hikingfans.netfirms.com/cgi-bin/wwwboard/wwwadmin.pl
www.b5.ru/cgi-bin/wwwadmin.pl
www.curdin.net/cgi-bin/wwwadmin.pl
mntnweb.com/wwwboard/wwwadmin.pl
www.execulink.com/cgi-bin/wwwboard/wwwadmin.pl
jbaba.dip.jp/cgi-bin/wwwadmin.pl
library.thinkquest.org/11353/cgi-bin/wwwadmin.cgi
www.boardbot.com/boardbot/wwwadmin.cgi
www.phy.cuhk.edu.hk/course/2009-2010/2/phy0222/forum/wwwadmin.cgi
www.perswatch.net/wwwboard/wwwadmin.pl
hammer.prohosting.com/~fongdev/cgi-bin/webadmin2.cgi
www.mahoroba.ne.jp/cgi-bin/user-cgi/~nakao/wwwadmin.cgi
jeanamustang.tripod.com/cgi-bin/wwwadmin.pl
pacific-pages.com/cgi-bin/wwwadmin.cgi
|

# <html><head><title>WWWAdmin For WWWBoard</title></head>
# <head><title>WWWAdmin For WWWBoard</title></head>

matches [

# http://johnny.ihackstuff.com/ghdb/?function=detail&id=625
# About 45 results @ 2010-06-05
{:name=>'GHDB: inurl:"WWWADMIN.PL" intitle:"wwwadmin"',
:certainty=>75,
:ghdb=>'inurl:"WWWADMIN.PL" intitle:"wwwadmin"'
},

{:name=>"default title", 
:text=>'<head><title>WWWAdmin For WWWBoard</title></head>'
},

{:name=>"default text",
:text=>'<center><h1>WWWAdmin For WWWBoard</h1></center>'
}

]

end

