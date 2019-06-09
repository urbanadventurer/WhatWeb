##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Linksys-USB-HDD"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-27
  # v0.2 # Updated firmware version detection.. Added model detection.. 
  # v0.3 # 2011-02-25 # Updated version detection. 
]
version "0.3"
description "Linksys external USB HDD web frontend"
website "http://www.linksys.com/"

# Google results as at 2010-06-27 #
# 7 for intitle:"Network Storage Link for USB 2.0 Disks" Firmware

# Dorks #
dorks [
'intitle:"Network Storage Link for USB 2.0 Disks" Firmware'
]



# Matches #
matches [

# GHDB Match
{ :ghdb=>'intitle:"Network Storage Link for USB 2.0 Disks" Firmware', :certainty=>75 },

# Default title
{ :text=>'<title>Network Storage Link for USB 2.0 Disks</title>' },

# Firmware Detection
{ :firmware=>/          Version: &nbsp;V([\d\.\-a-zA-Z]+)<\/span> &nbsp;&nbsp;<\/td>/ },

# Model Detection
{ :model=>/	 <td align="center" width="100" class="mname">([^<]+)<\/td>/ },

]

end

