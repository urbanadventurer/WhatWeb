##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ShoreTel-Converged-Conferencing" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-20
version "0.1"
description "ShoreTel Converged Conferencing"
website "http://www.shoretel.com/"

# User Guide #
# http://support.shoretel.com/products/converged_conferencing/7.1/downloads/converged_conferencing_7.1_user_guide.pdf

# Google results as at 2011-09-20 #
# 5 for "It appears that you are running a popup blocker that may be preventing *brand_product_acronym* from opening"



# Matches #
matches [

# /ics?action=display&display=opener # JavaScript
# Also used by Alcatel-Lucent and BroadSoft
{ :certainty=>75, :url=>"/ics?action=display&display=opener", :text=>'<script src="/ics?action=get_branding_js" charset="UTF-8"></script>' },

# /ics?action=display&display=opener # Hidden DIV
# Also used by Alcatel-Lucent and BroadSoft
{ :certainty=>75, :url=>"/ics?action=display&display=opener", :text=>'<DIV style="visibility:hidden;display:none" id="TEXT_OPENING_PRODUCT">Opening *brand_product_name*</DIV>' },

# /branding/default/ENG-US.js
{ :url=>"/branding/default/ENG-US.js", :text=>'this.product_name_long = "ShoreTel Converged Conferencing";' },

# /branding/default/ENG-US.js
{ :url=>"/branding/default/ENG-US.js", :md5=>"560374321ea7b2a57e5cac1df6611e36" },

]

end

