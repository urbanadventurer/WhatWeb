##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Adcon-Telemetry-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-23
version "0.1"
description "Adcon Telemetry Gateway base station - Manages large networks of UHF, GSM and GPRS RTUs automatically."
website "http://www.adcon.at/"

# ShodanHQ results as at 2011-09-23 #
# 366 for addUPI Server



# Matches #
matches [

# Server Version Detection # HTTP Server Header
{ :search=>"headers[server]", :string=>/^addUPI (Server [^\s]+)/ },

# SSL Detection # HTTP Server Header
{ :search=>"headers[server]", :module=>/^addUPI Server [^\s]+ \+(SSL)/ },


### A840 #

# /mainpicture.jpeg
{ :url=>"/mainpicture.jpeg", :md5=>"1e051ae64434f4092dc98774ff592406" },

# Adcon link # A840
{ :text=>'<area href="http://www.adcon.at" coords="446,0,565,66" shape="rect" title="Adcon Telemetry" alt="Adcon Telemetry\'s web site">' },

# Version Detection # A840
{ :version=>/<font face="Verdana,Arial,Helvetica,Geneva" size="2">Release ([^\s^,]+), &copy;20[^\s]{2} Adcon Telemetry GmbH; all other trademarks mentioned here are registered with their owners\.<\/font>/ },

# Model Detection # A840
{ :model=>/<\/font> <font face="Verdana,Arial,Helvetica,Geneva" size="4"><b>Welcome to the ([^\s]+) Telemetry Gateway!<\/b><\/font>/ },


### A850 #

# /images/background.gif
{ :url=>"/images/background.gif", :md5=>"ba53de81edddae5e112c254d2ab182dc" },

# configurator link
{ :text=>'<a name="configurator" href="/cgi-bin/configurator.jnlp">configure your Gateway</a>.' },

# Version Detection # A850
{ :version=>/<hr>[\s]+<p>[\s]+Release ([^\s^,]+), &copy; 20[\d]{2} Adcon Telemetry GmbH<br>/ },

# Model Detection # A850
{ :model=>/<body onload="onLoadChangeConfiguratorLinks\(\)">[\s]+<h1 class="line1">([^\s]+) Telemetry Gateway<\/h1>/ },

]

end

