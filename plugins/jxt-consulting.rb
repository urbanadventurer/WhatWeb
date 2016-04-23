##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "JXT-Consulting" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-19
version "0.1"
description "JXT Consulting specialises in building and designing recruitment websites and implementing social recruiting strategies for recruitment companies, utilising the benefits of facebook, twitter and LinkedIn."
website "http://www.jxt.com.au/"

# Google results as at 2012-03-19 #
# 274 for "Powered by JXT Consulting"
#  88 for inurl:"lx.aspx?dynamicpageid="

# Dorks #
dorks [
'"Powered by JXT Consulting"'
]



# Matches #
matches [

# div id="jxt-popup-wrapper"
{ :text=>'<div id="jxt-popup-wrapper">' },

# HTML Comment
{ :text=>'<!-- Dynamic white label meta content -->' },

# Powered by link
{ :regexp=>/Powered by <a href="http:\/\/(www\.)?jxt\.com\.au" target="_blank">JXT Consulting<\/a>/ },
{ :text=>'<a href="http://www.jxt.com.au" target="_blank">Powered by JXT Consulting</a>' },

# Shortcut Icon
{ :string=>/<link rel="shortcut icon" href="\/GetWhitelabelFile\.aspx\?whiteLabelFileID=(\d+)"\s?\/>/ },

]

end

