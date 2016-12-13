##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GateQuest-PHP-Site-Recommender" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "GateQuest php Site Recommender is a simple recommendation software through which visitors can recommend your websites to a number of other recipients. Users are provided with error checking, recipient notifications and validation functions for facilitating sent messages. This flat file script is independent of database."
website "http://www.vclcomponents.com/PHP/Site_Recommendation/GateQuest_php_Site_Recommender-info.html"

# Google results as at 2011-02-18 #
# 62 for intitle:"GateQuest php Site Recommender - Include Method" "Recipient Email Addresses"

# Dorks #
dorks [
'intitle:"GateQuest php Site Recommender - Include Method" "Recipient Email Addresses"'
]



# Matches #
matches [

# Default title
{ :text=>'<title>GateQuest php Site Recommender - Include Method</title>' },

# Default CSS HTML
{ :certainty=>25, :text=>'<link rel="stylesheet" href="recommend.css" type="text/css">' },

# HTML Tag Patterns
{:name=>'HTML Tag Pattern', :tagpattern=>'!doctype,html,head,title,/title,link,/head,body,table,tr,td,a,img,/a,/td,/tr,tr,td,table,form,tr,td,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,span,/span,br,br,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,span,/span,br,textarea,/textarea,/td,/tr,tr,td,table,tr,td,input,/td,td,/td,td,input,/td,/tr,/table,/td,/tr,/form,/table,/td,/tr,/table,/body,/html'},
{:name=>'HTML Tag Pattern', :tagpattern=>'!doctype,html,head,title,/title,link,/head,body,table,tr,td,a,/a,/td,/tr,tr,td,table,form,tr,td,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,span,/span,br,br,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,span,/span,br,textarea,/textarea,/td,/tr,tr,td,table,tr,td,input,/td,td,/td,td,input,/td,/tr,/table,/td,/tr,/form,/table,/td,/tr,/table,/body,/html'},
{:name=>'HTML Tag Pattern', :tagpattern=>'!doctype,html,head,title,/title,link,/head,body,table,tr,td,a,,/a,/td,/tr,tr,td,table,form,tr,td,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,span,/span,br,br,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,/td,td,input,/td,/tr,tr,td,span,/span,br,textarea,/textarea,/td,/tr,tr,td,table,tr,td,input,/td,td,/td,td,input,/td,/tr,/table,/td,/tr,/form,/table,/td,/tr,/table,/body,/html'},

]

end


