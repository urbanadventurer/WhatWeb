##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-08-27 #
# Added cookie matches
##
Plugin.define "DataLife-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.2"
description "DataLife Engine CMS"
website "http://dle-news.ru"

# ShodanHQ results as at 2011-08-27 #
# 3,348 for dle_hash dle_password dle_user_id

# Google results at 2011-03-18 #
# 374 for "powered by DataLife Engine"

# Dorks #
dorks [
'"powered by DataLife Engine"'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="DataLife Engine (http://dle-news.ru)" />' },
{ :text=>'<meta name="generator" content="DataLife Engine" />' },

# Meta Generator # Nulled
{ :text=>'<meta name="generator" content="DataLife Engine Nulled by M.I.D-Team (http://www.mid-team.ws)" />', :string=>"Nulled by M.I.D-Team" },

# JavaScript
{ :regexp=>/<script language="javascript" type="text\/javascript">[\s]+<!--[\s]+var dle_root       = '[^']+';[\s]+var dle_admin      = '[^']*';[\s]+var dle_login_hash = '[^']*';[\s]+(var dle_group      = [\d]+;[\s]+)?var dle_skin       = '[^']*';[\s]+var dle_wysiwyg    = '[^']*';[\s]+var quick_wysiwyg  = '[^']*';[\s]+/ },

# Cookies
{ :search=>"headers[set-cookie]", :regexp=>/dle_hash=[^;]+;/ },
{ :search=>"headers[set-cookie]", :regexp=>/dle_password=[^;]+;/ },
{ :search=>"headers[set-cookie]", :regexp=>/dle_user_id=[^;]+;/ },

]

end

