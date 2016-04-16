##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ZIPBOX-Media" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "With ZIPBOX start selling digital music, images, videos, books and more with your own secure online customizable website with credit card processing, file storage and much more."
website "http://www.zipboxmedia.com/"

# Google results as at 2011-03-13 #
# 34 for "POWERED BY ZIPBOX MEDIA" inurl:"album.php"

# Dorks #
dorks [
'"POWERED BY ZIPBOX MEDIA" inurl:"album.php"'
]



# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>'"POWERED BY ZIPBOX MEDIA" inurl:"album.php"' },

# Powered by text
{ :text=>'<a href="http://www.zipboxmedia.com" class="zbm"><img src="/images/zb_rotate_ft.gif" alt="Powered By ZIPBOX Media" border="0" /></a>' },

# Referral Link
{ :regexp=>/<a href="https:\/\/secure.zipboxmedia.com\/signup\/\?referral=[\d]+" class="zbm" title="get your own ZIPBOX Media Store"><img src="\/images\/get_zipbox.gif" alt="Get A ZIPBOX Media Store" border="0" \/><\/a>/ },

# Load more messages link
{ :regexp=>/<h3 style="padding-top:2px; margin:0px; display:none"><a href="javascript:loadMoreMessages\([\d]+\)" id="load_more_messages">Load more messages<\/a><\/h3>/ },

]

end

