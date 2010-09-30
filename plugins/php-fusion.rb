##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Fusion" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-04 
version "0.1"
description "PHP-Fusion, a light-weight open-source content management system (CMS). PHP-Fusion is written in PHP and MySQL and includes a simple, comprehensive adminstration system. The most common features you would expect to see in many other CMS packages are included in PHP-Fusion. - homepage:http://www.php-fusion.co.uk/"
examples %w|
http://www.php-fusion.co.uk/
http://www.phpfusionstyle.com/
http://www.phpfusionmods.com/
http://www.php-fusion.nu/
http://www.phpfusion-nederlands.info/
http://www.phpfusion.cz/
http://www.php-fusion.pl/
http://php-fusion7.ru/
http://serverheaven.net/
http://esports-angelz.co.cc/
http://alttz.eu5.org/
http://www.caranet.co.uk/
http://www.vucjak.com/
http://www.moremusic.es/
http://www.islamiyete.com/
http://www.alltube.pl/
http://www.kouelohab.com/
http://www.egitimfakultesi.net/
http://www.liendoi.net/
http://www.lordoftheringsonline.net/
http://www.whisperwillow.com/
http://www.wethepeoplewillnotbechipped.com/main/
http://www.neilhague.com/
http://www.onepiecenakama.pl/
|

matches [

# About 57,800,000 results @ 2010-06-02
{:name=>'GHDB: "Powered by PHP-Fusion copyright" +intitle:News',
:certainty=>75,
:ghdb=>'"Powered by PHP-Fusion copyright" +intitle:News'
},

{:name=>"powered by text",
:text=>"Powered by <a href='http://www.php-fusion.co.uk'>PHP-Fusion</a> copyright &copy; 2002 - "
}

]

# Set-Cookie: fusion_visited=yes; expires=Thu, 02-Jun-2011 11:17:49 GMT; path=/
def passive
        m=[]
        m << {:name=>"fusion_visited Cookie" } if @meta["set-cookie"] =~ /fusion_visited=/
	m
end

end

