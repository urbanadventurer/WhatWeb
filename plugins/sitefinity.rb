##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2012-03-09 #
# Added match. Added google dork. Updated version detection.
##
Plugin.define "Sitefinity" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-04
version "0.2"
description "sitefinity ASP.NET CMS"
website "http://www.sitefinity.com/"

# Google results as at 2012-03-09 #
# 30 for inurl:"/Sitefinity/WebsiteTemplates/"
# 20 for "Powered by Sitefinity ASP.NET CMS"

# Dorks #
dorks [
'inurl:"/Sitefinity/WebsiteTemplates/"'
]



# Matches #
matches [

# Powered by text
{ :text=>'href="http://www.sitefinity.com" class="poweredBySitefinity" title="Sitefinity ASP.NET CMS">Powered by Sitefinity ASP.NET CMS</a></p>' },
{ :text=>'title="Sitefinity ASP.NET CMS" class="poweredBySitefinity" href="http://www.sitefinity.com">Powered by Sitefinity ASP.NET CMS</a></p>' },

# Version Detection # Meta Generator
{ :version=>/<meta name="Generator" content="Sitefinity ([\d\.:]{1,20}( [A-Z]+)?)" \/>/ },

# Link # /SiteFinity
{ :certainty=>75, :regexp=>/<link href="\/[Ss]ite[Ff]inity\/WebsiteTemplates\// },

]

end


