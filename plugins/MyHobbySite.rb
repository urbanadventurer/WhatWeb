##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MyHobbySite" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.1"
description "MyHobbySite is a website Content Management System (CMS) programmed in PHP and tailored specifically for collectors of live music. Like any other CMS, MyHobbySite supports page creation, file management, and dynamic text editing via a WYSIWYG editor. - homepage: http://www.myhobbysite.net/"

# 71 results for "Powered by MyHobbySite" @  2010-09-12
examples %w|
www.myhobbysite.net
www.demo.myhobbysite.net
www.sjmike.com
www.themetalzone.net
www.bluefalcontrading.com
www.blackenedtrading.com
www.radikalproductions.org
www.myapocalypsetrading.com
www.spacemanrocks.net
www.lepermessiahtrading.com
www.allnightmarelongtrading.com
www.unforgiven-trading.com
www.bonjovi-trade.com
www.thejudaskiss.org
www.cotisproductions.com/cms/
www.noremorse-trading.com
www.metallicainc.com
www.visualmediatrade.com
www.anteroboots.com
www.hellonearthinc.net
www.apocalypsemusic.net
www.metcoverart.com/spawn/
www.thiswasjustmylife.com
jamroomlive.com
povrecordings.xtreemhost.com
www.dvd-bootlegs.ru
www.jezhead.com
www.bobmetallicafreaktrading.com
www.patkroll.com/trading/
www.ironmaiden.bz
metallicavideoarchive.net
www.deadonetrading.com/cms/
|

matches [

# Default title
{ :text=>' (Powered by MyHobbySite)</title>' },

# HTML comment
{ :text=>'					<!-- Removing the copyright notice without purchasing the MyHobbySite Copyright Removal License voids the MyHobbySite End User License Agreement -->' },

# HTML comment
{ :text=>'		<a name="top"></a> <!-- Necessary for the "jump to the top of the page" links -->' },

]

# Versiondetection using powered by text
def passive
        m=[]

        if @body =~ /Powered by <a href="http:\/\/www.myhobbysite.net" target="_blank">MyHobbySite<\/a> ([\d\.]+) /
                version=@body.scan(/Powered by <a href="http:\/\/www.myhobbysite.net" target="_blank">MyHobbySite<\/a> ([\d\.]+) /)[0][0]
                m << {:version=>version}
        end

        m

end


end

