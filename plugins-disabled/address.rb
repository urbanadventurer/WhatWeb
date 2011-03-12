##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Address" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-25
version "0.1"
description "This plugin identifies the 'address' (X)HTML/XML element and extracts its value."

# Google rsults as at 2011-01-25 #
# 124,000,000 for "Apache" "Server at" intitle:"index of"

# Examples #
examples %w|
http://java.apache.org/
http://apache.xenvps.us/camel/apache-camel/1.6.4/
http://apache.garmtech.lv/activemq/apache-nms/1.1.0/
http://apache.mobiles5.com/camel/apache-camel/1.6.3/
http://apache.mirror.testserver.li/camel/apache-camel/1.6.4/
http://sixtiescinema.com/wp-content/plugins/forum-server/
http://aasafaris.com/travel_angola/wp-content/plugins/forum-server/
http://www.peaceconvergence.com/wp-content/plugins/forum-server/
http://cms.eng.ubu.ac.th/wp-content/plugins/forum-server/
http://proteinwisdom.com/wp-content/plugins/forum-server/
http://idolheaded.com/wp-content/plugins/forum-server/
http://www.sustainabilitycoalition.org/wp-content/plugins/forum-server/
http://adhdkvinnor.se/wp-content/plugins/forum-server/
http://www.transitgis.org/wp-content/plugins/forum-server/
http://patentlawcenter.pli.edu/wp-content/plugins/forum-server/
http://iubio.bio.indiana.edu/gil/work/server-stats/
http://fbsocial.com/Themes/Xbox360_Elite/images/
http://linux.csie.nctu.edu.tw/
http://download.radionetfm.net/
http://picklejuice.yatescentral.com/
http://health.allrefer.com/1/
http://www.dreamwidth.org/doc/server/
http://ftp.at.debian.org/
http://www.inertia.com/
|

# Matches #
matches [

	# Extract address value
	{ :string=>/<address>([^<]*)<\/address>/i },
	{ :string=>/<address value="([^"]+)"[^>]*>/i },

]

end


