##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CMS-WebManager-Pro" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "CMS WebManager-Pro - is a software product for creating and maintaining websites of any complexity. - homepage: http://webmanager-pro.com/"

# 2 results for "powered by CMS WebManager-Pro" @ 2010-09-04
examples %w|
www.21.com.ua
test21vek.solnce.com.ua
|

matches [

# Powered by text
{ :text=>'Powered by <a style="color:#555555;" href="http://webmanager-pro.com/">CMS Webmanager-pro</a></li>' },

]

# Version detection using meta generator
def passive
        m=[]

        if @body =~ /<meta name="generator" content="Webmanager-pro v([\d\.]+)" \/>/
                version=@body.scan(/<meta name="generator" content="Webmanager-pro v([\d\.]+)" \/>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

