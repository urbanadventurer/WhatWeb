##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dr-Web-Anti-Virus" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-31
version "0.1"
description "Dr.Web anti-virus"
website "http://www.drweb.com/"

# ShodanHQ results as at 2012-07-31 #
# 39 for DRWEB_PERSONAL_OFFICE

# Google results as at 2012-07-31 #
# 44 for "Doctor Web" intitle:"Authorization" "Russian anti-virus vendor"

# Dorks #
dorks [
'"Doctor Web" intitle:"Authorization" "Russian anti-virus vendor"'
]



# Matches #
matches [

# Set-Cookie # DRWEB_PERSONAL_OFFICE
{ :search=>"headers[set-cookie]", :regexp=>/DRWEB_PERSONAL_OFFICE=[^;]*;/ },

# /avdesk/includes/system/templates/images/logo_[xx].png
{ :md5=>"b3465a1bb7fa5ca9e63d2924f4f7a865", :url=>"/avdesk/includes/system/templates/images/logo_en.png" },
{ :md5=>"2ef77c5015f2a5aee1633d58a32037ef", :url=>"/avdesk/includes/system/templates/images/logo_ru.png" },

# Filepath Detection # JavaScript
{ :filepath=>/var _globalVars = \{\s+'mailSystem': '\d*',\s+'sessionTmout': '\d*',\s+'rootDir': '[^']+',\s+'https': '\d',\s+'currentPage': '([^']+)',/ },

# Logo HTML
{ :text=>'<div id="logo" class="logo"><img src="/avdesk/includes/system/templates/images/logo_en.png" alt="" /></div>' },

]

end

