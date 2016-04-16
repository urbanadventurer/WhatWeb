##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "linkSpheric" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.1"
description "linkSpheric. Possibly the world's coolest free online directory software that's absolutely free, no advertising, no spyware, just good old PHP-MySQL."
website "http://dataspheric.com/services/software/ls/"

# 61 results for "powered by linkSpheric" -Vulnerability @ 2010-08-21

# Dorks #
dorks [
'"powered by linkSpheric" -Vulnerability'
]



matches [

# Default CSS
{ :text=>'<style type="text/css" media="screen">@import "styles/ls_orange.css";</style>"' },

# Install Page
{ :text=>'<title>linkSpheric Installer</title>' },
{ :text=>'<p style="text-align: center;"><a href="admin/index.php"><img src="images/ls_logo.png" width="190" height="75" alt="Powered by linkSpheric" /></a></p>' },
{ :text=>'   <strong>linkSpheric Administrator:</strong>' },

# Powered by text
{ :text=>'<!--License terms require you to leave this link attribution intact.  You are only permitted to remove it by special arrangement with dataSpheric-->' },
{ :text=>'<!--License terms require you to leave this link attribution intact. You are only permitted to remove it by special arrangement with dataSpheric-->' },
{ :text=>'Powered by <a href="http://dataspheric.com/services/software/ls/" style="text-decoration: none; color: #000;"><strong>link<span style="font-size: 1.3em; color: #f60;">S</span>pheric</strong></a>' },

# Default logo
{ :md5=>'a421ddecd26e755219c63a130893d253', :url=>'images/ls_logo.png' }

]

end

