##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "error_log" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "This plugin identifies PHP error_logs and and extracts the local file path."

# Google results as at 2011-02-12 #
# 847,000 for warning|error inurl:error_log +PHP "on line"
# 269 for warning|error inurl:error_log +PHP "on line" inurl:".gov"

# Examples #
examples %w|
azgs.az.gov/az-shakes/concrete/blocks/image/error_log
azgs.az.gov/az-shakes/concrete/single_pages/dashboard/pages/error_log
cnc.gov.do/cnc/wp-content/plugins/event-calendar/error_log
cnc.gov.do/cnc/wp-content/plugins/featured-content-gallery/error_log
georgetown.id.gov/wp-content/plugins/event-calendar/K2/error_log
georgetown.id.gov/wp-content/plugins/event-calendar/error_log
eco.gov.kz/meteo/error_log
keralawomen.gov.in/blog/error_log
www.tbilisi.gov.ge/error_log
www.tbilisi.gov.ge/poll/error_log
www.camaracapivari.sp.gov.br/qc/themes/tiny/error_log
www.camaracapivari.sp.gov.br/qc/themes/rounded/model/error_log
www.puppetgov.com/wp-content/plugins/Viva-ThumbZoom/error_log
www.puppetgov.com/wp-content/plugins/Viva-ThumbZoom/lib/v-zoom/error_log
www.yanceycountync.gov/error_log
www.antalyadefterdarligi.gov.tr/error_log
www.sumqayit-ih.gov.az/new/includes/content/error_log
www.nab.gov.gh/nabsite/pages/error_log
www.consumidor.gov.ar/wp-content/plugins/wp-postratings/error_log
www.coloniasarmiento.gov.ar/institucional/inicio/archivo/2007/error_log
www.camaracapivari.sp.gov.br/qc/themes/twocolumn/model/error_log
www.fisheriescorporation.gov.lk/html/error_log
|

# Matches #
matches [

# Extract local file path
{ :filepath=>/\[[\d]{2}\-[A-Za-z]{3,4}\-[\d]{4} [\d]{2}:[\d]{2}:[\d]{2}\] PHP .{1,50}: .* in (.*) on line [0-9]+/ },

# Extract username
{ :account=>/\[[\d]{2}\-[A-Za-z]{3,4}\-[\d]{4} [\d]{2}:[\d]{2}:[\d]{2}\] PHP .{1,50}: .* in \/home\/([^\/]{1,32})\/.* on line [0-9]+/ },

]

end


