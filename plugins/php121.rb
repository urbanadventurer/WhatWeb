##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP121" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "PHP121 is a web based instant messenger - written entirely in PHP. This means that it will work in any browser on any operating system including Windows and Linux, anywhere! If traditional messaging programs like MSN Messenger or Yahoo! Messenger are blocked at your school or workplace, PHP121 will still work."

# 112 results for "Powered by PHP121" @ 2010-12-28
examples %w|
demo.php121.com/php121/php121login.php
www.haitisurf.com/netchat/php121/php121login.php
www.girlsblogspot.com/php121/php121im.php
www.warforceclan.com/wfcim/php121newuser.php
www.stlcitycircuitcourt.com/php121-2.2/php121-2.2/php121/php121im.php
www.im.mesententes.com/php121im.php
www.star97.com/chat/php121/php121im.php
www.eglnigeria.com/livechat/php121login.php
angelslosingsleep.net/php121/php121newuser.php
sserv.org/IM/php121im.php
www.amizades.biz/matchmaker/modules/php121/php121im.php
www.ajjegames.com/php121-2.2/php121/php121login.php
rockgrip.com/chat/php121/php121newuser.php
www.ithinkimlost.com/php121/php121im.php
www.superstarsofhorsetraining.com/php121/php121im.php
|

matches [

# Default title
{ :text=>'<title>PHP121 - Please login or register</title>' },
{ :text=>'<title>PHP121 - New User</title>' },

# Version detection # Powered by footer
{ :version=>/<center>Powered by <a target="_blank" style="TEXT-DECORATION: none; COLOR: #000066; FONT-SIZE: 10px" href="http:\/\/www.php121.com"><U>PHP121<\/U><\/a> v([\d\.]+)<\/center>/ },

]

end


