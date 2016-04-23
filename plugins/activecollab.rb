##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
## Version 0.2 by Andrew Horton
# Added acpowered.gif logo, and powered by footer 

Plugin.define "activeCollab" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-02
version "0.2"
description "activeCollab - project management & collaboration tool - Requires PHP and MySQL"
website "http://www.activecollab.com/"

# Google results as at 2012-05-02 #
# 569 for "powered by activeCollab" "Forgot password" intitle:"Login"
# 109 for inurl:"index.php?path_info=login" intitle:"Login"

# Dorks #
dorks [
'"powered by activeCollab" "Forgot password" intitle:"Login"'
]



# Matches #
matches [

# Login Page # Form
{ :text=>'<form method="post" id="system_form_2" class="uniForm focusFirstField">' },

# Login Page # JavaScript # Version Detection
{ :version=>/if\(\!App\.data\) \{ App\.data = \{\}; \}\s+App\.data\.quick_search_url = "[^"]+";\s+App\.data\.ac_version = "([^"]+)";/ },

{:name=>"acpowered.gif", :url=>'/public/assets/images/acpowered.gif', :md5=>"ad6152c96454d96f7b8ec78c08bb789b"},
{:name=>"powered by footer", :text=>'<p id="powered_by"><a href="http://www.activecollab.com/"'}
]

end

