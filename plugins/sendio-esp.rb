##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sendio-ESP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-20
version "0.1"
description "Sendio's E-mail Security Platform, (formerly known as I.C.E. Box) is an appliance solution which eliminates spam and viruses."
website "http://sendio.com/"

# ShodanHQ results as at 2011-09-20 #
# 247 for sendio/ice/ui/

# Google results as at 2011-09-20 #
# 6 for inurl:"sendio/ice/ui/"



# Matches #
matches [

# frameset id="icetopframeset"
{ :text=>'<frameset id="icetopframeset" name="icetopframeset" rows="28,*,20,0,0,0"' },

# StyleSheet
{ :text=>'<link rel="stylesheet" type="text/css" href="/sendio/ice/css/nice.css" />' },

# Favicon
{ :url=>"/favicon.ico", :md5=>"0d8eda4e968077705982915e3d874e17" },

# Year Detection # /sendio/ice/ui/foot
{ :url=>"/sendio/ice/ui/foot", :string=>/<td width="50%" align="left" valign="middle"><div id="footleft">&nbsp;&copy; (20[\d]{2}) Sendio, Inc\.<\/div><\/td>/ },

# Version Detection # /sendio/ice/ui/foot
{ :url=>"/sendio/ice/ui/foot", :version=>/<td width="50%" align="right" valign="middle"><div id="footright">Sendio ([\d\.]+ \([^\s^\)]+\)) &mdash/ },

]

end

