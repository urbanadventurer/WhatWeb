##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tektroniks" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-03
version "0.1"
description "Tektroniks monitoring Solutions, Wireless monitoring Systems, Wireless data loggers & data loggers. Products include Wireless Monitoring System, Gas Leak Detection, Refrigeration Control Systems, DataLogger, Temperature sensors and Hand Held Thermometers. - Homepage: http://www.tek-troniks.com/site/products/"

# ShodanHQ results as at 2012-06-03 #
# 55 for Tektroniks

# Google results as at 2012-06-03 #
# 2 for intitle:"Login Page" "Registered users sign in on this page"

# Dorks #
dorks [
'intitle:"Login Page" "Registered users sign in on this page"'
]

# Examples #
examples %w|
94.193.100.95
176.35.141.5
82.138.192.65
176.35.141.5
78.32.19.33
90.155.82.139
92.27.91.233
213.160.100.104
80.45.123.23
109.170.213.83
80.45.175.126
80.229.140.84
81.137.102.158
81.2.71.250
90.155.52.161
90.155.77.188
109.69.233.30
79.123.26.112
90.155.67.171
89.240.11.133
212.169.36.56
|

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

