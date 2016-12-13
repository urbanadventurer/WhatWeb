##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Mall" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-20
version "0.1"
description "PHP Mall (formerly iBoutique.MALL) is a powerful and flexible multi vendors mall solution."
website "http://www.netartmedia.net/mall"

# Google results as at 2012-06-20 #
# 117 for "powered by PHP Mall"
#  10 for "powered by iBoutique.MALL"

# Dorks #
dorks [
'"powered by PHP Mall"',
'"powered by iBoutique.MALL"'
]



# Matches #
matches [

# iBoutique.MALL # Powered by link
{ :text=>'Powered by <a href="http://www.netartmedia.net/mall">iBoutique.MALL</a>' },

# iBoutique.MALL # Password field
{ :text=>'<td align="right"><input type=password class="login_form_text_field" name="Password"></td>' },

# PHP Mall # Powered by link
{ :text=>'Powered by <a href="http://www.netartmedia.net/mall" target="_blank">PHP Mall</a>' },

# PHP Mall # span class="price_style"
{ :text=>'<span class="price_style"><span class=price_style>' },

]

end

