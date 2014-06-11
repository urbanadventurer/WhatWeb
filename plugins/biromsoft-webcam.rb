##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Biromsoft-WebCam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.1"
description "Biromsoft webcam web interface - http://www.biromsoft.com/"

# 164 results for intitle:"Biromsoft WebCam" -download -serial -crack -the -a @ 2010-07-22

# Dorks #
dorks [
'intitle:"Biromsoft WebCam" -download -serial -crack -the -a'
]



# Matches #
matches [

{ :text=>'<title>Biromsoft WebCam</title>', :certainty=>75 },

{ :regexp=>/<area shape="rect" coords="[\d\-,]+" href="http:\/\/www.biromsoft.com" alt="Visit BiromSoft " title="Visit BiromSoft ">/ },

{ :text=>'<area shape="rect" coords="22,26,151,102" href="http://www.biromsoft.com">' },

]


end

