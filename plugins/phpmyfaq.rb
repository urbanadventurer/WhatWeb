##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpMyFAQ" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "phpMyFAQ - The FAQ system"
website "http://faq.phpmyfaq.de/"

# 308 results for intitle:"powered by phpMyFAQ" @ 2010-10-12

# Dorks #
dorks [
'intitle:"powered by phpMyFAQ"'
]



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

