##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Comanche" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-24
version "0.1"
description "Comanche is an open-source web server for Squeak. Comanche contains the server framework, which makes it possible to develop web applications entirely in Squeak, without the need to run an external web server. - Homepage: http://wiki.squeak.org/swiki"

# Examples #
examples %w|
wiki.squeak.org
minnow.cc.gatech.edu
swiki.hfbk-hamburg.de:8888
coweb.cc.gatech.edu
mcl.open.ac.uk
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

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Comanche\/([^\s]+)/ },

]

end

