##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # Brendan Coles <bcoles@gmail.com>
# Added username extraction
# Version 0.3 # Brendan Coles <bcoles@gmail.com>
# Added local file path extraction
# Version 0.2
# removed :certainty
##
Plugin.define "PHP-Error" do
author "Andrew Horton"
version "0.4"
description "This plugin identifies PHP errors and extracts the local file path and username if present."

# Google results as at 2011-01-29 #
# 150,000,000 for PHP warning|error "in /home/*.php on line" ext:php -forum
# 15 for PHP warning|error "in C:\Documents and Settings\*.php on line" ext:php -forum

# Examples #
examples %w|
88.250.196.41
portal.ics.kagoshima-u.ac.jp/~pcp/main.php
www.rajawillem.org/master.php?nav=info
202.28.94.51/users/ngamnij/322731/menu.php
ddxsamx.com/stats/player.php
www.imcoimoveis.com.br/search.php
www.clementsalus.com/notamp.php?not=
itpak.net/wp-content/themes/default/
studio306.com/weblog/wp-content/themes/default/
yvonnelao.com/wp-content/themes/default/
zendedel.com/blog/wp-content/themes/classic/index.php
www.nurse-power.com/blog/wp-content/themes/default/
www.wunschrausch.com/blog/wp-content/themes/default/
www.parnamirim.rn.gov.br/tinus_parnamirim/ParnamirimOnLine.php
gp.macau.grandprix.gov.mo/gp/55/schedule.php
scijinks.jpl.nasa.gov/_calendar/calendar.php
hscap.kerala.gov.in/statreport/newschool.php
www.fucoa.gov.cl/radio/radio.php
www.simerj.rj.gov.br/Petropolis.php
www.peshawarhighcourt.gov.pk/cause_lists.php
www.leandertx.gov/page_print.php
|

# Matches #
matches [

	# Extract local file path
	{ :filepath=>/<b>(Warning|Fatal error)<\/b>: .* in <b>([^<]+)<\/b> on line <b>[0-9]+<\/b><br \/>/, :offset=>1 },

	# Extract username from unix style file path
	{ :string=>/<b>(Warning|Fatal error)<\/b>: .* in <b>\/home\/([^<^\/]+)\/[^<]*<\/b> on line <b>[0-9]+<\/b><br \/>/, :offset=>1 },

	# Extract username from windows style file path
	{ :string=>/<b>(Warning|Fatal error)<\/b>: .* in <b>[A-Z]{1}:\\(Documents and Settings|Users)\\([^<^\\]+)\\[^<]*<\/b> on line <b>[0-9]+<\/b><br \/>/i, :offset=>2 },

]

end


