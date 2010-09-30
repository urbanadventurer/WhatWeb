##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CaupoShop-Classic" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-29
version "0.1"
description "homepage: http://www.caupo.net"

# 6 results for "powered by CaupoShop Classic ver" @ 2010-08-29
# 121 results for "powered by CaupoShop Classic" @ 2010-08-29
# 217 results for inurl:csc_articles.php @ 2010-08-29
examples %w|
www.ugg.de/shop/csc_article_details.php
www.sievers-verlag.de/shop/en/csc_articles.php
www.iskh.de/demoshop/csc_articles.php
shop.sesamnet.ch/shop/csc_articles.php
www.batikkarten.ch/csc_articles.php
www.topfkraeuter.de/WebShop/csc_articles.php
www.western-union-band.de/shop/csc_articles.php
www.gleitschirm-magazin.com/shop/csc_articles.php
www.eurokursmuenzen-schach.de/shop/csc_articles.php
www.life-is-more.at/shop/csc_articles.php
|

matches [

{ :ghdb=>'inurl:csc_articles.php', :certainty=>75 },

# Powered by text
{ :regexp=>/   <td align="center"><small>&copy; 1998[\-0-9]* <a href="http:\/\/www.caupo.net" target="_blank">CaupoNet<\/a>/ },

]

# Version detection
def passive
        m=[]

	# Powered by text
        if @body =~ /   <td align="center"><small>Powered by CaupoShop Classic Ver. [\d\.]+<\/small><\/td>/
                version=@body.scan(/   <td align="center"><small>Powered by CaupoShop Classic Ver. ([\d\.]+)<\/small><\/td>/)[0][0]
                m << {:version=>version}
        end

	# HTML comment
	if @body =~ /<!-- CaupoShop Classic Ver. ([\d\.]+) [\(\d\-\)]* /
		version=@body.scan(/<!-- CaupoShop Classic Ver. ([\d\.]+) [\(\d\-\)]* /)[0][0]
		m << {:version=>version}
	end

        m

end


end

