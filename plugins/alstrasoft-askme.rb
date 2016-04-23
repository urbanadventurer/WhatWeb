##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AlstraSoft-AskMe" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "AskMe Pro is an expert knowledge management system that allows site owners to setup an expert advice service similar to highly popular sites like   Google Answers, Yahoo Answers and Kasamba.com."
website "http://www.alstrasoft.com/askme.htm"

# Google results as at 2010-10-12 #
# 21 for "powered by AlstraSoft AskMe Pro" -vulnerability

# Dorks #
dorks [
'"powered by AlstraSoft AskMe Pro" -vulnerability'
]



matches [

# Main page # Default text
{ :text=>'Enter details about your question and press the button bellow. All fields are required.' },


# Admin login page
{ :text=>'<font size="+2">AskMe Pro Admin</font></b>' },
{ :text=>"<br> Powered by <a href='http://www.alstrasoft.com' targe='_blank'><font color=blue>AlstraSoft AskMe Pro</font></a><br><br>" },

# Login page
{ :text=>'<td colspan=2 align="center"><a href="pass_recover.php">Forgotten Password?</a></td>' },
{ :text=>'Powered By <a href="http://www.alstrasoft.com">AlstraSoft AskMe Pro</td></tr></table></body></a></html>' }

]

end

