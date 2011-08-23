##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Swiki" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-24
version "0.1"
description "Swiki is a popular implementation of Ward Cunningham's WikiWikiWeb that runs under Comanche. - Homepage: http://wiki.squeak.org/swiki/"

# Google results as at 2011-08-24 #
# 39 for "powered by Squeak" "Squeak * :: Comanche * :: Swiki"

# Dorks #
dorks [
'"powered by Squeak" "Squeak * :: Comanche * :: Swiki"'
]

# Examples #
examples %w|
wiki.squeak.org
minnow.cc.gatech.edu
swiki.hfbk-hamburg.de:8888
coweb.cc.gatech.edu
mcl.open.ac.uk
www.cs.allegheny.edu/swiki/
home.cc.gatech.edu
42loop.de:8888
cool.coa.gatech.edu
myforexhome.biz
look.gvsu.edu:8000
ani.blueplane.jp
swiki-lifia.info.unlp.edu.ar
www2.dgb.ch:8080
222.228.236.133
perchta.fit.vutbr.cz
www.cip-arch.uni-hannover.de
www2.dgb.ch:8080
swiki.hfbk-hamburg.de:8888
swiki.cs.colorado.edu
swiki.fcla.edu:8000
coweb.cc.gatech.edu
microbio1.biologie.uni-greifswald.de:8080
perchta.fit.vutbr.cz
www2.dgb.ch:8080
|

# Matches #
matches [

# Aggressive # /defaultScheme/comSwiki.gif
{ :url=>"/defaultScheme/comSwiki.gif", :md5=>"81d538bed9f676fffbdaedb9d95cdbc1" },

]

# Passive #
def passive
	m=[]

	# Version Detection # Squeak / Comanche / Swiki
	if @body =~ /<a href="http:\/\/minnow\.cc\.gatech\.edu\/swiki" title="ComSwiki: powered by Squeak"><img src="[^"^>]*\/defaultScheme\/comSwiki\.gif" border=0 width=277 height=88 alt="ComSwiki: powered by Squeak"><\/a><br>[\s]*<em>(Squeak [^\s]+) :: (Comanche [^\s]+) :: Swiki ([^\s]+)<\/em>/
		m << { :string=>"#{$1}" }
		m << { :string=>"#{$2}" }
		m << { :version=>"#{$3}" }
	end

	# Return passive matches
	m
end

end

