##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PhotoPost-PHP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "PhotoPost is photo sharing gallery software for your site that lets your users upload photos to galleries and to interact in photo discussions. Install it yourself, or let us get your gallery up and running in one day."
website "http://www.photopost.com/"

# 262 results for "powered by PhotoPost PHP" @ 2010-09-18

# Dorks #
dorks [
'"powered by PhotoPost PHP"'
]



matches [

# Admin page # Default title
{ :text=>'<title>PhotoPost Administration Menu</title>' },

# Admin page # Default frameset HTML
{ :text=>'<frame name="mainFrame"  src="adm-misc.php?admact=mainmenu" scrolling="yes" frameborder="0" marginwidth="0" marginheight="0" border="no" />' },

# Powered by text
{ :text=>'Powered by: <a target="_blank" href="http://www.photopost.com">PhotoPost</a> PHP<br />' },
{ :text=>'Powered by: <a target="_blank" href="http://www.photopost.com">PhotoPost</a> PHP vB3 Enhanced<br />' },

# Default title
{ :text=>' - Powered by PhotoPost</title>' },

]

end

