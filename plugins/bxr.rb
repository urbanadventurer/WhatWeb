##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BXR" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.1"
description "BXR is an interface to manage a Blosxom-Based blog through the web or XML-RPC. Current it supports blogger, and metaWeblog APIs. - homepage: http://sourceforge.net/projects/bxr/"

# 1 result for "BXR Web Login" intitle:"Please Enter Password" @ 2010-08-06
examples %w|
r.ookee.com/cgi-bin/rookee-xmlrpc.cgi
|

matches [

{ :text=>'<meta name="generator" content="BXR::Web" />' },

]

def passive
        m=[]

        if @body =~ /<div class="bxrlogo">Powered by <a href="http:\/\/sourceforge.net\/projects\/bxr\/">BXR<\/a> [\d\.]+<\/div>/
                version=@body.scan(/<div class="bxrlogo">Powered by <a href="http:\/\/sourceforge.net\/projects\/bxr\/">BXR<\/a> ([\d\.]+)<\/div>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

