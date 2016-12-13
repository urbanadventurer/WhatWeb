##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MivaMerchant" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-10
version "0.1"
description "MivaMerchant is a flexible and powerful eCommerce software that help businesses set up a professional online store, shopping cart system, secure checkout, and more."
website "http://www.mivamerchant.com/"

# ShodanHQ results as at 2012-06-26 #
# 1,299 for htscallerid

# Google results as at 2012-06-26 #
# 654 for inurl:merchant.mvc ext:mvc

# Dorks #
dorks [
'inurl:merchant.mvc ext:mvc'
]



# Matches #
matches [

# div id="mmcategorytree"
{ :text=>'<div id="mmcategorytree">' },

# inurl:merchant.mvc filetype:mvc
{ :ghdb=>'inurl:merchant.mvc filetype:mvc' },

# Set-Cookie # htscallerid
{ :search=>"headers[set-cookie]", :regexp=>/htscallerid=/ },

]

end

