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



# Passive #
def passive
	m=[]

	# Extract vcard Details
	if @body =~ /^BEGIN:VCARD[\s]*$/i and @body =~ /^END:VCARD/i

		# Version
		m << { :version=>@body.scan(/^BEGIN:VCARD[\s]*$.*^VERSION:([\d\.]{1,3})[\s]*$.*^END:VCARD/im).flatten } if @body =~ /^BEGIN:VCARD[\s]*$.*^VERSION:([\d\.]{1,3})[\s]*$.*^END:VCARD/im

		# Name
		m << { :string=>"Name:"+@body.scan(/^BEGIN:VCARD[\s]*$.*^N:([^\r^\n]+)[\s]*$.*^END:VCARD/im).flatten } if @body =~ /^BEGIN:VCARD[\s]*$.*^N:([^\r^\n]+)[\s]*$.*^END:VCARD/im

		# Full Name
		m << { :string=>"Full Name:"+@body.scan(/^BEGIN:VCARD[\s]*$.*^FN:([^\r^\n]+)[\s]*$.*^END:VCARD/im).flatten } if @body =~ /^BEGIN:VCARD[\s]*$.*^FN:([^\r^\n]+)[\s]*$.*^END:VCARD/im

		# Oraganization
		m << { :string=>"Organization:"+@body.scan(/^BEGIN:VCARD[\s]*$.*^ORG:([^\r^\n]+)[\s]*$.*^END:VCARD/im).flatten } if @body =~ /^BEGIN:VCARD[\s]*$.*^ORG:([^\r^\n]+)[\s]*$.*^END:VCARD/im

		# Address # 3.x only
		m << { :string=>"Address:"+@body.scan(/^BEGIN:VCARD[\s]*$.*^ADR:([^\r^\n]+)[\s]*$.*^END:VCARD/im).flatten } if @body =~ /^BEGIN:VCARD[\s]*$.*^ADR:([^\r^\n]+)[\s]*$.*^END:VCARD/im

	end

	# Return passive matches
	m
end

end

