##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CultBooking" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "A comprehensive and free-of-charge Internet Booking Engine (IBE) - Homepage: http://www.cultuzz.com/cultbooking"

# Google results as at 2011-03-13 #
# 29 for inurl:cultbooking.php filetype:php

# Examples #
examples %w|
cultbooking.com/cultbooking.php
www.sonnekalb.de/buchung/cultuzz/cultbooking.php
potsdam-hostel.com/CultBooking/cultbooking.php
klosterbraeuhaus.com/cultbooking/cultbooking.php
www.energiehotel-berlin.de/booking/cultbooking.php
www.gasthof-alpengluehn.co.at/cultbooking/cultbooking.php
www.hotel-zu-den-linden.de/cultbooking/cultbooking.php
gasthof-kranz.com/cultbooking/cultbooking.php
www.24zimmer.de/onlinebuchung/cultbooking.php
www.atlas-hotels.de/hotel-garmisch-zugspitze-buchung/cultbooking.php
www.kohsamuibeachresort.com/reservation/cultbooking.php
booking.hotel-pension-berlin.de/cultbooking.php
gasthof-kranz.de/cultbooking/cultbooking.php
www.kranz-lausheim.de/cultbooking/cultbooking.php
www.gasthauskranz.de/cultbooking/cultbooking.php
www.ferienwohnung-365.de/booking/cultbooking.php
www.mauritiusholidaydeals.com/CultBooking/cultbooking.php
|

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


