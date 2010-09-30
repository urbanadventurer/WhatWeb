##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Burning-Board-Lite" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-26
version "0.1"
description "Burning Board 3 is the modern, secure and user friendly solution for your discussion board! - homepage: http://www.woltlab.com/products/burning_board/index_en.php"

examples %w|
demo.woltlab.com
board.devision-music.com
forum.jupload.biz
wesworld.jk-clan.de
www.evereve.net/wbblite/
evereve.eu/wbblite/
www.evereve.de/wbblite/
www.pbxes.com/forum/
pbx.i-p-tel.com/forum/
www.international-youthmeeting.de/forum/
scriptsharing.dv-team.de
board.hoax-irc.net
www.quasselcafe.com
the-giant-leap-fanclub.com/wbb/
http://www.farcry2-hq.com/forum/
www.madpole.org/wbb2/
www.boards-4you.de/wbb5/142/
www.uac-warfare.com/wbblite/
oldforum.gkbears.com
www.4-sforum.org/forum/
board.lindinger.at
board.fr-lehramt.de/
www.junbo.de/wbboard/
i-have-a-dreambox.com/wbb2/
www.forum.laeubi-soft.de
www.argueit.net
www.collectors-import.com/board/
voices-of-enchantment.com/Forum/
www.wwf4ever.de/forum/
squadselectforum.com/forum/
www.etcg.de/forum/
everevil.de/wbblite/
www.zepf-dental.eu/benex/wbblite_e/
storyteller.eojboards.com
punkfanzine.net/__BOARD__/
kotis-gilde.net/mod/forum/
ziehl-abegg.com/de/forum/
www.luther-allison.com/ba-ff/forum/index.php
turbocelica.nl/forums/
babes-board.ch
board.fight-for-midgard.com
romnation.net/forums/
|

matches [

# 309 results @ 2010-06-26
{:name=>'GHDB: "Powered by Burning Board" -exploit -dork -johnny',
:certainty=>75,
:ghdb=>'"Powered by Burning Board" -exploit -dork -johnny'
},

{:name=>'powered by text',
:certainty=>100,
:regexp=>/Powered by <a href="http:\/\/www.woltlab.de" target="_blank">Burning Board[\s]*<\/a>/
}

]

def passive
        m=[]

        if @body =~ /Powered by <b><a href="http:\/\/www.woltlab.de" target="_blank">Burning Board [Lite\ ]*[\d\.a-zA-Z]+<\/a><\/b>/
                version=@body.scan(/Powered by <b><a href="http:\/\/www.woltlab.de" target="_blank">Burning Board [Lite\ ]*([\d\.a-zA-Z]+)<\/a><\/b>/)[0][0]
                m << {:certainty=>100,:name=>"powered by version text v1",:version=>version}
        end

        if @body =~ /Powered by <b>Burning Board [\d\.]+<\/b> /
                version=@body.scan(/Powered by <b>Burning Board ([\d\.]+)<\/b> /)[0][0]
                m << {:certainty=>100,:name=>"powered by version text v2",:version=>version}
        end

        if @body =~ /<p class="copyright"><a href="http:\/\/www.woltlab.com">Forum Software: <strong>Burning Board&reg; [\d\.]*<\/strong>, developed by <strong>WoltLab&reg; GmbH<\/strong><\/a><\/p>/
                version=@body.scan(/<p class="copyright"><a href="http:\/\/www.woltlab.com">Forum Software: <strong>Burning Board&reg; ([\d\.]*)<\/strong>, developed by <strong>WoltLab&reg; GmbH<\/strong><\/a><\/p>/)[0][0]
                m << {:certainty=>100,:name=>"powered by version text v3",:version=>version}
        end



        m
end


end

