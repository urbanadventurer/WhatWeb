##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-12-06
version "0.1"
description "Family Connections CMS (FCMS) - Homepage: https://www.familycms.com/index.php"

# Google results as at 2011-12-06 #
# 404 for intitle:"powered by Family Connections"

# Dorks #
dorks [
'intitle:"powered by Family Connections"'
]

# Examples #
examples %w|
demo.opensourcecms.com/familycms/
demo.ourfamilycircles.com
www.clanwatson.info
www.teedfamily.com
smithsnconnors.com
www.teamstevens.com
blackeggserver.com
www.firstfamilyenterprise.com
marhelis.com
www.liongi.com
sarkar.ws
mayerfamily.info
www.shortypack.com/fcms/
babyhitz.com
www.hi.grabers.us
famillepiv.franceserv.com
houseofgaunt.net
combined-portal.com/Fam/
|

# Matches #
matches [

# Meta Author
{ :text=>'<meta name="author" content="Ryan Haudenschilt"/>' },

# Title
{ :regexp=>/- [pP]owered by Family Connections<\/title>/ },

# Title # Version Detection
{ :version=>/- [pP]owered by Family Connections ([^\s^<]+)[\s]*<\/title>[\s]*(<meta|<link)/ },

]

end

