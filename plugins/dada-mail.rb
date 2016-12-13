##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dada-Mail" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "Dada Mail is a Contemporary Mailing List Manager. Dada Mail works brilliantly - especially when you want to run a verified, closed loop opt-in subscription-based mailing list that your subscribers can trust."
website "http://dadamailproject.com/"

# Google results as at 2011-03-18 #
# 469 for "Powered by Dada Mail" ext:cgi inurl:mail.cgi

# Dorks #
dorks [
'"Powered by Dada Mail" ext:cgi inurl:mail.cgi'
]



# Matches #
matches [

# GHDB
{ :ghdb=>'"Powered by Dada Mail" filetype:cgi inurl:mail.cgi' },

# HTML Comment
{ :regexp=>/<!-- Dada Mail is Copyright 1999 - 20[\d]{2} Justin Simoni -->/ },

# Version Detection # Powered by link
{ :version=>/Powered by <a href="http:\/\/(mojo.skazat.com|dadamailproject.com)" target="_blank" style="font-size:10px;font-family:Verdana,Arial">Dada Mail ([^\s^<]+)/, :offset=>1 },

]

end


