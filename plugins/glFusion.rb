##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "glFusion" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Powerful content management with synergy, stability, & style. A dynamic system based on flexible and granular permissions, with spam protection, forums, file management, media gallery, calendars, polls, site-wide search, RSS feeds, and more! - Homepage: http://www.glfusion.org/"

# Google results as at 2011-03-15 #
# 376 for "Page created in" "seconds by glFusion" +RSS

# Examples #
examples %w|
www.glfusion.org
demo.glfusion.org
digital-rag.com
rowansimms.com
undernet-london.site90.net
www.geekslanding.com
www.filmroswell.com
www.bourneout.org.uk
www.web20site.com
biodiesel.ucsd.edu
www.conceptkids.com.au
grayonline.id.au
blog.islayinfo.com
www.ucdswimming.com
www.darwintraining.com
www.fantasticgaragefloors.com
digital-rag.com
godscharacter.com
cosmicnova.com
www.travelphotographers.net
puzzler.net
www.usable-web.com
208.111.34.140
dev.4islamicschools.org
www.ecsnet.com
www.iio.org
mp4-mobile.com
www.efpt.eu
www.chavescountycrimestoppers.com
www.hamradiocenter.com
www.pantyhosenews.com
www.60daypracticetransformation.com
www.worldwidetrading.com.au
www.deaded.com
www.transgenderart.net
www.andrewmckiernan.com
www.trains-n-town.com
www.caepipe.net
www.weboholics.com.au/glfusion/
www.c420.org
rowansimms.com
www.spacequad.com
pacdat.net
aniverse.info
ows.dontexist.com
www.asymptopia.org
www.betterbusroute.com
www.baltimorespokes.org
prayunceasingly.org
1wn.net
www.hiddenmysteries.net/gltest/
www.ghostshell.be
www.goldenbook.com
|

# Matches #
matches [

# div # gl_moomenu1
{ :certainty=>75, :regexp=>/<div (class|id)="gl_moomenu1">/ },

# ul # gl_moomenu1
{ :certainty=>75, :text=>'<ul class="gl_moomenu1">' },

# Page created in link
{ :regexp=>/Page created in [\d\.]+ seconds( |&nbsp;)by <a href="http:\/\/www.glfusion.org\/"[^>]*>glFusion<\/a>/ },

]

end


