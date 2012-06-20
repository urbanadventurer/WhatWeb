##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CuteFlow" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-20
version "0.1"
description "CuteFlow - web-based workflow management - Homepage: http://sourceforge.net/projects/cuteflow/"

# ShodanHQ results as at 2012-06-20 #
# 8 for strMyLanguage

# Google results as at 2012-06-20 #
# 30 for intitle:"CuteFlow" "CuteFlow - Document circulation system" "Login" "Username" "Password" "Language"

# Dorks #
dorks [
'intitle:"CuteFlow" "CuteFlow - Document circulation system" "Login" "Username" "Password" "Language"'
]

# Examples #
examples %w|
79.120.177.122
115.113.122.45
amakha.org
approvebox.com
intranet.radialsa.com.br/cuteflow/
www.antioch-mbc.org/cuteflow/
www.gecamphenol.com:800/cuteflow/
www.redemptionrescueministries.org/workflow/
cuteflow.hwci.org.au
amrtur.net/tracker/
awardinput.psi.org
www6.hinesna.no/cuteflow/
salonculinaire.com/certifiedchef.com/certflow/
flow.allori.com.au
www.hiroshima-shinbouai.ed.jp/gakuen/cuteflowjp/
www.cfinfoconta.com/DEMOS/cuteflow/
www.testshop.php5.cz/rv/
64.131.69.65/CuteFlow/
modacolegial.com/cuteflow_v.2.11.2/
go4process.com/jcg/
www.emmanuelarreguez.com.ar/cuteflow/
|

# Matches #
matches [

# Powered by footer # Version Detection
{ :version=>/<a href="http:\/\/cuteflow\.org" target="_blank"><img src="images\/cuteflow_logo_small\.png" border="0"\s?\/><\/a><br>\s+<strong style="font-size:8pt;font-weight:normal">Version ([^\s^<]+)<\/strong><br>/ },

# Set-Cookie # strMyLanguage
{ :search=>"headers[set-cookie]", :regexp=>/^strMyLanguage=/ },

]

end

