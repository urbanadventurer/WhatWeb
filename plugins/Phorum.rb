##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Phorum" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-25
version "0.1"
description "Phorum - Forum - Requires PHP and MySQL - Homepage: http://www.phorum.org/"

# Google results as at 2011-10-25 #
# 364 for "This forum is powered by Phorum."

# Dorks #
dorks [
'"This forum is powered by Phorum."'
]

# Examples #
examples %w|
www.phorum.org/demo/
www.netstate.com/phorum/
www.breedersworld.com/forum/
www.ddiglobal.org/forum/
www.jnp.edu.bt/forum/
www.cantonese.sheik.co.uk/phorum/
www.moviedeaths.com/phorum/
www.ceanational.org/phorum/
www.worldpuzzle.org/wpfforum/
www.outinkingston.org/forum/
www.findmall.com
www.juggle.org/forum/
www.farmersinsurancegroupsucks.com/forum/
phorum.newhaven.edu
octagon.poly.edu/phorum/
forum.jab.ie.edu
avwxworkshops.com/forum/
forum.piwik.org
forum.fedora.cz
forum.lotniczapolska.pl
phorum.newhaven.edu
forums.stat.ucla.edu
www.vstabi.info/forum/
https://wwws.cs.umn.edu/forum/
|

# Matches #
matches [

# Powered by link
{ :regexp=>/powered by <a href="http:\/\/www\.phorum\.org\/"( target="_blank")?>Phorum<\/a>\./ },

# HTML Comment
{ :certainty=>75, :text=>'<!-- end of div id=user-info -->' },

]

end

