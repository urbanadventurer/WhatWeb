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



def passive
    m = []

    m << {:name=>"http via" } if @headers["via"] =~ /NS\-CACHE/i

    if @headers["via"] =~ /NS\-CACHE\-(\d{1,4}\.\d{1,4}):/i
        version = @headers["via"].scan(/NS\-CACHE\-(\d{1,4}\.\d{1,4})/i)
        m << {:version=>version.to_s}        
    end

    m

end


end


