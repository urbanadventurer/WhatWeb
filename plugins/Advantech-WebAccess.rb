##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Advantech-WebAccess" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-01-09
version "0.1"
description "Advantech WebAccess HMI/SCADA software - Homepage: http://webaccess.advantech.com/"

# ShodanHQ results as at 2013-01-09 #
# 220 for broadWeb/bwRoot.asp
#  12 for broadWeb/bwviewpg.asp

# Google results as at 2013-01-09 #
# 16 for inurl:"broadWeb/bwconfig.asp"

# Dorks #
dorks [
'inurl:"broadWeb/bwconfig.asp"'
]

# Examples #
examples %w|
demo.webaccess.advantech.com.cn
email.coffeygroup.com
adsl-69-238-110-1.dsl.irvnca.pacbell.net
www.asysco.jp
www.ojc.mydns.jp
140.128.47.39
120.126.133.241
60.251.141.84
203.71.9.150
120.124.6.25
118.175.78.88
140.136.247.11
211.75.234.24
140.114.188.57
222.128.125.17
61.222.7.204
69.238.182.193
99.132.160.25
202.121.89.170
140.129.140.112
|

# Matches #
matches [

# HTML Comment
{ :text=>'<html><!-- #BeginTemplate "/Templates/bw_templete1.dwt" -->' },

# Plugin download link
{ :text=>'<a href="/broadweb/WebAccessClientSetup.exe">' },

# / # Location
{ :search=>"headers[location]", :regexp=>/\.\/broadWeb\/bwviewpg\.asp\?proj=/ },

# / # Location # Username Detection
{ :search=>"headers[location]", :account=>/\.\/broadWeb\/bwRoot\.asp\?username=([^\s]+)/ },

# Landing Page # Version Detection
{ :version=>/<div style="position:relative;top:15;width:870px; height:15px">\s+<font class=e5>[^:^<]+ : ([^\s]+)<\/font>/ },

]

end

