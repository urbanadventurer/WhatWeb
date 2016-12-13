##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Intraxxion-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "Intraxxion - CMS"
website "http://intraxxion.com/"



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Intraxxion CMS ([\d\.]{1,5})" \/>/ },

# HTML Comment
{ :text=>'<!-- site built by Intraxxion, www.intraxxion.com, info@intraxxion.com, tel: +31 45 5650207, fax: +31 45 5650123' },
{ :text=>'<!-- site built by Intraxxion, www.intraxxion.com, more_info@intraxxion.com, tel: +31 45 5650207, fax: +31 45 5650123' },

]

end


