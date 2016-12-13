##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MySQLMan" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-21
version "0.1"
description "MySQLMan is a web based MySQL database manager."
website "http://www.gossamer-threads.com/products/archive.html"

# Google results as at 2011-09-21 #
# 8 for inurl:"mysql.cgi?do="

# Dorks #
dorks [
'inurl:"mysql.cgi?do="'
]



# Matches #
matches [

# Create Link
{ :text=>'| <A href="mysql.cgi?do=top_level_op&data_source=&action=create_db">Create</A>' },

# Version Detection # Powered by link
{ :version=>/<p align="right"><a href="http:\/\/www\.gossamer-threads\.com\/scripts\/"><font face="Verdana, Arial, Helvetica" size="1">MySQLMan[\s]+v\. ([^\s^<]+)<br>/ },

]

end

