##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Qcodo-Development-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "The Qcodo Development Framework is an open-source PHP framework that focuses on freeing developers from unnecessary tedious, mundane coding."
website "http://www.qcodo.com/"

# Google results as at 2011-03-14 #
# 11 for "qcodo/_devtools/codegen.php" intitle:"Development Framework - Start Page"

# Dorks #
dorks [
'"qcodo/_devtools/codegen.php" intitle:"Development Framework - Start Page"'
]



# Matches #
matches [

# Error Page
{ :version=>/<b>PHP Version:<\/b> [^;]+;&nbsp;&nbsp;<b>Zend Engine Version:<\/b> [^;]+;&nbsp;&nbsp;<b>Qcodo Version:<\/b> ([^\(]+) \([^\(]+\)<br \/>/, :string=>"Error" },

]

# Passive #
def passive
	m=[]

	# Detect Title
	if @body =~ /<title>Qcodo Development Framework - Start Page<\/title>/

		# Version Detection
		m << { :version=>@body.scan(/<div class="title_action">Qcodo Development Framework ([\d\.]+) \([^\)]+\)<\/div>/) } if @body =~ /<div class="title_action">Qcodo Development Framework ([\d\.]+) \([^\)]+\)<\/div>/

		# Extract DB Credentials
		if @body =~ /<li>QApplication::\$ServerAddress = "([^"]+)"<\/li><li>QApplication::\$Database\[1\] = array \([\r\n]  'adapter' => '([^']+)',[\r\n]  'server' => '([^']+)',[\r\n]  'port' => '?([^'^,]+)'?,[\r\n]  'database' => '([^']+)',[\r\n]  'username' => '([^']+)',[\r\n]  'password' => '([^']+)',[\r\n]  'profiling' => (false|true),/

			db=@body.scan(/<li>QApplication::\$ServerAddress = "([^"]+)"<\/li><li>QApplication::\$Database\[1\] = array \([\r\n]  'adapter' => '([^']+)',[\r\n]  'server' => '([^']+)',[\r\n]  'port' => '?([^'^,]+)'?,[\r\n]  'database' => '([^']+)',[\r\n]  'username' => '([^']+)',[\r\n]  'password' => '([^']+)',[\r\n]  'profiling' => (false|true),/)

			# Database
			m << { :string=>"Database:"+db[0][4] }

			# Account
			m << { :account=>db[0][5]+":"+db[0][6]+"@"+db[0][2]+":"+db[0][3] }

		end

	end

	# Return passive matches
	m

end

end

