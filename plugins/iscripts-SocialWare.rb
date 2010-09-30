##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iScripts-SocialWare" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "iScripts SocialWare is an open source social networking script with customizable features like blogs, albums, gift shop, classifieds ,chat, storefront etc. - homepage: http://www.iscripts.com/socialware/"

# 82 results for "powered by iScripts SocialWare" "A premium product from iScripts.com" @ 2010-07-11
examples %w|
www.iscripts.com/socialware/demo/confessions.php
www.welcomeecuador.com/social/confessions.php
jandapal.com
nijimo.com/beta/confessions.php
www.homeschoolnetworks.com
www.pawsland.com
www.superconcentratedbrainjuice.com
asianchatonline.com/confessions.php
www.socioboom.com
bdmyspace.com
www.nuffvibes.net
www.planetwhisper.com
igazeebo.org/confessions.php
www.socialwebclub.com/confessions.php
cantresonline.com/confessions.php
personal4you.com/profile.php?profile=sifat
amdriven.com
italkfriends.com
community.jijole.com/profile.php
thedistancelearningnetwork.com
www.deshifacebook.com/confessions.php
superwhack.com/events.php
famstory.co.uk
thebarristerslounge.com/confessions.php
worldwidesantaclaus.net/forums.php
www.viralimalai.com/events.php
meetntreat.com/userlogin.php
blendedfamily.ca/confessions.php
babblefish.com/sn/search.php
www.insert24.de/comnet/confessions.php
masterqmacteam.com/social/index.php
egfcostaricacommunity.com/profile.php
www.nirmalacollege.com/profile.php
www.clubng.com/news.php
praminhacasa.com
www.expatmafia.com/events.php
fremantle.appsclub.com/classifieds.php
bentleysquare.org/social/forums.php
best-running-club.com/tips.php
|

matches [

{ :text=>"var loginWindow=window.open('http://www.meebo.com','ChatRoom','top=5 ,left=5,toolbars=no,maximize=no,resize=no,width=500,height=478,location=no,directories=no,scrollbars=yes,border=thin,caption=no');" },

{ :text=>'          <td align="right">Powered by <a href="http://www.iscripts.com/socialware/" target="_blank">iScripts SocialWare</a> . A premium product from <a href="http://www.iscripts.com" target="_blank">iScripts.com</a></td>' },

]


end

