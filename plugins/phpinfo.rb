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

# Examples #
examples %w|
www.jtlnet.com/phpinfo.php
www.lufthavn.com
www.nskor.com
www.bali-bungalows.com/info.php
www.no-debris.org
topheadsets.com/jk.php
www.ycbo.com/info.php
www.netseoul.net
thewholepie.com
juliandavid.net/ejemplos/php/info.php
lynneberg.com/mod-php/phpinfo.php
www.superhosting.com.au
www.cac.com.au/phpinfo.php
www.chainwirefm.com.au/test/php/php_info.php
linked.viper007bond.com/local_phpinfo.htm
www.weblinks.com.au
www.yourname.com.au
php.ultraserver.co.uk
www.london-pc-support.co.uk/test.php
www.finnie.org/software/ncsa-httpd/phpinfo.php
www.iddc.org.uk/info/dfid_policy.pdf
www.host.sk/phpinfo.html
hydromet.ru/docs/inf.php
php.scripts.psu.edu/users/t/p/tpp5004/phpinfo.php
icecreamcakes.com.au/scripts/phpinfo.php
iskaldt.com/su-php/phpinfo.php
www.marketingtactics.com/PHP_Tutorials/PHP_RequestInfo_Primer/Lessons/Lesson_00/phpinfo.php
oicjapan.org/phpinfo.php
norgesbakeriene.com/mod-php/phpinfo.php
hosting.iptcom.net/phpinfo.php
www.idcuk.co.uk/info.php
members.iinet.net.au/~isabelle/public_html/public_html/phpinfo.php
members.iinet.net.au/~isabelle/phpinfo.php
www.hwaccess.net/phpinfo.php
www.beloze.com/test/index.php
www.o4e.com/public/phpinfo.php
|

# Passive #
def passive
        m=[]

	# Check if the document is a valid phpinfo() file
        if @body =~ /<title>phpinfo\(\)<\/title>/ and (@body =~ /<h1 class="p">PHP Version [^<]{3,40}<\/h1>/ or @body =~ /<h1>PHP Version [^<]{3,40}<\/h1>/)

		# PHP Version Detection
		m << { :version=>@body.scan(/<h1 class="p">PHP Version ([^<]{3,40})<\/h1>/)[0].to_s } if @body =~ /<h1 class="p">PHP Version [^<]{3,40}<\/h1>/
		m << { :version=>@body.scan(/<h1>PHP Version ([^<]{3,40})<\/h1>/)[0].to_s } if @body =~ /<h1>PHP Version [^<]{3,40}<\/h1>/

		# OS Detection
		m << { :os=>@body.scan(/<tr><td class="e">System[\s]?<\/td><td class="v">([^<]{10,256})[\s]?<\/td><\/tr>/)[0].to_s } if @body =~ /<tr><td class="e">System[\s]?<\/td><td class="v">[^<]{10,256}[\s]?<\/td><\/tr>/

		# cpanel Detection
		m << { :module=>"cpanel" } if @body =~ /<tr><td class="e">SERVER_SOFTWARE[\s]?<\/td><td class="v">cpaneld[\s]?<\/td><\/tr>/

		# REMOTE_PASSWORD
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">REMOTE_PASSWORD[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/) } if @body =~ /<tr><td class="e">REMOTE_PASSWORD[\s]?<\/td><td class="v">[^<]{3,256}[\s]?<\/td><\/tr>/
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">[_A-Z]{3,16}\["REMOTE_PASSWORD"\]<\/td><td class="v">([^<]{3,256})<\/td><\/tr>/) } if @body =~ /<tr><td class="e">[_A-Z]{3,16}\["REMOTE_PASSWORD"\]<\/td><td class="v">[^<]{3,256}<\/td><\/tr>/

		# REMOTE_USER
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">REMOTE_USER[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/) } if @body =~ /<tr><td class="e">REMOTE_USER[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">[_A-Z]{3,16}\["REMOTE_USER"\]<\/td><td class="v">([^<]{3,256})<\/td><\/tr>/) } if @body =~ /<tr><td class="e">[_A-Z]{3,16}\["REMOTE_USER"\]<\/td><td class="v">[^<]{3,256}<\/td><\/tr>/

		# REMOTE_HOST
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">REMOTE_HOST[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/) } if @body =~ /<tr><td class="e">REMOTE_HOST[\s]?<\/td><td class="v">[^<]{3,256}[\s]?<\/td><\/tr>/
		m << { :module=>"cpanel", :account=>@body.scan(/<tr><td class="e">[_A-Z]{3,16}\["REMOTE_HOST"\]<\/td><td class="v">([^<]{3,256})<\/td><\/tr>/) } if @body =~ /<tr><td class="e">[_A-Z]{3,16}\["REMOTE_HOST"\]<\/td><td class="v">[^<]{3,256}<\/td><\/tr>/

		# DOCUMENT_ROOT
		m << { :filepath=>@body.scan(/<tr><td class="e">DOCUMENT_ROOT[\s]?<\/td><td class="v">([^<]{3,256})[\s]?<\/td><\/tr>/) } if @body =~ /<tr><td class="e">DOCUMENT_ROOT[\s]?<\/td><td class="v">[^<]{3,256}[\s]?<\/td><\/tr>/
		m << { :filepath=>/<tr><td class="e">[_A-Z]{3,16}\["DOCUMENT_ROOT"\]<\/td><td class="v">([^<]{3,256})<\/td><\/tr>/ } if @body =~ /<tr><td class="e">[_A-Z]{3,16}\["DOCUMENT_ROOT"\]<\/td><td class="v">[^<]{3,256}<\/td><\/tr>/

	end

	m

end

end

