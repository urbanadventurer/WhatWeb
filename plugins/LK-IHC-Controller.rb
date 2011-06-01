##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LK-IHC-Controller" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.1"
description "Visualization of an IHC Control electrical installation. - Homepage: http://www.prolor.dk/ihc.php"

# Google results as at 2011-06-01 #
# 5 for intitle:"LK IHC controller forside" +SceneView

# Dorks #
dorks [
'intitle:"LK IHC controller forside" +SceneView'
]

# Examples #
examples %w|
93.163.37.34
90.225.121.2:6080
tostarp.dlinkddns.com:60002
77.213.218.175
78.156.127.211
2.108.35.138
83.92.159.41
81.235.253.55
83.92.148.228
87.59.233.195
|

# Matches #
matches [

# Title
{ :text=>'<title>LK IHC controller forside</title>' },

# images/bg_image_LK.jpg HTML
{ :text=>'<table width="640" height="480" border="0" cellspacing="0" cellpadding="0"  background="images/bg_image_LK.jpg">' },

# /images/bg_image_LK.jpg
{ :url=>"/images/bg_image_LK.jpg", :md5=>"c23378580cb58ee4c404106dda5757b3" },

]

end

