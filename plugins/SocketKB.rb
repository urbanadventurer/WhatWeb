##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-31 #
# Updated regex
##
Plugin.define "SocketKB" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-08
version "0.2"
description "Deploy your own professional knowledge base or knowledge repository. Provide your customers the answers to their questions with SocketKB. Increase customer satisfaction and confidence. Easy and fast to install."
website "http://socketkb.com/site/home/"

# Google results as at 2010-11-08 #
# 15 for "Powered by SocketKB version" -intext

# Dorks #
dorks [
'"Powered by SocketKB version" -intext'
]



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/>Powered by SocketKB version ([\d\.]+)<\/a>/ },

]

end

