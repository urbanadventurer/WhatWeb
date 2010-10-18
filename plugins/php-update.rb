##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Update" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.1"
description "homepage: http://www.php-update.co.uk"

# 99 results for "powered by PHP-Update"
examples %w|
cubebot.bots-united.com
fritzbot.bots-united.com
familyclan.org
immo-elsendorf.de
kirke-helsinge-antennelaug.dk
noitinery.net
nieuweburcht.davenieuwenburg.nl
www.bestphotolessons.com
www.bjlelectrical.co.uk/index.php
www.bm-bauservice.de
www.dukasi.de/empor/
www.angrypixel.net/pressstart/
www.fogu.com/hm/
www.kasinokaraoke.com
www.katiegoestotokyo.com/text/
www.kyokushin-etne.net
www.larsnielsen.nu
www.modelcreator.com
www.modelcreator.dk
www.hsjmotorsport.net
www.ut.ee/FLKE/
|

matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.php-update.co.uk" target="_blank">PHP-Update</a>' },

{ :regexp=>/Powered by <a href=[^>]*http:\/\/www.php-update.co.uk[^>]*>PHP[\ \-]*Update<\/a>/ },

{ :regexp=>/>Powered by PHP-Update<\/a>/i },

{ :text=>'<a href="http://www.php-update.co.uk">Powered by PHP-Update </a>' },

]

end

