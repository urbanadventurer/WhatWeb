##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HP-StorageWorks-Library" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-16
version "0.1"
description "HP StorageWorks Library and Tape Tools (L&TT) is a diagnostic tool for all of HP's tape storage and magneto-optical storage products."
website "http://h18006.www1.hp.com/products/storageworks/ltt/index.html"

# Google results as at 2012-02-16 #
# 2 for intitle:"HP StorageWorks" intitle:"Tape Library Webpages" "Command View MSL" "Account Type"

# Dorks #
dorks [
' intitle:"HP StorageWorks" intitle:"Tape Library Webpages" "Command View MSL" "Account Type"'
]



# Matches #
matches [

# /login.ssi
{ :url=>'/login.ssi', :text=>'<TD class="mastheadIcon"><img src="signin_logo.gif" border="0" alt="HP"></TD>' },

# /login.ssi
{ :url=>'/login.ssi', :version=>/<TITLE>HP StorageWorks (MSL[^\s]+) Tape Library Webpages<\/TITLE>/ },

# /index.htm
{ :url=>"/index.htm", :md5=>"63a4689c098daa89f62cc13069571204" },

]

end

