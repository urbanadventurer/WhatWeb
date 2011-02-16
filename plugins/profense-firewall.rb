##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Profense-Firewall" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.1"
description "Profense Web Application Firewall -  http://www.armorlogic.com/profense_overview.html"

# 394 ShodanHQ results for Profense
examples %w|
www.axcess-financial.com
68.62.48.54
74.115.186.105
74.115.186.126
64.197.73.28
159.87.126.87
74.115.186.125
66.17.86.223
159.87.126.35
134.250.14.200
74.115.186.83
|


def passive
    m = []   
      
    m << {:name=>"PLBSID cookie" } if @meta["set-cookie"] =~ /PLBSID=/i  
    m << {:name=>"server header" } if @meta["server"] =~ /Profense/i  
    
    m

end


end


