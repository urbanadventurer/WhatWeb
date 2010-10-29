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
examples %w|
61.64.54.45
211.130.165.56
65.44.139.6
216.109.158.37
202.218.201.137
59.124.13.97
12.24.12.14
193.158.54.246
212.87.83.78
210.243.242.161
|

# HTTP Header
def passive
	m=[]

	# X-Accelerated-By
	m << { :version=>@meta["x-accelerated-by"].scan(/^[\s]*PHPA\/([^\r^\n]*)/) } if @meta["x-accelerated-by"] =~ /^[\s]*PHPA\/([^\r^\n]*)/

	m

end

end

