##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Bulletlink-Newspaper-Template" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-13
version "0.1"
description "Ready-to-use online newspaper templates"
website "http://bulletlink.com/"

# Google results as at 2011-09-13 #
# 252 for allinurl:target_form.asp?pform=
# 204 for "powered by bulletlink.com"

# Dorks #
dorks [
'allinurl:target_form.asp?pform=',
'"powered by bulletlink.com"'
]



# Matches #
matches [

# Powered by footer
{ :text=>'<br><div style="width: px; margin-left: auto; margin-right: auto;"><br><center><a href="http://bulletlink.com" target=_blank><font size=1>{ powered by bulletlink.com }</font></a></center><br></div>' },

# StyleSheet
{ :certainty=>75, :text=>'<link rel="stylesheet" href="/ModalPopup/core-modalpopup.css" type="text/css">' },

# Copyright
{ :text=>'<div class="copyright"><script type="text/javascript" language="JavaScript">GetCopyright();</script>&nbsp;&nbsp;&nbsp;<a class="copyright" href="/sitemap.asp">sitemap</a></div>' },

]

end

