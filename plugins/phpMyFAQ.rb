##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpMyFAQ" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "phpMyFAQ - The FAQ system - homepage: http://faq.phpmyfaq.de/"

# 308 results for intitle:"powered by phpMyFAQ" @ 2010-10-12
examples %w|
faq.phpmyfaq.de
faq.aschool.com.au/Index.php
faqs.pcbsd.org
kelantan.gov.my/faq/index.php
millionhelp.texmedia.de
osresources.com
puppylinuxfaq.org
www.actatek.biz/faq/index.php
www.fulbrightalumni.info/faq/
www.previsora.gov.co/faq/
www.sandiegocesar.gov.co/phpmyfaq/index.php
www.shastidbullmastifflist.com/faq/
www.webyog.com/faq/index.php
|

matches [

# Version detection # Default title
{ :version=>/<meta name="generator" content="phpMyFAQ ([\d\.]+)" \/>/ },

# Version detection # Powered by text
{ :version=>/<p id="copyrightnote">powered by <a href="http:\/\/www.phpmyfaq.de[\/]*" target="_blank">phpMyFAQ<\/a> ([\d\.]+)/ },

# Default logo
{ :md5=>"8390bf2d1fe24799bbd381d1b7d6d00b",  :url=>"template/favicon.ico" },
{ :md5=>"8390bf2d1fe24799bbd381d1b7d6d00b",  :url=>"template/default/favicon.ico" },

]

end

