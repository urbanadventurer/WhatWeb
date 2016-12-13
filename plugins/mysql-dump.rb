##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated regex
##
Plugin.define "MySQL-dump" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.2"
description "Extracts MySQL host, database and server version from MySQL-dump .sql files."

# Google results as at 2010-10-15 #
# 468 for "MySQL dump" ext:sql +Host +"Table structure for table"

# Dorks #
dorks [
'"MySQL dump" ext:sql "Host" "Table structure for table"'
]



# Matches #
matches [

# Version detection # mySQL dump
{ :version=>/------------------------------------------------------[\r]?\n-- Server version[\s]+([^\r^\n]+)/ },

# Version detection # phpMyAdmin dump
{ :version=>/^# phpMyAdmin MySQL-Dump[\s]+# version [^\s]+[\s]+# http:\/\/www.phpmyadmin.net\/ \(download page\)[\s#]+# Host: [^\s]+[\s]+# Generation Time: [^\n]+[\s]+# Server version: ([\d\.]+)/ },

# mySQL dump # Extract host
{ :string=>/^-- MySQL dump [\d\.]+[\r]?\n--[\r]?\n-- Host: ([^\s]+)[\s]+Database:[\s]+([^\r^\n]+)/ },
# mySQL dump # Extract database
{ :string=>/^-- MySQL dump [\d\.]+[\r]?\n--[\r]?\n-- Host: ([^\s]+)[\s]+Database:[\s]+([^\r^\n]+)/, :offset=>1 },

# phpMyAdmin dump # Extract host
{ :string=>/^# phpMyAdmin MySQL-Dump[\s]+# version [^\s]+[\s]+# http:\/\/www.phpmyadmin.net\/ \(download page\)[\s#]+# Host: ([^\s]+)[\s]+# Generation Time: [^\#]+# Server version:[^\#]+# PHP Version:[^\#]+# Database : `([^\`]+)`/ },
# phpMyAdmin dump # Extract database
{ :string=>/^# phpMyAdmin MySQL-Dump[\s]+# version [^\s]+[\s]+# http:\/\/www.phpmyadmin.net\/ \(download page\)[\s#]+# Host: ([^\s]+)[\s]+# Generation Time: [^\#]+# Server version:[^\#]+# PHP Version:[^\#]+# Database : `([^\`]+)`/, :offset=>1 },

]

end

