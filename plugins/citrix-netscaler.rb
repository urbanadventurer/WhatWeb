##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Citrix-NetScaler" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.1"
description "Citrix NetScaler  - http://www.citrix.com/netscaler"

examples %w|
http://147.1.245.144/
http://169.204.191.193/
http://169.204.191.210/
http://192.8.30.16/
http://193.27.194.212/
http://198.238.212.10/
http://200.186.47.207/
http://203.25.1.143/
http://216.248.195.194/
http://216.99.133.22/
http://62.122.9.84/
http://62.237.243.27/
http://62.237.243.29/
http://62.237.243.7/
http://62.69.179.83/
http://62.69.179.91/
http://63.172.231.32/
http://65.192.185.146/
http://74.123.7.30/
http://74.217.169.24/
http://84.16.167.16/
http://94.126.240.118/
|

def passive
    m = []

    m << {:name=>"http via" } if @meta["via"] =~ /NS\-CACHE/i

    if @meta["via"] =~ /NS\-CACHE\-(\d{1,4}\.\d{1,4}):/i
        version = @meta["via"].scan(/NS\-CACHE\-(\d{1,4}\.\d{1,4})/i)
        m << {:version=>version.to_s}        
    end

    m

end


end


