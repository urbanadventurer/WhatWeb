##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sweetrice" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-26
version "0.1"
description "SweeRice is a simple website management system ,it is not just free and open source, it provides popular functions such as SEO."
website "http://www.basic-cms.org/"

# Google results as at 2011-02-26 #
# 25 for Copyright "Powered By Basic CMS SweetRice" -dork

# Dorks #
dorks [
'"Powered By Basic CMS SweetRice" -dork'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="SweetRice ([\d\.]{1,5})" \/>/ },


# Powered by text
{ :text=>'Powered By <a href="http://www.basic-cms.org">Basic CMS SweetRice</a>' },

]

end


