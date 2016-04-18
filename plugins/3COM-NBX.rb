##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "3COM-NBX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-09
version "0.1"
description "3COM NBX phone system. The NBX NetSet utility is a web interface in which you configure and manage the NBX system. NBX systems present the NBX NetSet utility through an embedded web server that is integrated in system software."
website "http://inpath.com/products/3com-nbx.html"

# More Info #
# http://www.nbxnetset.com/

# ShodanHQ results as at 2011-08-09 #
# 827 for Virata-EmWeb Alternates
# 823 for Virata-EmWeb Alternates TCN

# Google results as at 2011-08-09 #
# 7 for intitle:"NBX NetSet" +Version +Created

# Dorks #
dorks [
'intitle:"NBX NetSet" "Version" "Created"'
]

# Matches #
matches [

# Title
{ :text=>'<head><title>NBX NetSet</title>' },
{ :text=>'<HEAD><TITLE>NBX NetSet</TITLE>' },

# HTML Comment
{ :text=>'<!-- (c) Copyright, 3Com Corporation or its subsidiaries, 2004.  All Rights Reserved. -->' },
{ :text=>'<!-- Gregory Brucato  4/22/98  NBX Corporation -->' },

# Version Detection # META HTTP-EQUIV="sysObjectID"
{ :version=>/<META HTTP-EQUIV="sysObjectID" CONTENT="([\d\.]{20,30})">/ },

# span class="splashTitleIPTelephony"
{ :text=>'<span class="splashTitleIPTelephony">&nbsp;3Com<SUP><span class="splashTitleNBXReg">&reg;</span></SUP> IP Telephony Solution</span>' },

# Firmware Version Detection
{ :firmware=>/<td colspan="3" class="splashVersionCol" valign='bottom'>[\s]+Version:&nbsp;([^<]+)<br \/>[\s]+Created:&nbsp;/ },
{ :firmware=>/<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0"><TR><TD ALIGN="right" WIDTH="130" HEIGHT="75">[\s]+Version:(&nbsp;)?([^<]+)<BR>/, :offset=>1 },

# Model Detection
{ :model=>/<span class="splashTitleNBX">NBX<SUP><span class="splashTitleNBXReg">&reg;<\/span><\/SUP><\/span>[\s]+<span class="splashTitlePlatform">(&nbsp;)?([^<]+)<\/span>/, :offset=>1 },

]

# Passive #
def passive
	m=[]

	# HTTP Headers
	if @headers["server"] =~ /^Virata-EmWeb\/R6_0_3$/ and !@headers["alternates"].nil? and !@headers["tcn"].nil?
		m << { :name=>"HTTP Headers" }
	end

	# Return passive matches
	m
end
end

