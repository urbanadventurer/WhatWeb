##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PnPSCADA" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-23
version "0.1"
description "Plug 'n' Play SCADA (PnPSCADA) - Hosted service or run on site - Homepage: http://www.pnpscada.com/productoffering.html"

# Google results as at 2011-09-23 #
# 7 for intitle:"PnPSCADA Login" "Note: This site uses Cookies, JavaScript and Popups"
# 6 for intitle:"Welcome to Plug and Play Scada"

# Dorks #
dorks [
'intitle:"PnPSCADA Login" "Note: This site uses Cookies, JavaScript and Popups"'
]

# Examples #
examples %w|
41.190.111.19
196.213.181.69
41.241.194.9
196.33.57.60
sdg.pnpscada.com
w.pnpscada.com
impactenergy.pnpscada.com
enos-l.pnpscada.com
https://blueskys.pnpscada.com
https://ww.pnpscada.com
|

# Matches #
matches [

{ :text=>'<TITLE>Welcome to Plug and Play Scada</TITLE>' },

{ :version=>/<CENTER><SPAN style='font-family:arial;font-size:10px'>PNPSCADA ([^\s]+) &copy;20[\d]{2} SDG Technologies cc\. All rights strictly reserved\. Please review our <A target='_blank' style='font-family:arial;font-size:10px' href='termsandconditions\.html'>Terms and Conditions<\/A>\. <\/SPAN><\/CENTER>/ },

]

end

