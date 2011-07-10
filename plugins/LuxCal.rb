##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LuxCal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-10
version "0.1"
description "LuxCal is a free user-friendly and lightweight web based event calendar. Requires PHP and MySQL - Homepage: http://www.luxsoft.eu/"

# Google results as at 2011-07-10 #
# 109 for "powered by LuxSoft" +LuxCal "Log In" Monday Tuesday Wednesday Thursday Friday Saturday Sunday

# Dorks #
dorks [
'"powered by LuxSoft" +LuxCal "Log In" Monday Tuesday Wednesday Thursday Friday Saturday Sunday'
]

# Examples #
examples %w|
www.luxsoft.eu/luxcal/
donwer-musek.lu/luxcal/index.php
bankschroef.nl/calendar/
www.mec.cuny.edu/calendar/
www.lickingcountybicycleclub.com/lcbcEvents/
anrc-services.com/calendar/
www.frolickingfrogwine.com/calendar/
www.wbymca.org/event-calendar230/index.php
www.penderhumane.org/calendar/
sportsedgebarandgrill.com/luxcal16/
www.theoriginalonsitegeeks.com/luxcal/
globalstrategicresources.com/luxcal/index.php
www.rct-it.co.za/viastep/luxcal/index.php
www.cottonwoodcenterforthearts.com/Luxcal/index.php
www.stmonicanepa.com/smluxcal/index.php
www.flagswipepaintball.com/luxcal232/
ffla.us/calendar/
torontomulticulturalcalendar.com/index.php
shubhmuhurat.in
|

# Matches #
matches [

# Meta Description
{ :certainty=>75, :text=>'<meta name="description" content="LuxCal web calendar - a LuxSoft product" />' },

# shortcut icon
{ :certainty=>75, :text=>'<link rel="shortcut icon" href="lcal.ico" />' },

# Meta Author
{ :certainty=>75, :text=>'<meta name="author" content="Roel Buining" />' },

# Powered by footer
{ :text=>"<span class=\"floatR\"><a href=\"http://www.luxsoft.eu\"><font size='1'>powered by </font><i><b><font size='2' color='#0033FF'>Lux</font><font size='2' color='#AA0066'>Soft</font></b></i></a></span>" },

# Version Detection # Footer HTML
{ :version=>/<b><i><font size='2' color='#0033FF'>Lux<\/font><font size='2' color='#AA0066'>Cal<\/font><\/i><\/b><font size='1'> version ([^<]+)<\/font>/ },

]

end

