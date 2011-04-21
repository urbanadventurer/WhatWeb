##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "68-Classifieds-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-22
version "0.1"
description "68 Classifieds Script - Requires PHP - Homepage: http://www.68classifieds.com/"

# 83 for "powered by 68 Classifieds Script"

# Dorks #
dorks [
'"powered by 68 Classifieds Script"'
]

# Examples #
examples %w|
demo.68classifieds.com
demo.68classifieds.com/administration/login.php
www.reefclassifieds.co.uk
www.rvwholesalers.com/classifieds/
www.eastcoastbiker.net/classifieds/
www.advertisecoldlake.com/category.php
www.contractorresell.com
www.booksonlineclassifieds.com
ellapicerohispano.com
green.powerpoint3.com
www.ellapicerohispano.com
www.usedfurnitureshop.co.uk
|

# Matches #
matches [

# Powered by
{ :text=>'Powered by <a href="http://www.68classifieds.com">68 Classifieds Script</a>' },

# Version Detection # Meta Author
{ :version=>/<meta name="author" content="68 Classifieds - v([^"]+)" \/>/ },

]

end


