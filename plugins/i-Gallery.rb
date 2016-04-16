##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "i-Gallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "i-Gallery is a complete online photo gallery. Easy to navigate thumbnails with paging. Enlarged views offer print & email buttons."
website "http://www.b-cp.com/igallery"

# 276 results for "powered by i-Gallery" @ 2010-10-14

# Dorks #
dorks [
'"powered by i-Gallery"'
]



matches [

# Version detection # Default title
{ :version=>/<title>.:: i-Gallery ([\d\.]+) -[^:]+:.<\/title>/ },

# Version detection # Powered by text
{ :version=>/<font class="textsm">Powered By:&nbsp;<a class="linksm" href="http:\/\/www.b-cp.com\/igallery" target="_blank">i-Gallery ([\d\.]+)<\/a>/i },

# Main Page # Default JavaScript
{ :text=>'var verify = confirm("Are you sure you want to permanently delete the selected \"Item\" from the i-Gallery database?  All information will be lost!");' },

# Main page # HTML comment
{ :text=>'<!-- ################ Begin Empty Root Folder Message ################ -->' },

# Default logo HTML
{ :regexp=>/<img src="images\/igallery-logo.gif" width=[0-9]* height=[0-9]* border=[0-9]* alt="i-Gallery Home Page"><\/a><br>/ },

# Default ViewPhoto.asp title
{ :text=>'<title>.::  - Photo Viewer ::.</title>', :path=>"ViewPhoto.asp" },

]

end

