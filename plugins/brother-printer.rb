##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-08 #
# Updated model detection
# Added frameset match
##
Plugin.define "Brother-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "Brother printer web interface - homepage: http://www.brother.com/"
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
	# This regex could be improved
	{ :model=>/<TITLE>Brother ([0-9A-Z\-\_]+) series[\ \(\ SLEEP\ \)|\ \(\ PAUSE\ \)|\ \(\ READY\ \)]*<\/TITLE>/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	# This header is also used by brother faxes
	m << { :certainty=>25, :version=>@headers["server"].scan(/^[Dd]ebut\/([\d\.]+)$/) } if @headers["server"] =~ /^[Dd]ebut\/([\d\.]+)$/

	# Return passive matches
	m
end

end

