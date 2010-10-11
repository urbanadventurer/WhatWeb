##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Donations-Cloud" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-11
version "0.1"
description "The donations cloud is something like a tag cloud, only that it displays . donations. The more a person donates, the larger the link to his/her website will be. - homepage: http://www.zirona.com/software/wordpress-donations-cloud/"

# 58 results for "powered by Donations Cloud" @ 2010-10-11
examples %w|
www.zirona.com
lucrenainternet.com
myworldtour.net
robeverest.com
superwahmmy.com
thecelebritydb.com
www.attackvector.org
www.homepagerelated.com
www.ideiasparanegocios.com
www.padgamers.de
www.pcdicasuteis.com
www.ps3attitude.com
www.webmasterbulletin.net
|

matches [

# Default stylesheet
{ :text=>"wp-content/plugins/donationscloud//donationscloud.css' type='text/css' media='screen' />" },

# Default javascript
{ :text=>"if (dc_get('pp_amount').value == '') { alert(\"Please enter a donation amount.\"); return false; }" },

# Powered by text
{ :regexp=>/<p id='dc_credits'>powered by <a href=[\'|\"]+http:\/\/www.zirona.com\/software\/[^>]+>Donations Cloud<\/a><\/p>/i },

# Form HTML
{ :text=>"<form action='https://www.paypal.com/cgi-bin/webscr' method='post' id='dc_paypal_form' onsubmit='if (!dc_checkform()) return false;'>" },

]

end

