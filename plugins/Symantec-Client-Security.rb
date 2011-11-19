##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Symantec-Client-Security" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-19
version "0.1"
description "Symantec Client Security - Homepage: http://www.symantec.com"

# Google results as at 2011-11-19 #
# 46 for intitle:"Web Deployment Tool" "This browser does not support FRAMESET. Please use Internet Explorer"

# Dorks #
dorks [
'intitle:"Web Deployment Tool" "This browser does not support FRAMESET. Please use Internet Explorer"'
]

# Examples #
examples %w|
72.10.115.155
www.kascak.com/AV/default.htm
forms.cas.msu.edu/
www.visioninfosys.net/jamali_backup/Source/SAV_10.0.2/CD1A/Rollout/AVServer/CLIENTS/WEBINST/
|

# Matches #
matches [

# HTML Comment
{ :text=>'<!-- Symantec Client Security Web Based Installation -->' },

# Year Detection # Meta Copyright
{ :certainty=>75, :string=>/<META NAME="Copyright" Content="Copyright (20[\d]{2}) Symantec Corporation">/ },

]

end

