##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BOOKSolved" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-16
version "0.1"
description "BOOKSolved - guestbook script - Homepage: http://www.usolved.net/scripts_9.html"

# Google results as at 2011-10-16 #
# 297 for +BOOKSolved "by USOLVED"
# 172 for +BOOKSolved "by USOLVED" inurl:"booksolved.php"

# Dorks #
dorks [
'"BOOKSolved" "by USOLVED" inurl:"booksolved.php"'
]

# Examples #
examples %w|
www.bkh-cultcats.ch/book/booksolved.php
www.heimkinopage.de/gaestebuch/booksolved.php
www.ssv-sandhausen.de/gaestebuch/booksolved.php
www.tistelbodecats.ch/gb/booksolved.php
22ndbirthday.ellen-page.net/booksolved.php
www.postscriptum.no/guestbook/booksolved.php
www.bunker-soundz.de/seiten/peterbaerli/gb/booksolved.php
web409.can03.de/cmdegb/booksolved.php
www.historyswingers.ch/Gaestebuch/booksolved.php
www.the-starts.de/guestbook/booksolved.php
www.wild-spirit-tattoo.de/booksolved/booksolved.php
www.getback-beatlesnight.de/book/booksolved.php
|

# Matches #
matches [

# HTML Comment
{ :text=>'<!-- BOOKSolved - Copyright by www.usolved.net -->' },

# Version Detection # HTML Comment
{ :version=>/<!-- BOOKSolved v([^\s]+)- Copyright by www\.usolved\.net -->/ },

# Version Detection # Footer
{ :version=>/<tr><td style="text-align: center;">[\s]*BOOKSolved ([^\s]+) &copy; by <a href="http:\/\/www\.usolved\.net" (target="_blank" )?class="menu">USOLVED<\/a>/ },

]

end

