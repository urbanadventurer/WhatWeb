##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MyioSoft-Ajax-Portal" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "AjaxPortal is based on Sajax technology - an open source tool to make programming websites using the Ajax framework known as XMLHTTPRequest or remote scripting as easy as possible. - homepage: http://myiosoft.com/"

# 20 results for "powered by Ajax Portal" @ 2010-08-14
examples %w|
myiosoft.com/products/AjaxPortal/demo/
defog.org
ajaxportal.guidecms.org
www.calmpc.com
ag8.host22.com
start.the-search.info
|

# Version detection using powered by footer text
def passive
        m=[]

	m << { :name=>"ajaxp cookie" } if @meta["set-cookie"] =~ /ajaxp=[0-9a-z]{32}/

	if @body =~ /      <td align="right"  style="padding:5px; background-color: #EDF2FB;" nowrap> Powered by <a href="http:\/\/myiosoft.com\/\?[\d\.]+">Ajax Portal ([\d\.]+)<\/a><\/td>/
                version=@body.scan(/      <td align="right"  style="padding:5px; background-color: #EDF2FB;" nowrap> Powered by <a href="http:\/\/myiosoft.com\/\?[\d\.]+">Ajax Portal ([\d\.]+)<\/a><\/td>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

