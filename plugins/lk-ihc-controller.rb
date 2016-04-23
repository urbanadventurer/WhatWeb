##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LK-IHC-Controller" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.1"
description "Visualization of an IHC Control electrical installation."
website "http://www.prolor.dk/ihc.php"

# Google results as at 2011-06-01 #
# 5 for intitle:"LK IHC controller forside" +SceneView

# Dorks #
dorks [
'intitle:"LK IHC controller forside" "SceneView"'
]



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

