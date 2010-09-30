##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X7-Chat" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.1"
description "X7 Chat is a free script that can be modified and redistributed in any way that you want as long as the X7 Chat copyright logo remains in place. - homepage: http://x7chat.com/"
examples %w|
help.x7chat.com
www.sledmaine.net/x7chat/
arthropodinism.org/chat/
www.fmwriters.com/x7chat/
www.ikegami.com/v-web/x7chat/
www.ikegami.com/v-web/x7chat/
www.northbrooklynsda.org/x7chat/
www.seniorconnection.org/X7Chat/
riverhousecanada.com/X7Chat/
thegoldenbowl.org/X7Chat/
www.jesusalive.info/X7Chat/
local1129.com/X7Chat/
bethelebc.org/X7Chat/
shrimpin.com/v-web/x7chat/
silver-dragon.net/forum/x7chat/
www.dustyshome.com/x7chat/
www.stuartrazey.com/x7chat/
sandisuniquedesign.com/v-web/x7chat/
vasai.org/v-web/x7chat/
www.denningservices.com/x7chat/
www.chopwork.com/x7chat/
www.carptracker.nl/x7chat/
friendshipbowling.com/x7chat/
wrightjohnsonenterprises.com/x7chat/
www.dixiemaverick.com/x7chat/
www.imwan.com/phpBB3/x7chat/
www.rbbt.net/x7chat/
hdtv.taosystems.net/x7chat/
stjohntalk.com/v-web/x7chat/
x7chat.99k.org/x7chat/x/
|

matches [

# 30 results @ 2010-06-13
{:name=>'GHDB: inurl:x7chat "Please enter your username and password to login"',
:certainty=>75,
:ghdb=>'inurl:x7chat "Please enter your username and password to login"'
}

]

# from html source: <!-- THIS TEXT MAY NOT BE REMOVED OR EDITED OR COMMENTED OUT.  IF YOU DO CHAT WILL NOT WORK -->
def passive
        m=[]

	# new versions
        if @body =~ /Powered By <a href="http:\/\/www.x7chat.com\/" target="_blank">X7 Chat<\/a> [\d\.A-Z]+[\s]*[<Br>]*&copy; 2004 By The <a href="http:\/\/www.x7chat.com\/" target="_blank">X7 Group<\/a>/
		v=@body.scan(/Powered By <a href="http:\/\/www.x7chat.com\/" target="_blank">X7 Chat<\/a> ([\d\.A-Z]+)[\s]*[<Br>]*&copy; 2004 By The <a href="http:\/\/www.x7chat.com\/" target="_blank">X7 Group<\/a>/)[0].to_s
		m << {:name=>"new powered by text", :version=>v }
        end

	# old versions
        if @body =~ /<Br><font size="2">Powered By X7 Chat Version [\d\.\ a-zA-Z]+<\/font>/
                v=@body.scan(/<Br><font size="2">Powered By X7 Chat Version ([\d\.\ a-zA-Z]+)<\/font>/)[0].to_s
                m << {:name=>"old powered by text", :version=>v }
        end

	m

end

end

