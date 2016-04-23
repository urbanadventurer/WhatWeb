##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MySqlDumper" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.1"
description "MySQLDumper is a free PHP/Perl script to backup your important MySQL-Data safe and secure and restore them in the case of an emergency."
website "http://www.mysqldumper.net/"

# Google results as at 2011-05-12 #
# 102 for inurl:sql_statement inurl:sql.php intitle:MySqlDumper
# 25 for inurl:mysqldumper/sql.php

# ShodanHQ results as at 2011-05-12 #
# 5 for MySQLDumper

# Dorks #
dorks [
'inurl:sql_statement inurl:sql.php intitle:MySqlDumper'
]



# Matches #
matches [

# Select HTML
{ :text=>'<select class="SQLCombo" name="tablecombo" onchange="this.form.sqltextarea.value=this.options[this.selectedIndex].value;this.form.execsql.click();">' },

# Warning HTML
{ :text=>'align="center">The execution of SQL Statements can manipulate data. TAKE CARE! The Authors don\'t accept any liability for damaged or lost data.</div>' },

# Select Database link
{ :text=>'<a title="Select Database / Datebase functions / Import - Export " href="sql.php?db=&amp;dbid=0&amp;context=3' },

]

# Passive #
def passive
	m=[]

	# MySQLDumper Cookie
	m << { :name=>"MySQLDumper Cookie" } if @headers["set-cookie"] =~ /MySQLDumper=[a-z\d]{16,32}/

	# WWW-Authenticate realm
	m << { :name=>"WWW-Authenticate realm" } if @headers["www-authenticate"] =~ /^Basic realm="MySQLDumper"$/

	# Return passive matches
	m
end

end


