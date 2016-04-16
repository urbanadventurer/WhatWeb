##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HESK" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "Web-based help desk software featuring unlimited tickets, categories, knowledgebase, attachments and more. - Requires: PHP and MySQL"
website "http://www.hesk.com/"

# Google results as at 2011-08-05 #
# 487 for "Powered by Help Desk Software HESK"

# Dorks #
dorks [
'"Powered by Help Desk Software HESK"'
]



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

