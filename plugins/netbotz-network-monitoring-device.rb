##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetBotz-Network-Monitoring-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "NetBotz monitoring and management web front end - homepage: http://www.netbotz.com/products/index.html"

# http://www.hackersforcharity.org/ghdb/?function=detail&id=1774
# 12 Google results for intitle:"Device Status Summary Page" -demo @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1451
# 21 Google results for intitle:"netbotz appliance" -inurl:.php -inurl:.asp -inurl:.pdf -inurl:securitypipeline -announces @ 2010-07-20
examples %w|
155.101.3.213
216.157.144.161
209.234.101.131
aisvc.com/ext/netbotz/
155.101.3.212
granthandy.com
netbot-m1-1.inscc.utah.edu
netbot-m2-1.inscc.utah.edu
netbot-m2-2.inscc.utah.edu
155.101.3.211
129.219.60.184
155.101.3.210
198.182.247.199/pages/index.html
bots1.medhosters.com
nb500.optrics.net
24.24.69.166:8083/pages/index.html
71.168.66.58:5190/pages/index.html
|

matches [

{ :regexp=>/<TITLE>NetBotz[\ Network Monitoring]* Appliance - [a-zA-Z0-9\s\-_\(\)]*<\/TITLE>/ },

{ :text=>'	<TITLE>Device Status Summary Page</TITLE>' },


]

def passive
        m=[]

        if @body =~ /		<title>NetBotz Advanced View [\d\.]+ \(InstallAnywhere Web Installer\)<\/title>/
                version=@body.scan(/		<title>NetBotz Advanced View ([\d\.]+) \(InstallAnywhere Web Installer\)<\/title>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

