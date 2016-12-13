##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WordFusion" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-07-25
version "0.1"
description "Zumesoft WordFusion - Enterprise document assembly and automation software"
website "http://www.zumesoft.com/"

# 1 result for intitle:"WordFusion.Web" intext:"Get Microsoft Silverlight" @ 2013-07-25

# Dorks #
dorks [
'intitle:"WordFusion.Web" intext:"Get Microsoft Silverlight"'
]


# Matches #
matches [

# Title
{ :regexp=>/<head id="Head"><title>\s+WordFusion\.Web\s+\<\/title>/ },

# Silverlight param
{ :text=>'<param name="source" value="ClientBin/WordFusion.Web.xap">' },

]

end

