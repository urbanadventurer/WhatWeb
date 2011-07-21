##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Basic-PHP-Events-Lister" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-21
version "0.1"
description "PHP event calendar - Homepage: http://www.mevin.com/"

# Google results as at 2011-07-21 #
# 44 for "Powered by: mevin productions" inurl:event.php

# Dorks #
dorks [
'"Powered by: mevin productions" inurl:event.php'
]

# Examples #
examples %w|
www.mevin.com/downloads/events2/index.php
edisonplaza.com/events/event.php
www.axecapoeira-az.com/events/event.php
www.themoggies.com/events/event.php
www.relicriders.ca/events/event.php
glengarryhistoricalsociety.com/events/event.php
www.reidville-nl.ca/events/event.php
www.votechuckk.com/events/event.php
www.shelleyandcal.com/events/event.php
www.holyspiritacts.org/events/event.php
https://probobs.com/event.php
cwthompsonea.com/event/event.php
www.electchuckk.com/events/event.php
litchfieldlanding.com/event.php
www.boazum.eu/events/event.php
www.lwrvenlo.nl/eventlister/event.php
|

# Matches #
matches [

# Powered by text
{ :text=>'Powered by: <a href="http://www.mevin.com/">mevin productions</a>' },

# Admin Page
{ :text=>'<br /><center><input class="text" type="submit" name="submitBtn" value="Login" /></center>' },
{ :text=>'<center><br> <a href=recover.php>Lost your password?</a></center>' },

]

end

