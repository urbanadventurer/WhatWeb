##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Biscom-Delivery-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-20
version "0.1"
description "Biscom Delivery Server - Secure File Transfer (SFT) software - Homepage: http://www.biscomdeliveryserver.com/"

# ShodanHQ results as at 2011-11-20 #
# 27 for bds/Login.do

# Google results as at 2011-11-20 #
# 34 for inurl:"bds/Login.do"

# Dorks #
dorks [
'inurl:"bds/Login.do"'
]

# Examples #
examples %w|
portal.millergrossbard.com/bds/Login.do
tc.travelingcoaches.com/bds/Login.do
https://sft.cdm.com/bds/Login.do
https://download.ibsa.org/bds/Login.do
https://bds.fslso.com/bds/Login.do
https://bds.elliemae.com/bds/Login.do
https://deliveries.bostonbeer.com/bds/Login.do
https://secure.stinson.com/bds/Login.do
https://transfer.softprocorp.com/bds/Login.do
https://ec2-174-129-12-94.compute-1.amazonaws.com/bds/Login.do
https://send.spacex.com/bds/Login.do
https://send.spacex.com/bds/Login.do
https://delivery.caci.com/bds/Login.do
https://download.fifsinc.com/bds/Login.do
https://chbft.childrens.harvard.edu/bds/Login.do
https://bds.fslso.com/bds/Login.do
https://transfer.hmmh.com/bds/Login.do
https://dropbox.jwhomes.com/bds/Login.do
https://share.sapient.com/bds/Login.do
https://petsrv.tyks.fi/bds/Login.do
https://secureemail.nih.gov/bds/Login.do
https://biscomserver.masbilling.com/bds/Login.do
https://sft.pearson.com/bds/Login.do
https://mdtclinicaltransfer.com/bds/Login.do
https://dcp.benefitplanservices.com/bds/Login.do
|

# Matches #
matches [

# /bds/Login.do # StyleSheet
{ :text=>'<link rel="StyleSheet" href="/bds/stylesheets/fds.css" type="text/css">' },

# /bds/Login.do # JavaScript
{ :text=>'<script src="/bds/includes/fdsJavascript.do" type="text/javascript"></script>' },

# /bds/Login.do # Shortcut Icon
{ :text=>'<link rel="ICON" href="/bds/images/icons/favicon.ico" />' },

# /bds/images/icons/favicon.ico
{ :url=>"/bds/images/icons/favicon.ico", :md5=>"eb05f77bf80d66f0db6b1f682ff08bee" },

]

end

