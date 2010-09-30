##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "OpenSearch" do
author "Caleb Anderson"
version "0.1"
description "open search"

examples %w| www.facebook.com www.amazon.com|

matches [
{:name=>"open search",
:regexp=>/<link .*?type=["']application\/opensearchdescription\+xml['"].*?>/im},

]


def passive
    m=[]
    @body.scan(/<link [^>]*?type=["']application\/opensearchdescription\+xml['"].*?>/im).each do |link|
        url=link.scan(/href=["'](.*?)["']/i).first.first rescue nil
        m << {:name=>"search link",:string=>url} unless url.nil?
    end
    return m
end

end


