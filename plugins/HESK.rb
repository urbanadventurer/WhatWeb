##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HESK" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "Web-based help desk software featuring unlimited tickets, categories, knowledgebase, attachments and more. - Requires: PHP and MySQL - Homepage: http://www.hesk.com/"

# Google results as at 2011-08-05 #
# 487 for "Powered by Help Desk Software HESK"

# Dorks #
dorks [
'"Powered by Help Desk Software HESK"'
]

# Examples #
examples %w|
www.hesk.com/demo/
www.hesk.com/demo/admin/
techsupport.iearn.org/index.php
www.thetoothfairyletters.com/Hesk/
onlinebusiness2riches.com/hesk/
helpdesk.real-time-traffic.net
www.blackapplehost.net
https://moodle.hm.edu/support/
support.learninglikecrazy.com
www.davegaleonline.com/helpdesk/
www.safelistgeek.com/hesk/index.php
www.ewritecms.com/ticket/
support.pureadultweb.com
mobishark.com/helpdesk/
support.comvigo.com/
www.bcehosting.info/hesk/index.php
www.mensdatingadvice.com/hesk/
support.elkor.net/knowledgebase.php
www.perfect-diet-tracker.com/hesk/knowledgebase.php
support.kgdm.com/knowledgebase.php
www.rubihawk.com/helpdesk/knowledgebase.php
www.rapidace.com/helpdesk/knowledgebase.php
www.centurionwealthcircle.com/contact/knowledgebase.php
www.cybergenix.com.au/hesk/
gpscraper.com/support/knowledgebase.php
helpdesk.acutetools.com
support.yuplay.com/knowledgebase.php
www.globobux.com/support/
www.tacfitcommando.com/support/
www.speechagents.com/helpdesk/knowledgebase.php
www.talkingcommunities.com/helpdesk/index.php
www.melvinsoftware.com/support/
www.realbooksoftware.com/hesk
helpdesk.tfcash.com
www.rmaxinternational.com/hesk/
mobilesentry.net/hesk/
www.sexsim.com/helpdesk/index.php
www.rudegameware.com/hesk/knowledgebase.php
www.ced.berkeley.edu/cedhelp/index.php
lsc.wisc.edu/helpdesk/
www.indycc.edu/hesk/
extensiononline.tamu.edu/help-desk/knowledgebase.php
walkacrosstexas.tamu.edu/helpdesk/knowledgebase.php
helpdesk.brescia.edu/hesk/index.php
help.maconstate.edu/knowledgebase.php
slc-web.scilabs.lsa.umich.edu/hesk/
libs0600.library.iup.edu/hesk/knowledgebase.php
extensiononline.tamu.edu/help-desk/knowledgebase.php
www.uni.edu/chfa/chfatech/news.php
lpc1.laspositascollege.edu/blackboardsupport/
www.problems.ednet.lsu.edu/knowledgebase.php
educ-calvin.lsu.edu/~etshelpdesk/knowledgebase.php
helpdesk.colin.edu
https://fcs.tamu.edu/help-desk/knowledgebase.php
sacomaine.gov/helpdesk/index.php
|

# Matches #
matches [

# JavaScript
{ :regexp=>/<script language="Javascript" type="text\/javascript" src="(\.\.\/|\.\/)?hesk_javascript\.js"><\/script>/ },

# StyleSheet
{ :regexp=>/<link href="(\.\/)?hesk_style\.css" type="text\/css" rel="stylesheet"/ },
{ :regexp=>/<link rel="stylesheet" type="text\/css" href="(\.\/)?hesk_style\.css"/ },

# body onload
{ :text=>'<body onload="javascript:var i=new Image();i.src=\'./img/orangebtnover.gif\';var i2=new Image();i2.src=\'./img/greenbtnover.gif\';">' },

# Loading knowledgebase suggestions image
{ :text=>'<img src="img/loading.gif" width="24" height="24" alt="" border="0" style="vertical-align:text-bottom" /> <i>Loading knowledgebase suggestions...</i>' },

# HTML Comment
{ :text=>'<!-- START KNOWLEDGEBASE SUGGEST -->' },

# Admin Panel link
{ :text=>'<p style="text-align:center"><a href="admin/" class="smaller">Go to Administration Panel</a></p>' },

# Powered by link
{ :regexp=>/<p style="text-align:center"><span class="smaller">Powered by <a href="http:\/\/www\.hesk\.com" class="smaller"( target="_blank")? title="Free Help Desk Software HESK">Help Desk Software<\/a> HESK&trade;/ },

# Powered by link # Old versions < 1.0
{ :text=>'Powered by <a href="http://www.phpjunkyard.com/free-helpdesk-software.php" class="smaller" target="_blank">Help desk software</a> HESK<sup>TM</sup></span>', :version=>"<1.0" },

# Version Detection # Powered by link # Old versions < 1.0
{ :version=>/<p align="center"><font class="smaller">Powered by <a href="[^>^"]{0,256}" class="smaller" target="_blank">Help desk software Hesk<\/a> ([^\s^<]+)<\/font>/ },

]

end

