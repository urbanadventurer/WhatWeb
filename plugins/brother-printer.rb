##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Brother-Printer"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-07-22
  # v0.2 # 2011-01-08 # Updated model detection. Added frameset match. 
  # v0.3 # 2016-04-18 # Replaced passive function with matches. 
  "Andrew Horton", # v0.4 # 2019-07-10 # Fixed false positves for model regex. Fix warning: character class has duplicated range
]
version "0.4"
description "Brother printer web interface"
website "http://www.brother.com/"
# Default login: Admin/Access

# Google results as at 2010-07-22 #
# 57 for intitle:"Brother" intext:"View Configuration" intext:"Brother Industries, Ltd."
# 23 for inurl:"printer/main.html" intext:"settings" @ 2010-07-22

# ShodanHQ results as at 2010-07-22 #
# 1,661 for printer Server:debut

# Dorks #
dorks [
'intitle:"Brother" intext:"View Configuration" intext:"Brother Industries, Ltd."'
]



# Matches #
matches [

	# Framset # Header frame
	{ :text=>'<FRAME SRC="/printer/inc_head.html" NAME="header" NORESIZE SCROLLING="no">' },

	# Model Detection # HL-40xx series # Default image HTML
	{ :text=>'<IMG src="/common/image/HL4040CN.gif" border=0>', :model=>"HL-4040CN" },
	{ :text=>'<IMG src="/common/image/HL4040CDN.gif" border=0>', :model=>"HL-4040CDN" },
	{ :text=>'<IMG src="/common/image/HL4050CDN.gif" border=0>', :model=>"HL-4050CDN" },
	{ :text=>'<IMG src="/common/image/HL4070CDW.gif" border=0>', :model=>"HL-4070CDW" },

	# Model Detection # HL-1x / HL-2x / HL-5x / HL-6x series
	# Tested models: HL-6050D_DN / HL-5370DW / HL-5250DN / HL-5250DN /  HL-5270DN / HL-5370DW / HL-1650_1670N / HL-2150N / HL-2460 / HL-2170W / HL-2070N
	{ :model=>/<TITLE>[\s]*Brother ([\w-]+) series/ },
	{ :certainty=>25, :search=>"headers[server]", :version=>/^[Dd]ebut\/([\d\.]+)$/ },

]

end

