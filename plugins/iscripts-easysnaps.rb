##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iScripts-EasySnaps" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "iScripts EasySnaps is an open source image hosting script."
website "http://www.iscripts.com/gallery/"

# 20 results for "powered by iScripts EasySnaps" "A premium product from iScripts.com" @ 2010-07-11

# Dorks #
dorks [
'"powered by iScripts EasySnaps" "A premium product from iScripts.com"'
]



matches [

{ :text=>'          <td height="25" align="center" bgcolor="#000000">Powered by <a href="http://www.iscripts.com/gallery/" target="_blank">iScripts EasySnaps</a>. A premium product from <a href="http://www.iscripts.com/" target="_blank">iScripts.com</a>' },

]


end

