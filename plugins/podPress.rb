##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "podPress" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "podPress - A dream plugin for Podcastrs using WordPress. - Homepage: http://www.mightyseek.com/podpress"

# Google results as at 2011-03-17 #
# 523 for "Podcast powered by podPress"

# Examples #
examples %w|
www.mightyseek.com
clarkesworldmagazine.com
thewordnerds.org
podhammer.net
mediadriving.com
www.cyberneticpunks.com
noisetosignal.com.au/franklyspeaking/
www.radres.org/podcast/
www.audiocourses.com/podcasts/
www.baxtisweekly.com
37hz.net
www.twificpimps.com
www.ispeakhindi.com
worldsendradio.com
www.beyondwebanalytics.com
|

# Matches #
matches [

# Version Detection # cite powered by
{ :version=>/<cite>Podcast Powered by <a href="http:\/\/www.mightyseek.com\/podpress\/" title="podPress, the dream plugin for podcasting with WordPress"><strong>podPress \(v([\d\.]+)\)<\/strong><\/a><\/cite>/ },

# Version Detection # podPress_footer
{ :version=>/<div id="podPress_footer">Podcast powered by <a href="http:\/\/wordpress.org\/extend\/plugins\/podpress\/" title="podPress, a plugin for podcasting with WordPress"><strong>podPress v([\d\.]+)<\/strong><\/a><\/div>/ },

]

end


