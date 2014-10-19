##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CultBooking" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "A comprehensive and free-of-charge Internet Booking Engine (IBE)"
website "http://www.cultuzz.com/cultbooking"

# Google results as at 2011-03-13 #
# 29 for inurl:cultbooking.php filetype:php

# Dorks #
dorks [
'inurl:cultbooking.php filetype:php'
]



# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>"inurl:cultbooking.php filetype:php" },

# Promotion Code Input # English
{ :text=>'<tr><td width="3%" align="center"><img src="img/default/small/pfeil_vor.gif" id="up2"/></td><td width="32%"> <p>Enter the promotioncode (if any)</p></td><td><input size="10" maxlength="20" name="promotionCode" align="right" value="" >' },

# Promotion Code Input # English
{ :text=>'<tr><td width="3%" align="center"><img src="img/default/small/pfeil_vor.gif" id="up2"/></td><td width="45%"> <p>Enter the promotion code (if any)</p></td><td><input size="10" maxlength="20" name="promotionCode" align="right">' },

# Promotion Code Input # German
{ :text=>'<tr><td width="3%" align="center"><img src="img/default/small/pfeil_vor.gif" id="up2"/></td><td width="45%"> <p>Promotioncode eingeben (falls vorhanden)</p></td><td><input size="10" maxlength="20" name="promotionCode" align="right">' },

# Font Size Links # English
{ :text=>'<span class="font" onclick="small();"> <img src="img/default/small.gif" alt="small font"> </span> <span class="font" onclick="medium();"><img src="img/default/medium.gif" alt="medium font" > </span> <span class="font" onclick="large();"> <img src="img/default/large.gif" alt="large font"></span></td>' },

# Font Size Links # German
{ :text=>'<span class="font" onclick="small();"> <img src="img/default/small.gif" alt="small font"> </span> <span class="font" onclick="medium();"><img src="img/default/medium.gif" alt="medium font" > </span> <span class="font" onclick="large();"> <img src="img/default/large.gif" alt="large font"></span></td>' },

]

end


