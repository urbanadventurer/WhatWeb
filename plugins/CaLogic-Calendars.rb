##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CaLogic-Calendars" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-27
version "0.1"
description "Web calendar - homepage: http://calogic.de/"

# 11 results for "This is your Timezone Offset from GMT and is shown in hours." @ 2010-08-27
examples %w|
www.demo.calogic.de
www.kaparealty.com/calogic/
www.acstextiles.com/calendar/
www.ictsolver.nl/CATS/
www.7373.org.uy/agenda/
fluffybunnies.net/calendar/
quimica.predic.com/cl/
www.lts2.home.pl/calogic/calogic122/
www.tampabaycatsailors.com/calogic/calogic113/
|

matches [

{ :text=>'    <h1><b>CaLogic Calendars Demo - Login</b></h1>' },

{ :text=>'Change for 1.2.2 : the logon form MUST use the post method for security reasons!!!', :version=>"1.2.2" },

{ :text=>'This is your Timezone Offset from GMT and is shown in hours. It is based on your computers time and country settings. The Timezone Offset is needed in order to show the correct date and time and to ensure that your reminders get sent on time.<br>If the Timezone Offset is not correct, then your computers time settings are wrong. You should not adjust the Timezone Offset, but rather correct your computers time settings.' },

]

# Version detection
def passive
        m=[]

        if @body =~ /<font size="-1">CaLogic Calendars V([\d\.]+)<\/font>/
                version=@body.scan(/<font size="-1">CaLogic Calendars V([\d\.]+)<\/font>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

