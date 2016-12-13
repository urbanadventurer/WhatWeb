##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpMyBible" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-24
version "0.1"
description "phpMyBible is an online collaborative project to make an e-book of the Holy Bible."
website "http://sourceforge.net/projects/phpmybible/"

# Google results as at 2012-04-24 #
# 8 for inurl:"index.php?book=" inurl:"version=" inurl:"chapter="

# Dorks #
dorks [
'inurl:"index.php?book=" inurl:"version=" inurl:"chapter="'
]



# Matches #
matches [

# div class='randomverse'
{ :text=>"<div class='randomverse'>" },

# div class='fleft' and div class='chaphead'
{ :text=>"<div class='fleft'><div class='chaphead'>" },

]

end

