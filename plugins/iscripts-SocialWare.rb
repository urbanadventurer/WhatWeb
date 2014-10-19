##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iScripts-SocialWare" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "iScripts SocialWare is an open source social networking script with customizable features like blogs, albums, gift shop, classifieds ,chat, storefront etc."
website "http://www.iscripts.com/socialware/"

# 82 results for "powered by iScripts SocialWare" "A premium product from iScripts.com" @ 2010-07-11

# Dorks #
dorks [
'"powered by iScripts SocialWare" "A premium product from iScripts.com"'
]



matches [

{ :text=>"var loginWindow=window.open('http://www.meebo.com','ChatRoom','top=5 ,left=5,toolbars=no,maximize=no,resize=no,width=500,height=478,location=no,directories=no,scrollbars=yes,border=thin,caption=no');" },

{ :text=>'          <td align="right">Powered by <a href="http://www.iscripts.com/socialware/" target="_blank">iScripts SocialWare</a> . A premium product from <a href="http://www.iscripts.com" target="_blank">iScripts.com</a></td>' },

]


end

