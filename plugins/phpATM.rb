##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpATM" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-22
version "0.1"
description "phpATM (PHP Advanced Transfer Manager) is a free, open source, PHP based Upload and Download manager. But unlike most other of its kind it stores the data in flat text files and therefore does not require a database like MySQL installed on the web server. - Homepage: http://phpatm.org/"

# 304 for "Powered by phpATM"
# 91 for "Powered by phpATM" inurl:"viewer_bottom.php"

# Dorks #
dorks [
'"Powered by phpATM" inurl:"viewer_bottom.php"'
]

# Examples #
examples %w|
demo.phpatm.org
demo2.phpatm.org
www.zer0-m.org/phpatm/
recksistem.com
www.cerix.it/upload/
casimir1904.com/site/
download.laudenewtoncollege.com
www.foxdepo.com
spidersat.in
www.smkn2cirebon.net/download/
psi-plus.com/files/
carlosgomes.110mb.com/up/
eris.pwnspeak.com/
uploadalmacen.freei.me/
equi.se/lab1/
www.db.cams-and-more.li/
ulc.satangels.net
www.wlansupport.no
www.chip-tuner.hu/original_ecu_files/
www.portfolio.is
|

# Matches #
matches [

# Frameserv
{ :text=>'<frame name="viewer_bottom" src="viewer_bottom.php?file=' },

# Version Detection # Powered by footer
{ :version=>/<div id="phpatm">(<br>)?<a href="http:\/\/phpatm\.org\/" target="_blank" title="Powered by PHP Advanced Transfer Manager v([^"]+)">Powered by phpATM<\/a><br><\/div>/, :offset=>1 },

]

end


