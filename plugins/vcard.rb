##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "vcard" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-07
version "0.1"
description "vCard is a file format standard for electronic business cards. This plugin identifies vcards and extracts the vcard version, name, full name and organization details."
# More info: http://en.wikipedia.org/wiki/VCard

# Google results as at 2011-02-07 #
# 956,000 for filetype:vcf

# Examples #
examples %w|
n3td3v.myopenid.com/?vcard
bob.usuhs.mil/mailserv/list-archives/xforms-archive/att-0119/01-serge.vcf
www.crmc.navy.mil/downloads/V_Cards/CODE%2000EA.vcf
www.crmc.navy.mil/downloads/V_Cards/CODE%20100.vcf
www.crmc.navy.mil/downloads/V_Cards/CODE%20600.vcf
www.crmc.navy.mil/downloads/V_Cards/CODE%201200.vcf
www.crmc.navy.mil/downloads/V_Cards/CODE%201230.vcf
squid.spd.co.il/mail-archive/squid-users/199908/att-0376/ian.vcf
www.luthi.co.il/luthi.vcf
www.musiconoff.co.il/ua-vcard.vcf
www.haberlaw.co.il/vcard/hay.vcf
www.haberlaw.co.il/vcard/Haber_law.vcf
www.microproject.co.il/Documents/My%20Vcard.vcf
www.mediaguru.co.il/myVcard.vcf
www.oren-playground.co.il/var/2088/290361-ShlomoVCard.vcf
www.yuvalaw.co.il/images/vcards/yuval_levi.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/YanivRog.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/MichalZanko.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/BinyaminTovi.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/MotiEilon.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/YanivShekel.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/ShaiErez.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/DrMosheShekel.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/YuvalMaoz.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/YanivHershcovitz.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/OferElboim.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/AyeletHillel.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/TaliYehoshua.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/LiliCohenUrieli.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/AlbertHarel.vcf
www.shekel-tax.co.il/he/images/stories/site/vcards/AvitalEitan.vcf
|

# Passive #
def passive
	m=[]

	# Extract vcard Details
	if @body =~ /^BEGIN:VCARD[\s]*$/i and @body =~ /^END:VCARD/i

		# Version
		m << { :version=>@body.scan(/^BEGIN:VCARD[\s]*$.*^VERSION:([\d\.]{1,3})[\s]*$.*^END:VCARD/im).to_s } if @body =~ /^BEGIN:VCARD[\s]*$.*^VERSION:([\d\.]{1,3})[\s]*$.*^END:VCARD/im

		# Name
		m << { :string=>"Name:"+@body.scan(/^BEGIN:VCARD[\s]*$.*^N:([^\r^\n]+)[\s]*$.*^END:VCARD/im).to_s } if @body =~ /^BEGIN:VCARD[\s]*$.*^N:([^\r^\n]+)[\s]*$.*^END:VCARD/im

		# Full Name
		m << { :string=>"Full Name:"+@body.scan(/^BEGIN:VCARD[\s]*$.*^FN:([^\r^\n]+)[\s]*$.*^END:VCARD/im).to_s } if @body =~ /^BEGIN:VCARD[\s]*$.*^FN:([^\r^\n]+)[\s]*$.*^END:VCARD/im

		# Oraganization
		m << { :string=>"Organization:"+@body.scan(/^BEGIN:VCARD[\s]*$.*^ORG:([^\r^\n]+)[\s]*$.*^END:VCARD/im).to_s } if @body =~ /^BEGIN:VCARD[\s]*$.*^ORG:([^\r^\n]+)[\s]*$.*^END:VCARD/im

		# Address # 3.x only
		m << { :string=>"Address:"+@body.scan(/^BEGIN:VCARD[\s]*$.*^ADR:([^\r^\n]+)[\s]*$.*^END:VCARD/im).to_s } if @body =~ /^BEGIN:VCARD[\s]*$.*^ADR:([^\r^\n]+)[\s]*$.*^END:VCARD/im

	end

	# Return passive matches
	m
end

end

