##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetworX" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-19
version "0.1"
description "NetworX is PHP-based open source interactive social networking platform - Hompage: http://www.socialabc.com/"

# Google results as at 2012-04-19 #
# 12 for "powered by networx" "Privacy Policy Terms of Use About Us Contact Us"

# Dorks #
dorks [
'"powered by networx" "Privacy Policy Terms of Use About Us Contact Us"'
]

# Examples #
examples %w|
www.socialabc.com/demo/
iwebi.freeiz.com/password_recovery.php
www.bizbrokernet.com/password_recovery.php
worldbook.hostzi.com/privacy.php
v071842.home.net.pl/network/
ghanekarfamily.net/about.php
www.h2ms.co.uk/terms.php
word.nicbit.com/about.php
|

# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.socialabc.com">NetworX</a>' },

]

end

