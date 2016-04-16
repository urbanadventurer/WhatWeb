##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Advantech-WebAccess" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-01-09
version "0.1"
description "Advantech WebAccess HMI/SCADA software"
website "http://webaccess.advantech.com/"

# ShodanHQ results as at 2013-01-09 #
# 220 for broadWeb/bwRoot.asp
#  12 for broadWeb/bwviewpg.asp

# Google results as at 2013-01-09 #
# 16 for inurl:"broadWeb/bwconfig.asp"

# Dorks #
dorks [
'inurl:"broadWeb/bwconfig.asp"'
]



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

