##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "BinarySec-Firewall" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.1"
description "BinarySec Web Application Firewall - http://www.binarysec.com"

examples %w|
www.binarysec.com
195.98.231.142
91.121.97.83
87.98.160.245
213.223.138.13
87.98.130.144
87.98.221.237
91.121.62.246
hug.re
www.hoteldugolfetizzano.com
antennereunion.fr
vity.fr
www.rer.re
www.occasions-guadeloupe.com
|


def passive
    m = []

    m << {:name=>"X-BinarySEC-Via header "} if @meta.keys.include?("X-BinarySEC-Via".downcase())
    m << {:name=>"X-BinarySEC-NoCache header "} if @meta.keys.include?("X-BinarySEC-NoCache".downcase())
        
    m << {:name=>"server header "} if @meta['server'] =~ /BinarySec/i
    
    if @meta['server'] =~ /BinarySEC\/(\d{1,3}\.\d{1,4}\.\d{1,4})/i
        version=@meta['server'].scan(/BinarySEC\/(\d{1,3}\.\d{1,4}\.\d{1,4})/i)
        m << {:version=>version.to_s}
    end
    m

end


end


