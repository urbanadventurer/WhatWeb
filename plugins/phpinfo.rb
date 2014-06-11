##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-03-06 #
# Updated OS detection
##
# Version 0.2 # 2011-01-21 #
# Updated version detection
# Updated examples
# Added OS detection
# Added document root detection
# Added cpanel credentials detection
##
Plugin.define "phpinfo" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-07 
version "0.3"
description "This plugin detects instances of phpinfo() results and extracts the operating system, PHP version, document root and remote cpanel credentials."

# Google Results as at 2011-01-21 #
# 52 for intitle:"phpinfo()" "mysql.default_password" "Zend Scripting Language Engine"
# 33 for inurl:"phpinfo.php" intitle:"phpinfo()" "mysql.default_password"

# Dorks #
dorks [
'intitle:"phpinfo()" "mysql.default_password" "Zend Scripting Language Engine"',
'inurl:"phpinfo.php" intitle:"phpinfo()" "mysql.default_password"'
]



# Passive #
def passive
        m=[]

	# Check if the document is a valid phpinfo() file
        if @body =~ /<title>phpinfo\(\)<\/title>/ and (@body =~ /<h1 class="p">PHP Version [^<]{3,40}<\/h1>/ or @body =~ /<h1>PHP Version [^<]{3,40}<\/h1>/)

		# PHP Version Detection
		m << { :version=>@body.scan(/<h1 class="p">PHP Version ([^<]{3,40})<\/h1>/).flatten.first } if @body =~ /<h1 class="p">PHP Version [^<]{3,40}<\/h1>/
		m << { :version=>@body.scan(/<h1>PHP Version ([^<]{3,40})<\/h1>/).flatten.first } if @body =~ /<h1>PHP Version [^<]{3,40}<\/h1>/

		# OS Detection
		m << { :os=>@body.scan(/<tr><td class="e">System[\s]?<\/td><td class="v">([^<]{10,256})[\s]?<\/td><\/tr>/).flatten.first } if @body =~ /<tr><td class="e">System[\s]?<\/td><td class="v">[^<]{10,256}[\s]?<\/td><\/tr>/

		# cpanel Detection
		m << { :module=>"cpanel" } if @body =~ /<tr><td class="e">SERVER_SOFTWARE[\s]?<\/td><td class="v">cpaneld[\s]?<\/td><\/tr>/

		# REMOTE_PASSWORD
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">REMOTE_PASSWORD[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/).flatten } if @body =~ /<tr><td class="e">REMOTE_PASSWORD[\s]?<\/td><td class="v">[^<]{3,256}[\s]?<\/td><\/tr>/
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">[_A-Z]{3,16}\["REMOTE_PASSWORD"\]<\/td><td class="v">([^<]{3,256})<\/td><\/tr>/).flatten } if @body =~ /<tr><td class="e">[_A-Z]{3,16}\["REMOTE_PASSWORD"\]<\/td><td class="v">[^<]{3,256}<\/td><\/tr>/

		# REMOTE_USER
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">REMOTE_USER[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/).flatten } if @body =~ /<tr><td class="e">REMOTE_USER[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">[_A-Z]{3,16}\["REMOTE_USER"\]<\/td><td class="v">([^<]{3,256})<\/td><\/tr>/).flatten } if @body =~ /<tr><td class="e">[_A-Z]{3,16}\["REMOTE_USER"\]<\/td><td class="v">[^<]{3,256}<\/td><\/tr>/

		# REMOTE_HOST
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">REMOTE_HOST[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/).flatten } if @body =~ /<tr><td class="e">REMOTE_HOST[\s]?<\/td><td class="v">[^<]{3,256}[\s]?<\/td><\/tr>/
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">[_A-Z]{3,16}\["REMOTE_HOST"\]<\/td><td class="v">([^<]{3,256})<\/td><\/tr>/).flatten } if @body =~ /<tr><td class="e">[_A-Z]{3,16}\["REMOTE_HOST"\]<\/td><td class="v">[^<]{3,256}<\/td><\/tr>/

		# DOCUMENT_ROOT
		m << { :filepath=>@body.scan(/<tr><td class="e">DOCUMENT_ROOT[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/).flatten	 } if @body =~ /<tr><td class="e">DOCUMENT_ROOT[\s]?<\/td><td class="v">[^<]{3,256}[\s]?<\/td><\/tr>/
		m << { :filepath=>@body.scan(/<tr><td class="e">[_A-Z]{3,16}\["DOCUMENT_ROOT"\]<\/td><td class="v">([^<]{3,256})<\/td><\/tr>/).flatten } if @body =~ /<tr><td class="e">[_A-Z]{3,16}\["DOCUMENT_ROOT"\]<\/td><td class="v">[^<]{3,256}<\/td><\/tr>/

	end

	m

end

end

