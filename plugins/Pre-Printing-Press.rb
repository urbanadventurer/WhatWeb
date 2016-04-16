##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pre-Printing-Press" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-19
version "0.1"
description "A complete printing press website script contains all features required for online printing business. Developed in PHP, MYSQL and Flash AS3, with all browsers compatibility and easy to navigate."
website "http://www.preprojects.com/printing.asp"

# Google results as at 2012-03-19 #
# 2 for "Copyright PreProjects.com All Rights Reserved" inurl:"product_desc.php?pid"

# Dorks #
dorks [
'"Copyright PreProjects.com All Rights Reserved" inurl:"product_desc.php?pid"'
]



# Matches #
matches [

# select id="mylist" name="mylist"
{ :text=>'<p align="left"><select id="mylist" name="mylist" onchange = "go()" style="font-family:' },

# input id="ib_attrib_disk_quantity-2"
{ :text=>'<input id="ib_attrib_disk_quantity-2" type="radio" onClick="showsubcat(this.value)" value="olduser" name="allusers" />' },

# Copyright Footer
{ :text=>'<div align="center">&copy; Copyright PreProjects.com All Rights Reserved</div>' },

]

end

