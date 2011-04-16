##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SiteCatalyst" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.1"
description "Web Analytics and Online Business Optimization Platform. Adobe SiteCatalyst, previously known as Omniture SiteCatalyst, is part of the Adobe Online Marketing Suite of applications for onlinebusiness optimizations. - Homepage: http://www.omniture.com/en/products/online_analytics/sitecatalyst"

# Examples #
examples %w|
http://www.symantec.com/index.jsp
http://www.rent.com/
http://www.adobe.com/
http://tv.adobe.com/
http://www.sitecatalyst.com.au/
http://www.haiensheng.com/
|

# Matches #
matches [

# JavaScript
{ :regexp=>/var s_code=s\.t\(\);if\(s_code\)document\.write\(s_code\)\/\/--><\/script>/ },

# HTML Comments
{ :regexp=>/<!-- SiteCatalyst code\. Copyright 1997-20[\d]{2} Omniture, Inc\. More info available at http:\/\/www\.omniture\.com -->/ },
{ :certainty=>75, :text=>'<!-- End SiteCatalyst -->' },

]

end


