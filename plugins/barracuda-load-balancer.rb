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

examples %w|
http://109.232.67.68/
http://12.4.189.29/
http://122.1.75.132/
http://122.220.200.187/
http://157.238.223.214/
http://158.217.205.24/
http://163.150.129.104/
http://168.143.96.143/
http://180.149.11.28/
http://184.2.45.17/
http://184.2.45.4/
http://184.2.45.5/
http://184.2.45.8/
http://193.1.214.21/
http://194.228.3.162
http://195.35.81.215/
http://200.14.64.8/
http://208.252.18.162/
http://208.252.18.199/
http://208.99.198.73/
http://216.125.140.65/
http://216.144.187.12/
http://217.13.207.152/
http://62.82.110.13/
http://62.82.110.18/
http://64.142.111.225/
http://64.142.111.244/
http://64.142.111.245/
http://66.23.243.108/
http://66.77.147.233/
http://66.77.49.205/
http://66.77.49.207/
http://66.77.49.214/
http://68.111.3.121/
http://69.10.231.91/
http://76.75.201.54/
http://79.123.57.18/
http://81.246.17.182/
http://84.246.228.135/
http://ebiznet.nimc.co.in/
http://moodle.learnnc.org/
http://www.mediadirect.ro/
http://www.nycgo.com/
http://www1.siliconexpert.com/
https://www.eonweb.org/
|


def passive
    m = []

    
    if @meta["set-cookie"] =~ /BNI__BARRACUDA_LB_COOKIE/i    
        m << {:name=>"BNI__BARRACUDA_LB_COOKIE cookie" } 
    elsif @meta["set-cookie"] =~ /BARRACUDA_LB_COOKIE/i
        m << {:name=>"BARRACUDA_LB_COOKIE cookie" }
    end
    
    
    
    if @meta["set-cookie"] =~ /BARRACUDA_LB_COOKIE=(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i
        internal_ip = @meta["set-cookie"].scan(/BARRACUDA_LB_COOKIE=(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i)
        m << {:string=>'Internal IP: ' + internal_ip.to_s}        
    end
    
    m

end


end


