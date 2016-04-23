##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AiCart" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-19
version "0.1"
description "AiCart shopping cart software is created in PHP and uses a simple template structure, makes it very flexible and easy to modify. The data in AiCart is stored in a MySQL database."
website "http://www.aicart.ca/"

# 17 for inurl:"/store.php?action=view_product pid="

# Dorks #
dorks [
'inurl:"/store.php?action=view_product pid="'
]



# Matches #
matches [

# login.php
{ :text=>'" for = "l_password">Password <span class="req">*</span></label>' },
{ :text=>'<input id = "l_password" name = "l_password" class = "field text medium" type = "password" maxlength = "255" value = "" />' },
{ :text=>'<input id="l_remember_me" name="l_remember_me" class = "field checkbox" type = "checkbox" value = "1" />' },
{ :text=>'<input name="APP_authenticate" type="hidden" id="APP_authenticate" value="frmLogin" />' },

]

end

