##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Iciniti-Store" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-09
version "0.1"
description "Iciniti Store is a highly customizable shopping cart that is fully integrated with the Sage Accpac ERP accounting system. - Homepage: http://www.iciniti.com"

# This plugin requires more matches

# Google results as at 2012-03-09 #
# 47 for inurl:"logon_forgot_password.aspx"

# Dorks #
dorks [
'inurl:"logon_forgot_password.aspx"'
]

# Examples #
examples %w|
http://shop.stephenjosephinc.com/logon_forgot_password.aspx
http://www.projectorlampsource.com/logon_forgot_password.aspx
http://www.projectorlampexperts.com/logon_forgot_password.aspx
http://www.dragonusaonline.com/logon_forgot_password.aspx
http://96.57.128.190:8000/Store/logon_forgot_password.aspx
http://trx.corbeilph.com/store/logon_forgot_password.aspx
http://store.stottpilates.com/store/logon_forgot_password.aspx
http://webstore.cnib.ca/logon_forgot_password.aspx
http://www.randmar.com/logon_forgot_password.aspx
http://www.crabtreebooks.com/Store/logon_forgot_password.aspx
https://www.cwbstore.org/CWBStore/logon_forgot_password.aspx
https://www.colourintelligence.com.au/logon_forgot_password.aspx
http://www.gummersonfabrics.com.au/Gumweb/logon_forgot_password.aspx
http://www.e-todays.com/logon_forgot_password.aspx
http://www.wileyx.com/EcommSuite/logon_forgot_password.aspx
https://www.mysmartstart.com/logon_forgot_password.aspx
http://www.prosport.net/logon_forgot_password.aspx
http://www.shopaat.com/logon_forgot_password.aspx
http://www.regentstoneproducts.com/logon_forgot_password.aspx
https://us.shuttle.com/logon_forgot_password.aspx
https://secure.interstatelabel.com/logon_forgot_password.aspx
|

# Matches #
matches [

# HTML Comment
{ :text=>'<!-- START (content_stylesheet.inc) -->' },

]

end

