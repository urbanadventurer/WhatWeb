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

# Dorks #
dorks [
'"Powered by PHP121"'
]



matches [

# Default title
{ :text=>'<title>PHP121 - Please login or register</title>' },
{ :text=>'<title>PHP121 - New User</title>' },

# Version detection # Powered by footer
{ :version=>/<center>Powered by <a target="_blank" style="TEXT-DECORATION: none; COLOR: #000066; FONT-SIZE: 10px" href="http:\/\/www.php121.com"><U>PHP121<\/U><\/a> v([\d\.]+)<\/center>/ },

]

end


