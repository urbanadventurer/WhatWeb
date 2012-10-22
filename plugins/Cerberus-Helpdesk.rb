##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cerberus-Helpdesk" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-10-22
version "0.1"
description "Cerberus Helpdesk - fast and flexible web-based platform for business collaboration and automation - Homepage: http://www.cerberusweb.com/"

# Google results as at 2012-10-06 #
# 16 for inurl:CerberusPublicGUI

# ShodanHQ results as at 2012-10-06 #
# 42 for CerberusPublicGUI

# Dorks #
dorks [
'inurl:CerberusPublicGUI'
]

# Examples #
examples %w|
62.84.129.171
204.15.49.93
107.6.25.98
75.126.166.241
181.14.219.95
209.43.124.74
208.17.243.244
204.13.152.31
64.211.69.217
212.39.75.8
www.clearedanddelivered.com/support-center/index.php
www.nextgenserver.com/server_reseller.htm
www.cyberhostuk.net/helpdesk/support-center/
www.dc02.net/demos/
www.bdsol.co.uk/support-center/
https://cosi.certilience.fr/support-center/
|

# Matches #
matches [

# CerberusPublicGUI Cookie
{ :search=>"headers[set-cookie]", :regexp=>/CerberusPublicGUI=[a-f\d]{32};/ },

# HTML Comment
{ :text=>'<!-- If you have your own stylesheet for HTML elements, you can remove the cerberus-html.css link -->' },

# articles link
{ :text=>'<td width="519" class="kb_most_viewed_articles">Most Viewed Knowledgebase Articles</td>' },

]

end

