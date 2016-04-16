##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "th-ERP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-22
version "0.1"
description "ERP application, including point-of-sale (POS), stock (inventory/warehouse), purchase, payables, receivables, general ledger (accounting), payroll, human resource (HR), time tracking, project management. th-ERP is written in PHP and using MySQL."
website "http://sourceforge.net/projects/therp/"

# Google results as at 2011-06-22 #
# 7 for intitle:"thERP - Login" Username Password

# Dorks #
dorks [
'intitle:"thERP - Login" Username Password'
]



# Matches #
matches [

# StyleSheet
{ :text=>"<LINK REL=StyleSheet HREF='../include/therp.css' TYPE='text/css'><script>" },

# Title
{ :text=>'<title>thERP - Login</title>' },

]

end

