##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zoph" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "Zoph (Zoph Organizes Photos) is a web based digital image presentation and management system. In other words, a photo album. It is built with PHP, MySQL and Perl. - homepage: http://www.zoph.org/"
# 26 results for inurl:albums.php inurl:parent_album_id @ 2010-07-10
examples %w|
www.zoph.org/demo/zoph.php
schoene.homelinux.org/zoph/zoph.php
zoph.falt-freunde.de/zoph.php
rawr.ca/zoph/zoph.php
www.hulsman.info/zoph/zoph.php
zoph.tenbrinke.net/zoph.php
tokyojim.com/photos/zoph.php
www.etcp.co.uk/zoph/zoph.php
www.hyfr.org/zoph/zoph.php
www.clean-wire.net/gallery/php/zoph.php
graphite.chem.nd.edu/html/kgig/zoph.php
number.ch/zoph/zoph.php
|

matches [

{:text=>'<li class="selected"><a href="zoph.php">home</a></li><li ><a href="albums.php">albums</a></li><li ><a href="categories.php">categories</a></li><li >' },

{:text=>"<title>Zoph - Home</title>" },

]

def passive
        m=[]

	# new versions
        if @body =~ /        <p class="version">/
                version=@body.scan(/            Zoph ([\d\.a-zA-Z\-]+)/)[0][0]
                m << {:version=>version}
        end

	# old versions
        if @body =~ /          <td colspan="2" align="center">/
                version=@body.scan(/            <font size="-1">Zoph ([\d\.a-zA-Z\-]+)<\/font>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

