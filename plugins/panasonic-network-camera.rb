##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Fixed regex
##
Plugin.define "Panasonic-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.2"
description "Panasonic network cameras"

# About 18,400 Google results for inurl:"ViewerFrame?Mode=" @ 2010-07-20
# 288 Google results for inurl:"CgiStart?page=" @ 2010-07-20

# Dorks #
dorks [
'inurl:"ViewerFrame?Mode="',
'inurl:"CgiStart?page="'
]



# Matches #
matches [

{ :text=>'<HEAD><TITLE>WJ-NT104 MAIN PAGE</TITLE></HEAD>', :version=>"WJ-NT104" },

{ :text=>'      <FONT FACE="Arial" STYLE="font-size: 24px" COLOR="#ffffff"><B>Network Camera</B></FONT>' },

{ :regexp=>/<BODY BACKGROUND="image\/Hcm1[0]?\.gif" 		[\t]?BGCOLOR="#efefef" TEXT="#000000" LINK="#000000" 			VLINK="#000000" ALINK="#000000">/ },

{ :regexp=>/<FRAME name=bar src="CgiTagMenu\?page=[^&]+&Language=[\d]+" scrolling=no NORESIZE>/ },

# WJ-HD200/WJ-HD220 Digital Disk Recorder Series
{ :text=>'<META name="copyright" content="Copyright (C) 2003 Matsushita Electric Industrial Co., Ltd. All rights reserved.">' },
{ :text=>'<TITLE>Digital Disk Recorder WJ-HD220 CONTROL MAIN PAGE</TITLE>', :version=>"WJ-HD220" },
{ :text=>'<TITLE>WJ-HD200 DigitalDiskRecorder CONTROL MAIN PAGE</TITLE>', :version=>"WJ-HD200" },
{ :text=>'window.location.replace("/view/idconv.cgi?UID=%i&FILE=/hdrindex.html&PAGE="+myDate.getTime());' },

]

# Passive #
def passive
        m=[]

	# Version Detection
        if @body =~ /      <FONT FACE="Arial" STYLE="font-size: 16px" COLOR="#ffffff">/
                if @body =~ /        <B>([\d\-A-Z]+)<\/B>/
                        version=@body.scan(/        <B>([\d\-A-Z]+)<\/B>/)[0][0]
                        m << { :version=>version }
                end
        end

	# Return passive matches
        m
end

end

