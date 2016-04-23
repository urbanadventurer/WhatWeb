##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-30 #
# Updated regex
##
Plugin.define "Zimplit-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-11
version "0.2"
description "Zimplit CMS: The easiest Open Source Content Management System for small web- and minisites"
website "http://www.zimplit.com/"

# Google results as at 2010-10-11 #
# 187 for "powered by Zimplit CMS"

# Dorks #
dorks [
'"powered by Zimplit CMS"'
]



# Matches #
matches [

# Javascript
{ :regexp=>/<script[^>]+src="http:\/\/(client\.zimplit|www\.zimplit|zimplit)\.(org|com)\/(users\/publicUser|editor)\/(jquery|ZimgZoomer|ZZMenu)\.js"[^>]*><\/script>/i },

# Version Detection # Javascript
{ :version=>/<script[^>]+src="http:\/\/(client\.zimplit|www\.zimplit|zimplit)\.(org|com)\/users\/publicUser_v([\d\._]+)\/(jquery|ZimgZoomer|ZZMenu)\.js"[^>]*><\/script>/i, :offset=>2 },

# HTML Comment
{ :text=>'<!-- YOU ARE ONLY ALLOWED TO HIDE, DELETE OR MODIFY "POWERED BY ZIMPLIT CMS" LINK, IF THE DOMAIN HAS BEEN REGISTERED WITH A COMMERCIAL LICENSE AT WWW.ZIMPLIT.ORG -->' },

# HTML Comment
{ :text=>"<!-- Please don't delete this. You can use this template for free and this is the only way that you can say thanks to me -->" },

# Powered by text
{ :regexp=>/<a[^>]+href="http:\/\/(www\.)?zimplit\.org\/?"[^>]*>Powered(&nbsp;| )by(&nbsp;| )Zimplit(&nbsp;| )CMS<\/a>/i },

# Powered by text
{ :regexp=>/Powered(&nbsp;| )by(&nbsp;| )<A[^>]+href="http:\/\/(www\.)?zimplit\.org\/?"[^>]*>Zimplit(&nbsp;| )CMS<\/A>/i },

]

end

