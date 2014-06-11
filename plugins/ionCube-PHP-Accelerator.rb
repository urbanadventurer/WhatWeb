##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ionCube-PHP-Accelerator" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "The ionCube PHP Accelerator is an easily installed PHP Zend engine extension that provides a PHP cache, and is capable of delivering a substantial acceleration of PHP scripts without requiring any script changes, loss of dynamic content, or other application compromises. - homepage: http://www.php-accelerator.co.uk/"

# About 1517 ShodanHQ results for "X-Accelerated-By: PHPA" @ 2010-10-30


# HTTP Header
def passive
	m=[]

	# X-Accelerated-By
	m << { :version=>@headers["x-accelerated-by"].scan(/^[\s]*PHPA\/([^\r^\n]*)/) } if @headers["x-accelerated-by"] =~ /^[\s]*PHPA\/([^\r^\n]*)/

	m

end

end

