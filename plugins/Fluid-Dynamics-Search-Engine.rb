##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Fluid-Dynamics-Search-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "FDSE is an easy-to-install search engine for local and remote sites. It returns fast, accurate results from a template-driven architecture. Freeware and shareware versions are available with Perl source. - Homepage: http://www.xav.com/scripts/search/"

# Google results as at 2011-03-17 #
# 180 for "Powered by the Fluid Dynamics Search Engine"

# Examples #
examples %w|
www.cmrb.vic.gov.au/cgi-bin/search/search.pl
mars1.jpl.nasa.gov/cgi-bin/redplanet/search.pl
www.stonepages.com/search/search.pl
www.ajb2.com/search/search.cgi
demo.nickname.net/latest/sr/search/search.pl
www.insidepolitics.org/search/search.pl
www.stenograph.com/cgi-bin/search.pl
www.xav.com/search.pl
dpnow.com/search/search.pl
www.micromountain.com/search/search.pl
www.asiarecipe.com/search/search.pl
www.redsearising.net/cgi-bin/search/search.cgi
www.tentmaker.org/search/search.pl
www.alexandria.ucsb.edu/search/search.cgi
www.fdhost.com/search.pl
www.counterpoint-music.com/search/search.pl
jpgsonline.com/search/search.pl
www.africanheart.com/cgi-bin/search/search.cgi
www.collectorsplants.com/cgi-bin/search/search.pl
www.plasmas.org/cgi-bin/search/search.cgi
www.fiftiesweb.com/cgi-bin/search/search.pl
www.eduscan.info/science/search8/search.pl
www.pastamachines.com/search/search.cgi
www.stonepages.com/search/search.pl
www.sports-media.org/search/search.pl
citruslocal.com/search/search.pl
www.newcovpub.com/cgi-bin/search/search.pl
cimi.webfarm.com/cgi-bin/search/search.pl
www.kentcounty.com/cgi-bin/search/search.cgi
www.libwil.com.au/cgi-bin/search/search.pl
www.traditionalplants.com/cgi-bin/search/search.pl
www.internationaleducationmedia.com/search/search.pl
www.amazing1.com/search/search.pl
www.visitor-flow.com/perl/search/search.pl
www.polymerclayexpress.com/search/search.pl
www.migenweb.net/search/search.pl
|

# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/Powered by the <a href="http:\/\/www.xav.com\/scripts\/search\/"[^>]*>Fluid Dynamics Search Engine<\/a> v([\d\.]+) &copy; 20[\d]{2}/ },

]

end


