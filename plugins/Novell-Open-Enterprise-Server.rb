##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Novell-Open-Enterprise-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-16
version "0.1"
description "Novell Open Enterprise Server - Homepage: http://www.novell.com/products/openenterpriseserver/"

# Google results as at 2012-07-16 #
# 330 for intitle:"Home - Novell Open Enterprise Server 2" "Novell Open Enterprise Server provides secure, reliable and highly available workgroup services in an open environment"

# Dorks #
dorks [
'intitle:"Home - Novell Open Enterprise Server 2" "Novell Open Enterprise Server provides secure, reliable and highly available workgroup services in an open environment"'
]

# Examples #
examples %w|
mghtbrc13.mgh.harvard.edu
www.mail.medbill.com
mghtbrc13.mgh.harvard.edu
kimsrv9.ncpg.gov.za
mail.scconsumer.gov
academic2.american.edu
somifolder.ucsd.edu
netstore.nmiddlesex.mec.edu
ares.newpaltz.edu
eagle3.american.edu
www.student.ipfw.edu
print.msb.edu
iul.eng.fiu.edu
https://www3.waubonsee.edu/
https://www.ntw-datentechnik.com/
https://lawtoncs.org/
|

# Matches #
matches [

# / # Redirect Page
{ :text=>'<!-- This is all just a super-duper redirect to the Welcome page' },

# /welcome/index.html # Title
{ :text=>'<title>Home - Novell Open Enterprise Server 2</title>' },

# /welcome/index.html # Year Detection
{ :string=>/<p id="ftr-copy">&nbsp;&nbsp;&nbsp;&nbsp;&copy; (20[\d]{2}) Novell, Inc\. All Rights Reserved\.<\/p>/ },

# /welcome/index.html # JavaScript
{ :text=>'<script type="text/javascript" src="/welcome/inc/flashobj.js"></script> <!-- required for javascript banners from Novell.com -->' },

# /welcome/index.html # H1 Heading # Version Detection
{ :version=>/<h1>Novell Open Enterprise Server ([^<]+)<\/h1>\s+<p class="link"><a href="http:\/\/www\.novell\.com\/products\/openenterpriseserver\/">/ },

]

end

