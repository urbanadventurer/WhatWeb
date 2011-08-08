##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MShift" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.1"
description "MShift - Comprehensive Mobile Banking - Over 200 US Financial Institutions are MShift clients. With a base comprised of the largest banks in the world, as well as regional credit unions and local banks, MShift is the standard by which Mobile Banking is measured. - Homepage: http://www.mshift.com/"

# Google results as at 2011-05-12 #
# 53 for inurl:msestks

# Dorks #
dorks [
'inurl:msestks'
]

# Examples #
examples %w|
http://www.mshift.com/rbfcudemo/rbfcudemo.jsp
https://my.mshift.com/c2ht
https://qa33.mshift.com/gs
https://www.ba2go.mobi/gs
https://www.isucu.mobi/gs
https://www.bankplus2go.net/c2ht
https://www.cambridgesavings.mobi/gs
https://go.akusa.org/c2ht
https://www.ffnm2go.mobi/gs
https://go.sdfcu.org/c2ht
https://www.bankbyphone.org/gs
https://m.teamonecu.org/c2ht
https://www.66fcu.mobi/gs
https://m.quicken.com/gs
https://go.firstcommunity.com/c2ht
https://go.nwfcu.org/c2ht
https://m.firstent.org/c2ht
https://www.myswb.mobi/gs
https://m.ncsecu.org/gs
https://www.cardinalonthego.com/gs
https://www.mibank.mobi/gs
https://mobile.ccuflorida.org/gs
https://mobile.aacreditunion.org/gs
https://m.faaecu.org/c2ht
https://m.summitcreditunion.com/c2ht
https://www.mffcu.mobi/gs
https://www.greatfloridabank.mobi/gs
https://www.p1fcu.mobi/gs
https://www.copcu.mobi/gs
https://m.educationcu.com/gs
https://m.firstdayfcu.org/gs
https://mbranch.rcu.org/c2ht
https://mobile.framinghamcoop.com/gs
https://go.citybankwa.com/gs
https://m.staleycu.com/gs
https://mobile.easternbank.com/gs
https://m.firstflorida.org/gs
https://m.beaconcu.org/c2ht
https://www.ttcu.mobi/gs
|

# Matches #
matches [

# Default Page # body
{ :text=>'<BODY><b>MShift, Inc</b><br>Relevant Mobile Solutions<br>http://www.mshift.com' },

# Powered by text
{ :text=>'<td align="center"><font size="-1" color="#FFFFFF">Powered by MShift&reg;</font></td></tr>' },
{ :text=>'<td align="center"><font size="-1" color=#FFFFFF>Powered by MShift&reg;</font></td></tr>' },
{ :text=>'<div class="poweredBy">Powered by MShift &reg;</div>' },

]

# Passive #
def passive
	m=[]

	# dcttype cookie
	m << { :certainty=>25, :name=>"dcttype cookie" } if @headers["set-cookie"] =~ /^dcttype=1$/

	# Return passive matches
	m
end

end


