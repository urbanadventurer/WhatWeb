##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Diaspora" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-30
version "0.1"
description "Diaspora - social networking service"
website "https://joindiaspora.com/"

# Source: https://github.com/diaspora/diaspora

# Needs more matches

# ShodanHQ results as at 2011-10-30 #
# 31 for _diaspora_session
#  7 for X-Git-Update

# Google results as at 2011-10-30 #
# 182 for intitle:"Sign In" "Sign up" "Forgot your password?" inurl:"users/sign_in"

# Dorks #
dorks [
'intitle:"Sign In" "Sign up" "Forgot your password?" inurl:"users/sign_in"'
]



# Matches #
matches [

# Set-Cookie: _diaspora_session=
{ :search=>"headers[set-cookie]", :regexp=>/_diaspora_session=/ },

# X-Git-Update
{ :search=>"headers[x-git-update]", :string=>/^([\d]{4}-[\d]{2}-[\d]{2} [\d]{2}:[\d]{2}:[\d]{2} .+)$/ },

# X-Git-Revision
{ :search=>"headers[x-git-revision]", :regexp=>/^[a-f\d]{32}$/ },

# Login Page # Remember Me
{ :text=>'<input name="user[remember_me]" type="hidden" value="0" /><input id="user_remember_me" name="user[remember_me]" type="checkbox" value="1" />' },

]

end

