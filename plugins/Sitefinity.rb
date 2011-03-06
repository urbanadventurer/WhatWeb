##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sitefinity" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-04
version "0.1"
description "sitefinity ASP.NET CMS - Homepage: http://www.sitefinity.com/"

# Google results as at 2011-03-04 #
# 20 for "Powered by Sitefinity ASP.NET CMS"

# Examples #
examples %w|
www.sitefinity.com
www.telerik.com
website2pdf.com
|

# Matches #
matches [

# Powered by text
{ :text=>'href="http://www.sitefinity.com" class="poweredBySitefinity" title="Sitefinity ASP.NET CMS">Powered by Sitefinity ASP.NET CMS</a></p>' },
{ :text=>'title="Sitefinity ASP.NET CMS" class="poweredBySitefinity" href="http://www.sitefinity.com">Powered by Sitefinity ASP.NET CMS</a></p>' },

# Version Detection # Meta Generator
{ :version=>/<meta name="Generator" content="Sitefinity ([\d\.:]{1,20})" \/>/ },

]

end


