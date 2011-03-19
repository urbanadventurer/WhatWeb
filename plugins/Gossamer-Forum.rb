##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Gossamer-Forum" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "Gossamer Forum is the ideal software solution to create, or enhance, any online community. Great features including a WYSIWYG Editor and powerful search makes Gossamer Forum one of the most fully featured forum scripts out there. - Homepage: http://www.gossamer-threads.com/products/gossamer-forum/"

# Google results as at 2011-03-19 #
# 74 for "Powered by Gossamer Forum" filetype:cgi inurl:gforum.cgi

# Examples #
examples %w|
www.freepcb.com/cgi-bin/gforum.cgi
www.seaturtle.org/gforum/gforum.cgi
www.wwwk.co.uk/gossamer/gforum.cgi
www.vegpeople.com/cgi-bin/gossamer/gforum.cgi
forum.bcdb.com/gforum.cgi
forum.etnus.com/cgi-bin/gforum.cgi
www.comedy-zone.net/forum/gforum.cgi
perlguru.com/gforum.cgi
www.wonderdesk.com/cgi-bin/forum/gforum.cgi
www.duckboats.net/cgi-bin/forum/gforum.cgi
74.54.219.242/~allan/cgi-bin/gforum.cgi
www.epilepsytoronto.org/cgi-bin/gforum.cgi
www.helpdesks.com/cgi-bin/gtforum/gforum.cgi
www.origami.net/cgi-bin/gforum/gforum.cgi
isabelcoyne.com/gforum/gforum.cgi
www.adoptaseaturtle.com/gforum/gforum.cgi
newboards.theonering.net/forum/gforum/perl/gforum.cgi
www.mexconnect.com/cgi-bin/forums/gforum.cgi
isedn.org/cgi-bin/gforum/gforum.cgi
forum.audiophilesound.it/cgi-bin/gforum.cgi
www.collectos.com/cgi-bin/forum/gforum.cgi
www.jojogunne.com/cgi-bin/forums/gforum.cgi
www.americanduderanches.com/cgi-bin/forum/gforum.cgi
www.aeablogs.org/cgi-bin/gforum/gforum.cgi
www.avenue-x.com/cgi-bin/gforum.cgi
beadleague.com/gforum.cgi
beadbanter.com/gforum.cgi
www.nightmagick.net/cgi-bin/NMForum/gforum.cgi
duckboats.net.nmsrv.com/cgi-bin/forum/gforum.cgi
beadhell.com/forum/General_Discussions_C2/General_Discussions_F2/gforum.cgi
forum.bandhistory.com/cgi-bin/gforum.cgi
forum.globalfight.com/cgi-bin/gforum.cgi
www.seo-news.com/cgi-bin/gforum/gforum.cgi
|

# Matches #
matches [

# GHDB
{ :ghdb=>"Powered by Gossamer Forum filetype:cgi inurl:gforum.cgi" },

# Error Page
{ :certainty=>75, :text=>'<title>Gossamer Forum: An error occured!</title>' },

# Version Detection # Powered by link
{ :version=>/Powered by <a href="http:\/\/www.gossamer-threads.com">Gossamer Forum v.([\d\.]+)<\/a>/ },

# Username Detection # username Parameter
{ :account=>/<a href="gforum\.cgi\?username=([^;^>^"]+);guest=[\d]+">/ },

]

end


