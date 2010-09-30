##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PhpMesFilms" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.1"
description "homepage: http://phpmesfilms.dyndns.org/"

# 21 results for "powered by PhpMesFilms" @ 2001-08-21
examples %w|
phpmesfilms.dyndns.org/demo/admin/
www.zikadonf.net/association/bibliotheque/admin/
admin.domus.free.fr/video/
karabos.net/perso/phpmesfilms/
www.winmac-helper.net/phpmesfilms/
video.memotek.com
q2sac.free.fr/phpmesfilms_1.6/
rapin.gregory.free.fr/MesFilms/
|

matches [

{ :text=>'		<title>PhpMesFilms - Administration</title>' },
{ :text=>'		<title>PhpMesFilms - Liste</title>' },
{ :text=>'		<title>PhpMesFilms - Fiche film</title>' },
{ :text=>'				powered by <a href="http://phpmesfilms.dyndns.org/">PhpMesFilms</a>' },

]

end

