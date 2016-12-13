##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebspotBlogging" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.1"
description "Old blog"
website "http://www.webspot.co.uk/"

# 13 results for "powered by WebspotBlogging" @ 2010-08-21


def passive
        m=[]

        if @body =~ /Powered By <a href='http:\/\/www.webspot.co.uk\/' target='_blank'>WebspotBlogging<\/a> v[\d\.]+<BR>/
                version=@body.scan(/Powered By <a href='http:\/\/www.webspot.co.uk\/' target='_blank'>WebspotBlogging<\/a> v([\d\.]+)<BR>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

