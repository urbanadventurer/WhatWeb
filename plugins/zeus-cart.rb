##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zeus-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.1"
description "Control every facet of your store, from merchandising to promotions and more. There are no limits to creativity with ZeusCart. - homepage: http://www.ajsquare.com/AJE-Commerce/product-home.php"

# 43 results for "powered by ZeusCart" @ 2010-08-06
examples %w|
points-goo.com
pc1source.net
www.natural-health-direct.co.uk/admin/
ajdemos.com/demo/zeuscart/v3/
indyabuy.com
koopjes.nu
sleep-supply.com
www.brandonraynor.com/onlinestore/
a9e9.com/store/
verysexylook.com
www.womenforwomenprogram.net/members/zeusdemo/
rhea-lr.com
pctintas.net
goldglob.com
|

matches [

{ :text=>'<img src="images/warning.gif">Warning: Installation directory exists ZEUSCART ROOT DIRECTORY/install. Please remove/rename this directory for security reasons.' },
{ :text=>'Powered by <a href="http://www.ajsquare.com/products/ecom/" style="color:#716f6f;" target="_blank">ZeusCart</a>' },
{ :text=>'<title>:: Zeuscart Admin Panel</title>' },

]

def passive
        m=[]

        if @body =~ /<title>[\s]+ZeusCart V([\d\.]+)[\s]+<\/title>/
                version=@body.scan(/<title>[\s]+ZeusCart V([\d\.]+)[\s]+<\/title>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

