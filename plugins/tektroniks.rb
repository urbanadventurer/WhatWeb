##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tektroniks" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-03
version "0.1"
description "Tektroniks monitoring Solutions, Wireless monitoring Systems, Wireless data loggers & data loggers. Products include Wireless Monitoring System, Gas Leak Detection, Refrigeration Control Systems, DataLogger, Temperature sensors and Hand Held Thermometers."
website "http://www.tek-troniks.com/site/products/"

# ShodanHQ results as at 2012-06-03 #
# 55 for Tektroniks

# Google results as at 2012-06-03 #
# 2 for intitle:"Login Page" "Registered users sign in on this page"

# Dorks #
dorks [
'intitle:"Login Page" "Registered users sign in on this page"'
]



# Matches #
matches [

# / # Redirect Page # Redirect Message
{ :text=>'<p>Transfering you to login page in 2 seconds...</p>' },

# /login.htm # Login Page # label id="AU_LOGIN_ID_label"
{ :text=>'<td width="100"><label id="AU_LOGIN_ID_label" for="AU_LOGIN_ID" dataType="" required="true">User Name:</label></td>' },

# /login.htm # Login Page # meta name="Classification" # Device Type Detection
{ :url=>"/login.htm", :model=>/<meta name="Classification" content="(Tektroniks|DATAcentre) - ([^"]+)" \/>/, :offset=>1 },

# Meta Copyright # Year Detection
{ :string=>/<meta name="Copyright" content="&copy;(20[\d\-]+) (Tektroniks|DATAcentre)" \/>/ },

# Server # Tektroniks # Version Detection
{ :search=>"headers[server]", :version=>/^Tektroniks\/([^\s]+)$/ },

# WWW-Authenticate: Basic realm="Tektroniks" 
{ :search=>"headers[www-authenticate]", :text=>'Basic realm="Tektroniks"' },

]

end

