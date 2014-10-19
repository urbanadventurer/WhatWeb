##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DrugPak" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "The DrugPak Software Suite is the premier random drug and alcohol testing management software available today. Hundreds of employers, TPAs, MROs, SAPs, clinics, hospitals, and occupational health departments use DrugPak to effectively and efficiently manage drug testing."
website "http://www.drugpak.com/"

# Google results as at 2011-05-31 #
# 175 for inurl:dplive.dll

# Dorks #
dorks [
'inurl:dplive.dll'
]



# Matches #
matches [

# Redirect Page
{ :text=>'<LINK REL=StyleSheet HREF="<#imagepath>/<#_style1 default=dpstyle.css>" TYPE="text/css" MEDIA=screen>' },

# Redirect Page
{ :certainty=>25, :text=>'<!--Assist making SSL connection-->' },

# Redirect Page # Powered by text
{ :text=>'<hr>Powered by DrugPak</body>' },

# Login Page # StyleSheet # /bin/dplive.dll/login
{ :text=>'<LINK REL=StyleSheet HREF="/dplimg/DPSTYLE.CSS" TYPE="text/css" media="all">' },

# HTML Comment + </BODY>
{ :regexp=>/<!--Request processed in [\d]{2} min, [\d]{2} sec, [\d]{3} ms--><\/BODY>/ },

]

end

