##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebIssues" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-29
version "0.1"
description "WebIssues is an open source, multi-platform system for issue tracking and team collaboration."
website "http://webissues.mimec.org/"

# Google results as at 2012-03-29 #
# 18 for intitle:"Log in to WebIssues" "Log in to WebIssues" "Manual"

# Dorks #
dorks [
'intitle:"Log in to WebIssues" "Log in to WebIssues" "Manual"'
]



# Matches #
matches [

# Login Page # Version Detection
{ :version=>/<div id="header-right">[\s]+WebIssues ([^\s]+) \| <a href=/ },

# field-login-__formId
{ :text=>'<div><input type="hidden" name="__formId" id="field-login-__formId" value="login" />' },

]

end

