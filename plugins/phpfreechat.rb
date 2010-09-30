##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpFreeChat" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-12
version "0.1"
description "phpFreeChat is a free, simple to install, fast, customizable and multi languages chat that uses a simple filesystem for message and nickname storage. - homepage: http://www.phpfreechat.net/"
examples %w|
www.phpfreechat.net/demo/
www.radioambientalfm.com/chat/
www.tvacapulco.com/chat/phpfreechat/
fr.lookotel.com/chat/phpfreechat-1.2/
makina.webou.net/phpfreechat-1.2/
www.fbinjapan.net/chat/
www.anarchywars.com/livechat/
www.nazarenoitatiba.org/chat/
fbc.hearhiscall.com/chat/
www.esam64.com/chat/
helppayit.com/chat/
dynamicenergies.com/phpfreechat/
sultanboys.com/chat/
midsouthweb.com/phpfreechat-1.0-beta9/
www.eskandani.com/chat/
www.kamiedownen.com/chat/
realestate-saltlakecityutah.net
|

matches [

# About 434,000 results @ 2010-06-12
{:name=>'GHDB: "powered by phpfreechat"',
:certainty=>75,
:ghdb=>'"powered by phpfreechat"'
}

]

# <a href="http://www.phpfreechat.net" style="text-align:center"><img src="http://www.phpfreechat.net/pub/logo2_80x15.gif" alt="PHP FREE CHAT [powered by phpFreeChat-]" /></a>
# <a href="http://www.phpfreechat.net" style="text-align:center"><img src="http://www.phpfreechat.net/pub/logo2_80x15.gif" alt="PHP FREE CHAT [powered by phpFreeChat-1.3]" /></a>
# <a href="http://www.phpfreechat.net" style="text-align:center"><img src="http://www.phpfreechat.net/pub/logo2_80x15.gif" alt="PHP FREE CHAT [powered by phpFreeChat-1.2]" /></a>
# <a href="http://www.phpfreechat.net" id="pfc_logo" target="_blank"><img src="http://www.phpfreechat.net/pub/logo_80x15.gif" alt="PHP FREE CHAT [powered by phpFreeChat-0.9.3]" title="PHP FREE CHAT [powered by phpFreeChat-0.9.3]" /></a>
# <a href="http://www.phpfreechat.net" style="text-align:center"><img src="http://www.phpfreechat.net/pub/logo2_80x15.gif" alt="PHP FREE CHAT [powered by phpFreeChat-1.0-final]" /></a>
# <a href="http://www.phpfreechat.net" style="text-align:center"><img src="http://www.phpfreechat.net/pub/logo_80x15.gif" alt="PHP FREE CHAT [powered by phpFreeChat-1.0-beta11]" /></a>
# <a href="http://www.phpfreechat.net" style="text-align:center"><img src="http://www.phpfreechat.net/pub/logo_80x15.gif" alt="PHP FREE CHAT [powered by phpFreeChat-1.0-beta9]" /></a>

def passive
        m=[]

        if @body =~ /<img src="http:\/\/www.phpfreechat.net\/pub\/logo[2]*_80x15.gif" alt="PHP FREE CHAT \[powered by phpFreeChat-[\d\.\-a-z]*\]"/
                version=@body.scan(/<img src="http:\/\/www.phpfreechat.net\/pub\/logo[2]*_80x15.gif" alt="PHP FREE CHAT \[powered by phpFreeChat-([\d\.\-a-z]*)\]"/)[0][0]
                m << {:name=>"powered by img alt",:version=>version}
        end

        m
end


end

# An aggressive plugin could check for the existance of a /demo folder.
# The demos still exist on many phpFreeChat isntallations, for example:
#  www.radioambientalfm.com/chat/demo/
#  www.tvacapulco.com/chat/phpfreechat/demo/
#  files.ttr.net.au/demo/
#  www.sahl-tec.com/demo/
# This plugin will also detect these demos as instances of phpFreeChat

