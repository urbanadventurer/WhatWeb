##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Gallarific" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "Gallarific is a fully customizable PHP photo gallery script that lets you collect, organize and share your images, photos and multimedia files with visitors directly from your Web site. It's compatible with 97% of Web site hosts."
website "http://www.gallarific.com/"

# Google results as at 2011-03-14 #
# 5 for intitle:Gallarific "Sign in to Gallarific"

# Dorks #
dorks [
'intitle:Gallarific "Sign in to Gallarific"'
]



# Matches #
matches [

# http-equiv Generator
{ :text=>'<meta http-equiv="Generator" content="Gallarific" />' },

# HTML Comment # Most Viewed
{ :text=>'<!-- popular_grid: output a 4x1 row containing the most viewed photos --><tr> <td colspan="2" class="heading">Most Viewed Photos</td>' },

# HTML Comment # Recently Uploaded
{ :text=>'<!-- recent_grid: output a 4x1 row containing recently uploaded photos --><tr> <td colspan="2" class="heading">Recently Uploaded Photos</td>' },

# Logo HTML
{ :text=>'<a href="http://www.gallarific.com/"><img src="http://www.gallarific.com/images/gallarific_white.gif" width="215" height="61" border="0" /></a>' },

# Login Title
{ :text=>'<title>Gallarific > Sign in</title>' },

]

end


