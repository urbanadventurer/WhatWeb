##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Barracuda-Load-Balancer" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.1"
description "Barracuda Load Balancer  - http://www.barracudanetworks.com/ns/products/balancer_overview.php"




def passive
    m = []

    
    if @headers["set-cookie"] =~ /BNI__BARRACUDA_LB_COOKIE/i    
        m << {:name=>"BNI__BARRACUDA_LB_COOKIE cookie" } 
    elsif @headers["set-cookie"] =~ /BARRACUDA_LB_COOKIE/i
        m << {:name=>"BARRACUDA_LB_COOKIE cookie" }
    end
    
    
    
    if @headers["set-cookie"] =~ /BARRACUDA_LB_COOKIE=(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i
        internal_ip = @headers["set-cookie"].scan(/BARRACUDA_LB_COOKIE=(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i)
        m << {:string=>'Internal IP: ' + internal_ip.to_s}        
    end
    
    m

end


end


