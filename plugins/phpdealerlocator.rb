##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpDealerLocator" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-16
version "0.1"
description "phpDealerLocator is a full featured zip code locator software - Requires: PHP and MySQL"
website "http://www.yourphppro.com/version/en-us/content/page_4.html"

# Google results as at 2011-08-16 #
# 7 for inurl:Locator/record.php?Dealer_ID

# Dorks #
dorks [
'inurl:Locator/record.php?Dealer_ID'
]



# Matches #
matches [

# select class="PythonSelect"
{ :text=>'<select class="PythonSelect" name="s_Dealer_Radius">' },

# record.php
{ :text=>"</td></tr></table><b>Database error:</b> Invalid SQL: SELECT Cat_Text FROM ( dealer_category_matrix RIGHT JOIN dealers ON dealers.Dealer_ID = dealer_category_matrix.DCM_Dealer_ID ) RIGHT JOIN category ON dealer_category_matrix.DCM_Cat_ID = category.Cat_ID WHERE Dealer_ID =  AND (Dealer_Publish = 'Y') AND (Dealer_Approved = 'Y')<br>" },

# label for="Dealer_Radiuss_Dealer_Zip"
{ :text=>'<td><label for="Dealer_Radiuss_Dealer_Zip">Zipcode/Postal Code</label></td>' },

]

end

