##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LotusCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "LotusCMS (previously ArboroianCMS) brings to the forefront design and design integration into one of the most neglected CMS niches - Databaseless Web-Design and Development."
website "http://www.lotuscms.org/"

# Google results as at 2011-03-16 #
# 10 for intitle:"LotusCMS Administration"
# 63 for "Powered by LotusCMS"

# Dorks #
dorks [
'"Powered by LotusCMS"'
]



# Matches #
matches [

# Powered by text
{ :text=>'Powered by: <a href="http://www.lotuscms.org">LotusCMS</a>' },
{ :text=>'Powered by <a href="http://www.arboroia.com/cmsproject/">ArboroianCMS</a>' },

# Menu
{ :text=>"<ul><li><a class='firstM' href='index.php?page=index'>Home</a></li><li><a class='normalM' href='index.php?system=" },

# Admin Page # Title
{ :text=>'<title>LotusCMS Administration</title>' },
{ :text=>'<title>.:Lotus Administration:.</title>' },

# Admin Page # Form
{ :text=>'<form method="POST" action="index.php?system=Admin&page=loginSubmit" id="contactform">' },

# HTML Comment
{ :text=>"<!-- Please don't delete this. You can use this template for free and this is the only way that you can say thanks to me -->" },

# Meta Keywords
{ :certainty=>25, :text=>'<meta name="keywords" content="LotusCMS" />' },

]

end


