##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LandShop" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-01
version "0.1"
description "LandShop - Open Source Real Estate System"
website "http://www.landshop.gr/"

# Google results as at 2012-04-01 #
# 59 for "Powered by LandShop" inurl:"action"

# Dorks #
dorks [
'"Powered by LandShop" inurl:"action"'
]



# Matches #
matches [

# Powered by
{ :regexp=>/<a class="white" href="http:\/\/www\.landshop\.gr" target="_blank" (alte="Samedia LandShop")? title="Samedia Landshop">Land[Ss]hop<sup>&reg;<\/sup><\/a><br>/ },

# div class="more CAT"
{ :text=>'<div class="more CAT" style="height:20px;margin:5px 0px 10px 0px;text-align:right"><a class="item fat"  href="ls.php?' },

# ./admin # Admin Page # HTML Comment
{ :text=>'<!--<A href="<#G_ADMIN_URL#>/action/contacts.php?action=list"><#list_contacts#></a>-->' },

]

end

