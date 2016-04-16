##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PTCPay" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "PTCPay is a sofware development company that develops and supports the GeN4 Security+ GPT/PTC/Bux script."
website "http://ptcpay.com/"

# Google results as at 2011-02-27 #
# 7 for "Login into your admin panel" "PTCPay.Com" inurl:"admin"

# Dorks #
dorks [
'"Login into your admin panel" "PTCPay.Com" inurl:"admin"'
]



# Matches #
matches [

# GHDB Match # Powered by text
{ :certainty=>25, :ghdb=>'"powered by PTCPay"' },

# Default logo HTML
{ :text=>'<div class="left"><img src="pre/images/ic_support.png" width="23" height="23" alt="" /></div>' },

# Powered by text
{ :text=>'<p>Powered by <a href="http://www.ptcpay.com" target="_blank">GeN4 Security+</a>' },

# Version Detection # Admin Page # Powered by text
{ :version=>/<\/div><div class="foot">GeN4 Secur(ity|e)\+ ([\d\.]{1,6})  &copy; 2009 - 20[\d]{2} <a href="http:\/\/www.ptcpay.com" target="_blank">PTCPay.Com<\/a><\/div>/, :offset=>1 },

]

end


