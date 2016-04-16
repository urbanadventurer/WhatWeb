##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BugFree" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-22
version "0.1"
description "BugFree [Chinese]"
website "http://www.bugfree.org.cn/"

# Google results as at 2011-10-22 #
# 12 for inurl:"Login.php" intitle:"BugFree"

# Dorks #
dorks [
'inurl:"Login.php" intitle:"BugFree"'
]



# Matches #
matches [

# Login Page # Version Detection # div id="LoginMain"
{ :version=>/<div id="loginLogo">[\s]+<img src="Image\/login_logo\.png" id="logo" alt=BugFree \/><br \/>[\s]+<center style="color:#666666;font-size:10px;padding-left:4px;">([^\s^<]+)<\/center>[\s]+<\/div>/ },

# Login Page # Version Detection # div id="LoginMain"
{ :version=>/<div id="LoginMain">[\s]+<div id="LoginLogo">[\s]+<span id="Version">([^\s^<]+)<\/span>[\s]+<\/div>[\s]+<div id="LoginFormContainer">/ },

# Login Page # Version Detection # span id="Version"
{ :version=>/<span id="Version"><img src="Image\/logo\.png" height=40 title=BugFree \/>([^\s^<]+)<\/span>/ },

# Login Page # xajax_xSelectLanguage
{ :text=>'<select name=\'Language\' id=\'Language\' class="NormalSelect MyInput select" onchange="xajax_xSelectLanguage(this.value);return false;" >' },

# Login Page # Logo HTML
{ :text=>'<img src="Image/login_bg_left.gif" class="loginBgImage"/>' },

# Login Page # Older Versions ~1.0 # BugUserPWD
{ :text=>'<td><input type="password" name="BugUserPWD" class="MyInput"></td>' },

]

end

