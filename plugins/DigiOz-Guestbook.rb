##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DigiOz-Guestbook" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-21
version "0.1"
description "DigiOz Guestbook - Homepage: http://www.digioz.com/"

# 459 for intitle:"powered by DigiOz Guestbook version"

# Dorks #
dorks [
'intitle:"powered by DigiOz Guestbook version"'
]

# Examples #
examples %w|
digioz.no-ip.org/guestbook/
www.rivers-avenue.de/gaestebuch2/list.php
www.meslekidenetim.com/guestbook/list.php
www.starafm.com/community/guestbook/list_depan.php
www.ljubek-fan.de/gb/
www.bluesmail.de/gaestebuch2/basis-cgi/list.php
www.fabricateatro.com/guestbook/guestbook.php
www.barrelstay.com/guestbook/list.php
franfriel.com/guestbook/index.php
|

# Matches #
matches [

# HTML Comments
{ :text=>'<!-- NOTE: PLEASE DO NOT REMOVE THE BELLOW 3 LINES FROM YOUR HEADER FILE -->' },
{ :text=>'<!-- NOTE: PLEASE DO NOT REMOVE THE ABOVE 3 LINES FROM YOUR HEADER FILE -->' },

# Version Detection # Title
{ :version=>/<title>Powered by DigiOz Guestbook Version ([\d\.]+)<\/title>/ },

# Version Detection # Copyright footer
{ :version=>/<a href="http:\/\/www\.digioz\.com"[^>]*>DigiOz (\.NET )?Guestbook Version ([\d\.]+)<br( \/)?>&copy; 20[\d]{2} DigiOz Multimedia\./, :offset=>1 },

]

end


