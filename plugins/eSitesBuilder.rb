##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eSitesBuilder" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.1"
description "Professional online website builder is complete website creation tool that offers everything you need to build a website: ad-free hosting, free domain names, website templates and website design, CMS, eCommerce and Real Estate solutions. Make your own website today, create a website in minutes: turnkey solutions from a Personal Website to a big Online Store. Try it now for Free! - homepage: http://www.esitesbuilder.com"

# 60 results for "powered by eSitesBuilder" @ 2010-08-28
examples %w|
realestate.esitesbuilder.com
ecommerce.esitesbuilder.com/ru/
personal.esitesbuilder.com/ru/
school.esitesbuilder.com/ru/
clan.esitesbuilder.com/ru/
books.esitesbuilder.com/ru/
software.esitesbuilder.com/ru/
hardware.esitesbuilder.com/ru/
venerasabirova.esitesbuilder.com
fgin.esitesbuilder.com/en/
software.com.ua/ua/
chist.com.ua/ru/
market.umh.ua/ru/
tech-business.kiev.ua
www.tehnoinet.com.ua/ru/
www.fgin.ru
www.brightgroup.com.ua
www.systemshift.com
www.kucha.com.ua
www.7continent.com.ua
www.vbal.com.ua
www.maskot.com.ua
www.danik.com.ua
www.santeco.com.ua
www.linza-ua.com
www.tolstosum.com.ua
www.automatica.kiev.ua
www.alpha-genics.com
www.alphagenics.com
www.dualex.com
|

matches [

# HTML comment
{ :text=>'<!-- created by XTLabs, Inc. http://www.xt-labs.com -->' },

# Powered by text
{ :regexp=>/<a [^href]+href="http:\/\/[www\.]*esitesbuilder.com">Powered by eSitesBuilder<\/a>/ },
{ :text=>'Powered by <a href="http://www.esitesbuilder.com/" target="_blank" alt="website builder">eSitesBuilder</a>' },
{ :text=>'All rights reserved. Powered by eSitesBuilder' },
{ :regexp=>/Powered by[&nbsp;]*[\s]*<a [^href]+href="http:\/\/[www\.]*esitesbuilder.com">eSitesBuilder<\/a>/ },
{ :text=>'Powered by <a href="http://www.esitesbuilder.com/" target="_blank" alt="website builder">eSitesBuilder</a>' },

]

end

