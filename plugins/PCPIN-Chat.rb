##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PCPIN-Chat" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "PCPIN Chat is a powerful and secure professional instant messaging system written in PHP and MySQL. It has large ammount of features and highly customizable. PCPIN Chat was written with security considerations in mind, so there is only one public discovered vulnerability in a default configuration since more than 5 years!"
website "http://www.pcpin.com/?view=Projects"

# Google results as at 2011-03-15 #
# 36 for "powered by PCPIN.com"
# 20 for "powered by PCPIN.com" -dork -exploit

# Dorks #
dorks [
'"powered by PCPIN.com" -dork -exploit'
]



# Matches #
matches [

# HTML Comment
{ :text=>"<!-- Please don't remove next line. Thank You! -->" },

# Powered by text # Old
{ :text=>'<a href="http://www.pcpin.com" style="font-size:10; color:#990000;" target="_blank">Powered by PCPIN.com</a>' },

# Powered by text # New
{ :text=>'Powered by <a href="http://www.pcpin.com/" target="_blank" title="Powered by PCPIN Chat">PCPIN Chat</a>' },

# Submit button # regex match for case sensitivity and multiple languages
{ :regexp=>/<INPUT type="submit" class="buttons" value="[^"]+" onClicK="document.loginform.register.value=0; document.loginform.lostpassword.value=0">/ },

]

end


