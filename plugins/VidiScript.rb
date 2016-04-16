##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VidiScript" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "VidiScript - video sharing script"
website "http://www.VidiScript.com"

# Google results as at 2011-02-24 #
# 286 for "powered by VidiScript"

# Dorks #
dorks [
'"powered by VidiScript"'
]



# Matches #
matches [

# Powered by text
{ :text=>'<span  style="font-size:12px"><a href="http://www.VidiScript.com"><b>Free Open Source Video Script</b></a>&nbsp;Powered By&nbsp;<a href="http://www.VidiScript.com"><b>VidiScript.com</b></a> |    <b>' },

# Powered by text
{ :text=>"<a href='http://www.VidiScript.com'><b>Free Video Script</b></a>&nbsp;Powered By&nbsp;<a href='http://www.VidiScript.com'><b>VidiScript.com</b></a>" },

]

end


