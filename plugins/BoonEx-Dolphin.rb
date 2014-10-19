##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BoonEx-Dolphin" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-20
version "0.1"
description "BoonEx Dolphin - open-source, downloadable, scalable, customizable, full-featured, independent and free software package for building social networks, dating sites and niche communities."
website "http://www.boonex.com/dolphin"

# Google results as at 2011-11-20 #
# 231 for "Powered by Dolphin - Free Community Software"

# Dorks #
dorks [
'"Powered by Dolphin - Free Community Software"'
]



# Matches #
matches [

# JavaScript
{ :regexp=>/<script type="text\/javascript" language="javascript">var aDolLang = \{'_Counter': 'Counter','_PROFILE_ERR': 'Error!\\nYour username or password was incorrect\. Please try again\.'\};<\/script>/ },

# Powered by link
{ :text=>'Powered by                    Dolphin - <a href="http://www.boonex.com/products/dolphin/">Free Community Software</a>' },

# ./administration # Version Detection # Logo HTML
{ :version=>/administration\/templates\/base\/images\/admin_login_admin_logo\.png" alt="Dolphin ([\d]+) Admin" \/>/ },

]

end

