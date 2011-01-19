##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "mysql_connect" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-19
version "0.1"
description "This plugin detects instances of the mysql_connect() function in PHP source code and retrieves the mysql server hostname, username and password if it's in plain-text. Alternatively, if the connection details are stored in variables it will return the variable names with possible values for those variables returned in :string=>"

# 338 results for mysql_connect ext:inc  @ 2011-01-19
# 172 results for mysql_connect ext:bak  @ 2011-01-19
# 129 results for mysql_connect ext:php~ @ 2011-01-19
#  28 results for mysql_connect ext:php1 @ 2011-01-19
#  13 results for mysql_connect ext:php2 @ 2011-01-19
# 499 results for mysql_connect ext:php3 @ 2011-01-19

# Examples #
examples %w|
http://www.majoss.com/shop2/marketing/realistic.php~
http://www.freak.fr/includes/connection.php~
http://www.nascarracingexperience.com/scheduleforthefirst/NRETEST.bak
http://www.cacvs.org/registration/old/paiement_registration.php~
http://conference.merlot.org/include/mysql/mysql_functions.inc
http://www.coolminiornot.com/shop/js/ajax/getFindItFast.php.bak
http://www.uspulpandpaper.com/cgi-local/dataconn.bak
http://www.emporistechnologies.com/includes/dbconn.bak
http://mypalletmanager.com/lib/class_sql.BAK
http://www.science.uwaterloo.ca/~phys111/step2_sql.bak
http://www.newinti.edu.my/mid-year-scholarship/scholarship.bak
|

# Passive #
# Detect instances of the mysql_connect function and extract details
# The code is pretty ugly but it gets the job done. Improvements welcomed.
def passive
	m=[]

	# Detect mysql_connect() function
	if @body =~ /mysql_connect\([^\r^\n^\)]*,[\s]*[^\r^\n^\)]*,[\s]*[^\r^\n^\)]*\)[^\r^\n^;]*;/

		# Extract host(s)
		hosts=@body.scan(/mysql_connect\([\s]*([^\r^\n^\)]*),[\s]*[^\r^\n^\)]*,[\s]*[^\r^\n^\)]*\)[^\r^\n^;]*;/)
		hosts.each do |line|
			m << { :model=>line }
			if line.to_s =~ /^[\s]*\$[\w_]+/
				r=Regexp.new("[\s]*"+Regexp.escape(line.to_s)+"[\s]*=[\s]*([^\r^\n]*);")
				m << { :string=>@body.scan(r) } if @body =~ r
			end
		end

		# Extract username(s)
		usernames=@body.scan(/mysql_connect\([\s]*[^\r^\n^\)]*,[\s]*([^\r^\n^\)]*),[\s]*[^\r^\n^\)]*\)[^\r^\n^;]*;/)
		usernames.each do |line|
			m << { :firmware=>line }
			if line.to_s =~ /^[\s]*\$[\w_]+/
				r=Regexp.new("[\s]*"+Regexp.escape(line.to_s)+"[\s]*=[\s]*([^\r^\n]*);")
				m << { :string=>@body.scan(r) } if @body =~ r
			end
		end

		# Extract password(s)
		passwords=@body.scan(/mysql_connect\([\s]*[^\r^\n^\)]*,[\s]*[^\r^\n^\)]*,[\s]*([^\r^\n^\)]*)\)[^\r^\n^;]*;/)
		passwords.each do |line|
			m << { :filepath=>line }
			if line.to_s =~ /^[\s]*\$[\w_]+/
				r=Regexp.new("[\s]*"+Regexp.escape(line.to_s)+"[\s]*=[\s]*([^\r^\n]*);")
				m << { :string=>@body.scan(r) } if @body =~ r
			end
		end

	end

	m
end

end

