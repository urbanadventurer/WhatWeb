##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SiteCaddy" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-10
version "0.1"
description "Site Caddy offers a suite of online tools for marketing, content management, e-commerce and hosting - Homepage: http://info.sitecaddy.com/mysitecaddy/site3/"

# Google results as at 2012-04-10 #
# 258 for inurl:"mysitecaddy/site"|inurl:"mysitecaddy/site3"
# 207 for "Powered by SiteCaddy.com"

# More Sites #
# http://info.sitecaddy.com/mysitecaddy/site3/clientportfolio.htm

# Dorks #
dorks [
'inurl:"mysitecaddy/site"|inurl:"mysitecaddy/site3"'
]

# Examples #
examples %w|
info.sitecaddy.com/mysitecaddy/site3/
help.sitecaddy.com/mysitecaddy/site3/
vigitrust.com/mysitecaddy/site3
www.marlaygolfcourse.com/mysitecaddy/site3/competitions.htm
www.katebowepr.ie/mysitecaddy/site3/business.htm
www.blainroe.com/mysitecaddy/site3/members.htm
www.flanaganscelticcorner.com/mysitecaddy/site/contactus.htm
www.kilmashoguegc.ie/mysitecaddy/site3/member.htm
www.scarboroughfaironline.com/mysitecaddy/site3/foralloccasions.htm
www.lynchpintours.com/mysitecaddy/site3/legalconditions.htm
theisles.biz/mysitecaddy/site3/historyandculture.htm
www.vpsi.org/mysitecaddy/site3/responsibilityworkforce.htm
www.southcountygolf.ie/mysitecaddy/site3/courserules.htm
www.borujewelry.com/mysitecaddy/site3/shop/category.htm?categoryID=1538
celticcrossing.com/mysitecaddy/site3/kiltrental.htm
www.messagecaddy.com/mysitecaddy/site3/email/EmailPage.htm
mail.blackthorneceltic.com/mysitecaddy/site3/email/EmailPage.htm
sullivansirishalley.com/mysitecaddy/site3/shop/category.htm
|

# Matches #
matches [

# HTML Comments
{ :text=>'<!-- SECTION: bottom branding -->' },
{ :text=>'<!-- write title and meta tags -->' },

# ul class siteCaddyMenu
{ :text=>'<ul class="siteCaddyMenu menuLevel0 bottomNav" id="primaryNav">' },

# Powered by Link
{ :text=>'<a href="http://www.sitecaddy.com" title="Powered by SiteCaddy.com">' },

# Powered by logo
{ :text=>'<img src="/mysitecaddy/assets3/common/images/poweredbysitecaddy.gif" alt="Powered by SiteCaddy.com">' },

]

end

