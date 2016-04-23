##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BestShopPro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-02
version "0.1"
description "BestShopPro"
website "http://www.bst.pl/"

# Google results as at 2011-11-02 #
# 157 for inurl:"pokaz_podkat.php?idkat="
# 107 for intitle:"Powered By BST"

# Dorks #
dorks [
'inurl:"pokaz_podkat.php?idkat="'
]



# Matches #
matches [

# Login Page
{ :text=>'<td width=300 height=18 colspan=2 align=center class=tdn><b>Logowanie</b></td></tr>' },

# Meta Author
{ :text=>'<meta content="www.bst.pl" name="author"/>' },
{ :text=>'<META CONTENT="www.bst.pl" NAME=AUTHOR>' },

]

end

# This plugin requires more matches

