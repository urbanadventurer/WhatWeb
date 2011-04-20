##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RobPoll" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "RobPoll - CGI poll system - Homepage: Offline"
# Default password: robpoll

# Google results as at 2011-04-20 #
# 38 for inurl:robpoll.cgi filetype:cgi

# Dorks #
dorks [
'inurl:robpoll.cgi filetype:cgi'
]

# Examples #
examples %w|
www.bjrnet.com/cgi-bin/robpoll.cgi?start
www.rumormillnews.com/cgi-bin/robpoll.cgi?start
www.thedrunkenclam.com/cgi-bin/robpoll.cgi?start
www.patientsforum.com/cgi-bin/robpoll.cgi?start
www.junior-philatelists.com/cgi-bin/robpoll.cgi?start
www.jetter.com/cgi-bin/robpoll.cgi?start
cottrillcompass.com/cgi-bin/robpoll.cgi?start
www.caller2.com/surveys/bret/robpoll.cgi?start
www.optimalthinking.com/cgi-bin/robpoll.cgi?start
www.samgler.org/cgi-bin/robpoll.cgi?start
www.kiruna-nytt.nu/cgi-bin/robpoll.cgi?start
asiarecipe.com/cgi/robpoll.cgi?start
67.192.19.150/chart/poll/robpoll.cgi?start
creakyjoints.com/cgi-bin/survey/robpoll.cgi?start
www9.wind.ne.jp/tad1/cgi-bin/poll/robpoll.cgi?start
www.zahlreich.de/cgi-bin/Fakten/robpoll.cgi?start
harmonica.cc.ccu.edu.tw/cgi-bin/poll/robpoll.cgi?start
www.solochistes.com/cgi-bin/votaciones/robpoll.cgi?start
www.sozial-service.de/cgi-bin/robpoll/robpoll.cgi?start
www.buscamanga.com/cgi-bin/encuestas/robpoll.cgi?start
cgi.chol.com/~tylim67/cgi1/robpoll.cgi?start
|

# Matches #
matches [

# GHDB # URL pattern
{ :ghdb=>'inurl:"robpoll.cgi?start" filetype:cgi' },

# Admin Page # Title
{ :text=>'<head><title>RobPoll Admin</title></head>' },

# Default form html
{ :regexp=>/<form action="[^"]*\/robpoll\.cgi" method="post">/ },

]

end


