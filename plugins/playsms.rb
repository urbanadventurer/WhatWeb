##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "playSMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-10
version "0.1"
description "Free and Open Source SMS Gateway"
website "http://playsms.org/"

# Dorks #
dorks [
'intitle:"SMS" "Username" "Password" "Register an account" "Forgot password"'
]



# Matches #
matches [

# Login page # div id="wraplogin" + table
{ :certainty=>25, :regexp=>/<div id="wraplogin">[\s]+<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">/ },

# Login page # HTML Comment
{ :regexp=>/<!--td background="https?:\/\/[^>^"]+\/plugin\/themes\/km2\/images\/header-4\.png"-->/ },

# Login page # Register link
{ :text=>"<a href='index.php?app=page&inc=register'>Register an account</a>" },

# Login page # Forgot password link
{ :text=>"<a href='index.php?app=page&inc=forgot'>Forgot password</a>" },

# ./plugin/themes/km2/images/header-login.jpg
#{ :url=>"plugin/themes/km2/images/header-login.jpg", :md5=>"23c11687e660e8550505f18ab4f3e4e8" },

]

end

