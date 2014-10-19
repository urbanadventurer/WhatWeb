##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NCR-iTRAN-3000t-Imaging-Transport" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-11-16
version "0.1"
description "A full function, image-based table top check imaging and payment processing device"
website "http://www.ncr.com/products-and-services/payment-and-imaging/check-and-document-imaging/low-to-mid-volume-item-processing/ncr-itran-3000t-imaging-transport"

# More Info # http://www.ncr.com/documents/itran_3000t_ds.pdf



# Matches #
matches [

# Version Detection
{ :version=>/<html><title>Infinity Site Configuration<\/title>\s+<body bgcolor=white link=blue text=black vlink=maroon>\s+<center>\s+<p align=right>Version: ([^\s^<]+)<\/p>/ },
{ :version=>/<html>\s+<title>Main Menu<\/title>\s+<body bgcolor=white link=blue text=black vlink=maroon>\s+<p align=right>Version: ([^\s^<]+)<\/p>/ },

# Site Name Detection
{ :string=>/<h1><i><font color=red>Infinity<\/font><\/i> Main Menu<\/h1>\s+<b>([^<]+)<\/b>/ },

# /setup.php # Password Detection
{ :url=>"/setup.php", :account=>/<input type=hidden name=setupItem\[\] value="\$cpassword"><input type=hidden name=setupTitle\[\] value="iSite Controller Password"><input name=setupValue\[\] value="([^\"^>]+)" size=40><\/td><\/tr>/ },

]

end

