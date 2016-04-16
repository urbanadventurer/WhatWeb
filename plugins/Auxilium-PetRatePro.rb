##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Auxilium-PetRatePro" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-18
version "0.1"
description "Auxilium PetRatePro"
website "http://www.auxiliumsoftware.com/PetRatePro/"

# Google results as at 2012-09-18 #
# 29 for inurl:"index.php?cmd=10" "Pets Rating"

# Dorks #
dorks [
'inurl:"index.php?cmd=10" "Pets Rating"'
]



# Matches #
matches [

# Form
{ :text=>'<form method="post" name="myform2" action="index.php?cmd=11">' },

# heading
{ :text=>'<p class="text"><b>Leader Of The Pack (Top 10 Pets)</b><br><br>' },

]

end

