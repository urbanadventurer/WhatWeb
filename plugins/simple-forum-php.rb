##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Simple-Forum-PHP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-26
version "0.1"
description "Simple Forum PHP is a script that is very easy to install and administer. Visitors to your website will be able to post new topics or discuss and reply other topics."
website "http://www.simpleforumphp.com/"

# Google results as at 2011-02-26 #
# 4 for intitle:"Simple Forum PHP script - Administration"

# Dorks #
dorks [
'intitle:"Simple Forum PHP script - Administration"'
]



# Matches #
matches [

# Admin Page # Default Title
{ :text=>'<title>Simple Forum PHP script - Administration</title>' },

# Admin Page # Default input tag
{ :text=>'<td class="userpassfield"><input type="submit" name="button" value="Login" class="loginButon" /></td>' },

# Create Topic Link
{ :text=>".php?act=new\" style='font-weight:bold;color:#22229C;font-family:Verdana;font-size:14px;'>Create Topic</a><br /><br />" },

]

end


