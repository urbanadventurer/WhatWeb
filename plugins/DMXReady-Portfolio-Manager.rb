##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DMXReady-Portfolio-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-06
version "0.1"
description "DMXReady Portfolio Manager is a fast and easy way to organize and display your online portfolio."
website "http://www.dmxready.com/?product=portfolio-manager"

# Google results as at 2011-07-06 #
# 35 for inurl:inc_portfoliomanager.asp

# Dorks #
dorks [
'inurl:inc_portfoliomanager.asp'
]



# Matches #
matches [

# CSS
{ :text=>'<link href="/css/PortfolioManager/styles_display_page.css" rel="stylesheet" type="text/css">' },

# JavaScript # View as slideshow link
{ :text=>"<a href=\"javascript:;\" class=\"menu_linkB\" onClick=\"window.open('/applications/PortfolioManager/components/inc_slideshowmanager.asp?index=0','send','toolbar=no,location=no,status=yes,menubar=no,copyhistory=yes,scrollbars=yes,width=700,height=520')\">" },

# input name="rememberme_portfoliomanager"
{ :text=>'<input name="rememberme_portfoliomanager" type="checkbox"  id="rememberme_portfoliomanager"   value="yes">' },

# Form HTML
{ :regexp=>/<form action="[^"]*\/applications\/PortfolioManager\/inc_portfoliomanager\.asp" method="POST" name="login" onSubmit="YY_checkform\('login','admin_username_portfoliomanager','#q','0','Please provide Username','admin_username_portfoliomanager','#q','0','Please provide Password'\);return document.MM_returnValue"/i },

]

end

