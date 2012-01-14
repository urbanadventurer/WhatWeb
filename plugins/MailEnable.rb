##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MailEnable" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-14
version "0.1"
description "Windows mail server software with webmail, caldav, carddav, antivirus, spam filtering and more. - Homepage: http://www.mailenable.com/"

# Google results as at 2012-01-14 #
# 87 for intitle:"MailEnable - Webmail" "Account Login" "MailEnable"

# Dorks #
dorks [
'intitle:"MailEnable - Webmail" "Account Login" "MailEnable"'
]

# Examples #
examples %w|
www.web-mail.co.il
mail.nad.gr
www.elaegypt.com
mail.biznetix.net
mail.naphs.net
mail.tossfed.org.tr
webmail.enter-system.com/mewebmail/mondo/lang/sys/login.aspx
webmail.softwebabl.it
www.miamicountyin.gov/mewebmail/
mail.manage.gov.in/mewebmail/
https://webmail.braathe.no/
|

# Matches #
matches [

# Login Page # HTML Comment
{ :text=>'</table><!-- loginPanel_shell_table -->' },

# Login Page # td class="loginPanel_botLeft"
{ :text=>'<td class="loginPanel_botLeft"><div class="loginPanel_botLeft_div"></div></td>' },

# Login Page # Title
{ :certainty=>75, :text=>'<title>MailEnable - Webmail</title>' },

]

end

