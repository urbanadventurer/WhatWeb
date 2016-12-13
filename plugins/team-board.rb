##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "Team-Board" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.2"
description "Team Board forum [Chinese]"
website "http://www.team5.cn/"
# Default Login: admin/123

# Google results as at 2010-07-25 #
# 215 for "team5 studio all rights reserved" site:cn

# Dorks #
dorks [
'"team5 studio all rights reserved" site:cn'
]



# Matches #
matches [

# Meta Copyright
{ :regexp=>/<meta name="copyright" content="Copyright [0-9]{4}-[0-9]{4} - TEAM5.cn By DayMoon" \/>/ },

# Version Detection # Powered By HTML

{ :version=>/[\s]+Powered by <a target=_blank 	href=http:\/\/www.team5.cn><b>TEAM ([\d\.]+) Release<\/b><\/a> - <a href=Licence.asp><b style='color:#FF9900'>ACC<\/b><\/a> &copy; [0-9]{4} Team5 Studio All rights reserved/ },

{ :version=>/Powered by <a target=_blank[\s]+href=http:\/\/www.team5.cn><b>TEAM ([\d\.]+)<\/b><\/a>/ },

{ :version=>/[\s]+Powered by <a target="_blank" href="http:\/\/www.team5.cn"><b>TEAM ([\d\.]+) Release<\/b><\/a> - <a href="Licence.asp"><b style='color:#FF9900'>SQL<\/b><\/a> &copy; [0-9]{4} Team5 Studio All rights reserved/ },

]

end

