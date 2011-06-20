##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GpsGate-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-20
version "0.1"
description "GpsGate Server is a platform for web based GPS tracking of vehicles, valuable assets and persons. The modular GpsGate Server platform also allows you to configure, extend and customize applications to your needs. - Homepage: http://gpsgate.com/products/gpsgate_server"

# Google results as at 2011-06-20 #
# 37 for "GpsGate Server - Login" intitle:"GpsGate Server - Login"

# ShodanHQ results as at 2011-06-20 #
# 2 for gpsgateserver

# Dorks #
dorks [
'"GpsGate Server - Login" intitle:"GpsGate Server - Login"'
]

# Examples #
examples %w|
marathon.gpsgate.com
trackershop.gpsgate.com
gps.skidelivery.net/gpsgateserver/
www.itrak247.com.au/gpsApp/index.aspx
www.rastrealo.com/Login.aspx
www.northloc24.com
gpstrack.glaszer.com
srv3.kontrolloauto.com/Login.aspx
gpsguardian.pl:8001/monitoring/login.aspx
www.rastrealo.es/Login.aspx
www.chipsbay.com
bluetrack.gpsgate.com
primagroupinc.com
www.andromedagps.com
64.139.70.65
213.200.20.10/gpsgateserver/
gpsgate.atv.net.au
tracking.ccems.org
tracking.planetpin.com/trackingserver/
lbs.office.ccm-systems.com/gprs/
car-tracker.com.ua/gpsgateserver/
car-tracker.com.ua/gpsgateserver/VehicleTracker/
|

# Matches #
matches [

# Password input # HTML is static between languages unlike the username field
{ :text=>'<input name="LoginControl$TextBoxPassword" type="password" id="LoginControl_TextBoxPassword" tabindex="2" class="form" onfocus="document.getElementById(\'LoginControl_TextBoxPassword\').select()" value="password"' },

# Title
{ :regexp=>/<head><title>\r?\n\tGpsGate Server - Login\r?\n<\/title><\/head>/ },

]

end

