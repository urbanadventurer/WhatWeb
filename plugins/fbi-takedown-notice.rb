##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FBI-Takedown-Notice" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-29
version "0.1"
description "This plugin detects instances of the joint Department of Justice, FBI and IPR Center take down notice."
website "http://fbi.gov/"



# Matches #
matches [

# / # Takedown Notice Page
{ :md5=>"dc0743cd718f16198a72a501ae37fd9a" },
{ :md5=>"89a9a91804802c42fcc3aadbfaff0e55" },

# /banner.jpg
{ :url=>"/banner.jpg", :md5=>"5d1d926064c1a4a427100a5833d47dfd" },

]

end

