##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPGradeBook" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-23
version "0.1"
description "PHP_GradeBook is a program for teachers to input students points for assignments and keep a running online tally for the students to view online."
website "http://sourceforge.net/projects/php-gradebook/"

# Google results as at 2012-03-23 @
# 3 for inurl:"admin" intitle:"phpGradeBook"

# Dorks #
dorks [
'inurl:"admin" intitle:"phpGradeBook"'
]



# Matches #
matches [

# Title
{ :certainty=>75, :text=>'<title>phpGradeBook</title> ' },

# Homepage Link # Version Detection
{ :version=>/<a href='http:\/\/phpGradeBook\.com'>PHP_GradeBook<\/a> ([^C^\n]+) Created by Robert/ },

# Footer # Version Detection
{ :version=>/<small>PHP_GradeBook ([^C^\n]+) Created by Robert/ },

# It appears that phpGradeBook's Database has not been installed yet.
{ :md5=>"9761e989848ed31a7d7a5a5411197281" },

]

end

