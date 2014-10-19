##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Yamamah" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-30
version "0.1"
description "Yamamah - Free photo Gallery"
website "www.yamamah.org/home/"

# Google results as at 2011-01-29 #
# 89 for "Powered By : Yamamah Version 1.00" -dork -exploit

# Dorks #
dorks [
'"Powered By : Yamamah Version 1.00" -dork -exploit'
]



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/<p>Copyright &copy; [\d]{4}  All rights reserved. Powered By : <a href="http:\/\/www.yamamah.org" title="Yamamah">Yamamah Version ([\d\.]{1,5})<\/a><\/p>/ },

# Meta Author
{ :text=>'<meta name="Author" content="Majed Al-Mulihani - majed@modernsys.net" />' },

# Meta Description
{ :text=>'<meta name="Description" content="Yamamah is free photo gallery cms" />' },

]

end


