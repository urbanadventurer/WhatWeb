##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DV-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "DV Cart - fully featured Shopping Cart software - Requires: PHP and MySQL"
website "http://www.esmistudio.com/"

# This plugin requires additional matches

# Google results as at 2011-11-22 #
# 65 for "You must have the proper credentials to access this page. Please login." inurl:"login.php?info=DENIED"

# Dorks #
dorks [
'"You must have the proper credentials to access this page. Please login." inurl:"login.php?info=DENIED"'
]



# Matches #
matches [

# Login Page # div id="KT_tngdeverror"
{ :text=>'<div id="KT_tngdeverror"><label>Message:</label><div>You must have the proper credentials to access this page. Please login.</div></div>' },

# Login Page # Table class="KT_tngtable"
{ :text=>'<table cellpadding="2" cellspacing="0" class="KT_tngtable">' },

]

end

