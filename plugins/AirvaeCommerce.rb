##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AirvaeCommerce" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.1"
description "Airvae Commerce 3.0 is a flexible, powerful, e-commerce shopping cart software offering clients, web developers, and I.T. professionals the perfect solution to deploy sophisticated, extensible, e-commerce solutions. - homepage: http://www.airvaecommerce.com/"

# 43 results for "powered by AirvaeCommerce" -Vulnerability @ 2010-08-22
examples %w|
airvaecommerce.com/ACI/
demo.airvaecommerce.com
www.greatbabyproducts.com
www.dogncatz.com
www.inflatablz.com
67.192.205.51
|

matches [

# Default CSS
{ :text=>'<link href="imgs/store.css" rel="stylesheet" media="screen">' },

]

# Version detection using pwoered by footer text
def passive
        m=[]

        if @body =~ /			<a href="http:\/\/www.airvaecommerce.com">Powered by AirvaeCommerce [\d\.]+ - E-Commerce Shopping Cart Software<\/a><br><br>/
                version=@body.scan(/			<a href="http:\/\/www.airvaecommerce.com">Powered by AirvaeCommerce ([\d\.]+) - E-Commerce Shopping Cart Software<\/a><br><br>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

