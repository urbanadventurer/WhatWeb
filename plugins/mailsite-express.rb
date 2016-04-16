##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# removed :probability & :name
##
Plugin.define "MailSiteExpress" do
author "Andrew Horton"
version "0.2"
description "Webmail in ASP. Versions < 6.1.2 insecure http://marc.info/?l=bugtraq&m=113053680631151&w=2 -"
website "http://www.mailsite.com/products/express-webmail-server.asp"

# <!-- This software is copyright 1999, 2000 Rockliffe systems, Inc. -->
# <!-- default.asp ver. 4.5.6 -->
# <title>MailSite Express</title>
# <font face="arial" size="1">MailSite Express <br> version 4.5.6</font>

# version 6
# <b>MailSite <em>Express</em> Login</b>
# onSubmit="OpenExpress(document.ExpressLogin)"

# 24 for intitle:"MailSite Express" "MailSite Express Login"

# Dorks #
dorks [
'intitle:"MailSite Express" "MailSite Express Login"'
]



# Matches #
matches [

{:text=>'<title>MailSite Express</title>' },
{:regexp=>/<font face="arial" size="1">MailSite Express <br> version [0-9\.]+<\/font>/ },
{:certainty=>50, :regexp=>/<!-- This software is copyright [0-9 ,\.]+ Rockliffe systems, Inc. -->/ },
{:text=>'<b>MailSite <em>Express</em> Login</b>' },
{:text=>'onSubmit="OpenExpress(document.ExpressLogin)"' }

]

end

