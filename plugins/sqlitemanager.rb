##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SQLiteManager" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-14
version "0.1"
description "SQLiteManager - Web-based SQLite administration"
website "http://www.sqlitemanager.org"

# Google results as at 2012-01-14 #
# 33 for intitle:"SQLite version" "Welcome to SQLiteManager version"
# 26 for inurl:"main.php?dbsel="

# Dorks #
dorks [
'intitle:"SQLite version" "Welcome to SQLiteManager version"'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- SQLiteFunctionProperties.class.php : propView() -->' },
{ :text=>'<!-- common.lib.php : displayMenuTitle() -->' },

# Form
{ :text=>'<td style="white-space: nowrap">	<form name="database" action="main.php" enctype="multipart/form-data" method="POST" onSubmit="checkPath();" target="main">' },

# h2 class="sqlmVersion"
{ :text=>'<h2 class="sqlmVersion">Database : <a href="main.php?dbsel=' },

# Title # SQLite Version Detection
{ :string=>/<title>(SQLite version [\d\.\s-]+)(undefined)?<\/title>/ },

# h2 class="sqlmVersion" # Version Detection
{ :version=>/<h2 class="sqlmVersion">Welcome to <a href="http:\/\/www\.sqlitemanager\.org" target="_blank">SQLiteManager<\/a> version ([^\s^>]+)<\/h2>/ },

# h4 class="serverInfo" # SQLite Version Detection
{ :string=>/<h4 class="serverInfo">(SQLite version [\d\.\s-]+)(undefined)? \/ PHP version 5.2.17<\/h4>/ },

# h4 class="serverInfo" # SQLite Version Detection
{ :string=>/<h4 class="serverInfo">SQLite version [\d\.\s-]+(undefined)? \/ (PHP version [^\s^<]+)<\/h4>/, :offset=>1 },

]

end

