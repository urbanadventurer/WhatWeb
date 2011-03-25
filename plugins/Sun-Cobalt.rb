##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sun-Cobalt" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-25
version "0.1"
description "The Cobalt Qube was a computer server appliance product line developed by Cobalt Networks. The Cobalt RaQ is a 1U rackmount server product line developed by Cobalt Networks, Inc. - More Info: http://en.wikipedia.org/wiki/Cobalt_RaQ  &  http://en.wikipedia.org/wiki/Cobalt_Qube"

# Google results as at 2011-03-25 #
# 518 for "Welcome to the Web Site of" "Use your favorite FTP application to move your website to the web server."
# 399 for intitle:"Login - Sun Cobalt RaQ 550"
#  59 for intitle:"Login - Sun Cobalt Qube"

# Examples #
examples %w|
www.in-memoriam-uk.com/login/
mx1.tonitraduction.net:444/login
www.franck-duval.com:444/login
www.ciavieja.com:444/login
www.antiquegarmentrestoration.com:444/login
www.avenir-ttp.com:444/login
www.afibk.com:444/login
linkctp.com
dev.thinkfirst.com.au:444/login
www.drtaylor.com.au/login
www.arlingtonhills.com:444/login
rla.oakland.edu:444/login
janis220254020164.janis.or.jp:444/login.php
mail.np-npv.com:444/login.php
web02.kcc.hawaii.edu
web03.kcc.hawaii.edu
|

# Matches #
matches [

# Model Detection # Title
{ :model=>/<TITLE>Login - Sun Cobalt (Qube [\d]+|RaQ [\d]+) - [^<^\s]+[\n]?<\/TITLE>/ },

# Model Detection # JavaScript
{ :model=>/document.write\("\\nThank you for using the Sun Cobalt (Qube [\d]+|RaQ [\d]+)\.\\n"\);/ },

# Meta Copyright # 404 Error
# Shared by BlueOnyx and BlueQuartz and Sun Cobalt servers
{ :certainty=>25, :text=>'<META NAME="Copyright" VALUE="Copyright (C) 2000, Cobalt Networks, Inc.  All rights reserved.">' },

# Redirect Page # Shared by BlueOnyx and BlueQuartz and Sun Cobalt servers
{ :certainty=>25, :text=>'var url = "/login.php?expired=true&target="+escape(pathname+top.location.search+top.location.hash);' },

# Welcome to text # Shared by BlueOnyx and BlueQuartz and Sun Cobalt servers
{ :certainty=>25, :regexp=>/<P ALIGN="CENTER"><FONT SIZE="5" COLOR="#000099" FACE="HELVETICA, ARIAL"><B>Welcome to the Web Site of [^\s^<]+<\/B><\/FONT>/ },

# web root redirector
{ :certainty=>75, :text=>"<HTML><BODY onLoad=\"location='/login.php'\"></BODY></HTML>" },

]

end

