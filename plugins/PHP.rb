##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2011-05-25 # Brendan Coles <bcoles@gmail.com>
# Merged php-error plugin and PHP plugin
# Added aggressive version detection using PHP credits page
# Added detection for "PHP Warning" HTTP header
##
# Version 0.3 # 2011-03-26 # Brendan Coles <bcoles@gmail.com>
# Added module detection
##
# Version 0.2 # 2011-01-19 # Brendan Coles <bcoles@gmail.com>
# Updated regex matches
##
Plugin.define "PHP" do
author "Andrew Horton & Brendan Coles" # 2010-10-26
version "0.4"
description "PHP is a widely-used general-purpose scripting language that is especially suited for Web development and can be embedded into HTML. This plugin identifies PHP errors, modules and versions and extracts the local file path and username if present. - Homepage: http://www.php.net/"

# ShodanHQ results as at 2011-05-25 #
# 5,345,848 for "server: PHP"
# 3,565,299 for "X-Powered-By: PHP"
# 189 for php-warning
# 30 for Error parsing on line

# Google results as at 2011-05-25 #
# 478 for PHP warning|error "in /home/*.php on line" ext:php -forum
# 463 for warning|error PHP inurl:error_log "in /home/*.php on line"
# 33 for PHP warning|error "in C:\Documents and Settings\*.php on line" ext:php -forum

# Dorks #
dorks [
'PHP warning|error "in /home/*.php on line" ext:php -forum',
'warning|error PHP inurl:error_log "in /home/*.php on line"'
]

# Examples #
examples %w|
129.217.108.130
202.235.202.65
81.169.165.201
88.191.98.199
69.46.9.245
210.158.243.55
72.13.88.196
67.222.45.85
96.46.184.46
81.169.173.100
209.205.127.135
96.0.245.3
95.187.225.232
195.42.102.207
116.58.194.4
85.42.95.194
128.241.54.213
82.139.7.250
201.34.79.162
66.29.49.30
212.130.55.137
64.130.117.21
65.181.183.138
65.181.154.208
66.39.68.120
216.92.197.111
202.172.29.61
76.75.214.230
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

# Aggressive # Version Detection # Credits Page
{ :url=>"/?=PHPB8B5F2A0-3C92-11d3-A3A9-4C7B08C10000", :version=>/<tr class="h"><th colspan="2">PHP (\d) Authors<\/th><\/tr>/ },
{ :url=>"/?=PHPB8B5F2A0-3C92-11d3-A3A9-4C7B08C10000", :version=>/<tr class="h"><th>PHP ([\d\.]+) Quality Assurance Team<\/th><\/tr>/ },

# PHP-Error # Extract local file path
{ :filepath=>/<b>(Warning|Fatal error)<\/b>: .* in <b>([^<]+)<\/b> on line <b>[0-9]+<\/b><br \/>/, :offset=>1 },

# PHP-Error # Extract username from unix style file path
{ :account=>/<b>(Warning|Fatal error)<\/b>: .* in <b>\/home\/([^<^\/]+)\/[^<]*<\/b> on line <b>[0-9]+<\/b><br \/>/, :offset=>1 },

# PHP-Error # Extract username from windows style file path
{ :account=>/<b>(Warning|Fatal error)<\/b>: .* in <b>[A-Z]{1}:\\(Documents and Settings|Users)\\([^<^\\]+)\\[^<]*<\/b> on line <b>[0-9]+<\/b><br \/>/i, :offset=>2 },

]

# Passive #
def passive
	m=[]

	# HTTP # Server # Version Detection
	m << { :version=>@headers["server"].to_s.scan(/[^\r^\n]*PHP\/([^\s^\r^\n]+)/i).to_s } if @headers["server"].to_s =~ /[^\r^\n]*PHP\/([^\s^\r^\n]+)/i

	# HTTP # Server # Module Detection
	m << { :module=>@headers["server"].scan(/[^\r^\n]*PHP\/[^\s^\r^\n]+ with (Hardening-Patch|Suhosin-Patch)/i).to_s } if @headers["server"] =~ /[^\r^\n]*PHP\/[^\s^\r^\n]+ with (Hardening-Patch|Suhosin-Patch)/i

	# HTTP # X-Powered-By
	m << { :version=>@headers["x-powered-by"].to_s.scan(/[^\r^\n]*PHP\/([^\s^\r^\n]+)/i).to_s } if @headers["x-powered-by"].to_s =~ /[^\r^\n]*PHP\/([^\s^\r^\n]+)/i

	# HTTP # X-Powered-By # Module Detection
	m << { :module=>@headers["x-powered-by"].scan(/[^\r^\n]*PHP\/[^\s^\r^\n]+ with (Hardening-Patch|Suhosin-Patch)/i).to_s } if @headers["x-powered-by"].to_s =~ /[^\r^\n]*PHP\/[^\s^\r^\n]+ with (Hardening-Patch|Suhosin-Patch)/i

	# PHP Error # PHP HTTP Header
	if @headers["php"] =~ /^Error parsing (.+) on line [\d]+$/

		# Local Filethpath Detection
		m << { :filepath=>@headers["php"].scan(/^Error parsing (.+) on line [\d]+$/) } unless @headers["php"] =~ /^Error parsing \/php\.ini on line [\d]+$/

		# Account Detection
		m << { :account=>@headers["php"].scan(/^Error parsing \/home\/([^\/]+)\/.+ on line [\d]+$/) } if @headers["php"] =~ /^Error parsing \/home\/([^\/]+)\/.+ on line [\d]+$/

	end

	# PHP Warning Header
	m << { :name=>"PHP Warning Header" } unless @headers["php warning"].nil?

	# Return passive matches
	m
end

end

