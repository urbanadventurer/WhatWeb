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



def passive
    m = []   
      
    m << {:name=>"PLBSID cookie" } if @headers["set-cookie"] =~ /PLBSID=/i  
    m << {:name=>"server header" } if @headers["server"] =~ /Profense/i  
    
    m

end


end


