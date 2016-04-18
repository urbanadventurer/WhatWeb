##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-18 # Andrew Horton
# Added website parameter
#  
##
Plugin.define "Barracuda-Load-Balancer" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.2"
description "Barracuda Load Balancer"
website "http://www.barracudanetworks.com/ns/products/balancer_overview.php"

matches [
    {:name=>"BNI__BARRACUDA_LB_COOKIE cookie", :text => "BNI__BARRACUDA_LB_COOKIE", :search => "headers[set-cookie]" },
    {:name=>"BNI_BARRACUDA_LB_COOKIE cookie", :text => "BNI_BARRACUDA_LB_COOKIE", :search => "headers[set-cookie]" },
]

def passive
    m = []
    
    if @headers["set-cookie"] =~ /BARRACUDA_LB_COOKIE=(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i
        internal_ip = @headers["set-cookie"].scan(/BARRACUDA_LB_COOKIE=(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i)
        m << {:string=>'Internal IP: ' + internal_ip.to_s}        
    end    
    m

end


end


