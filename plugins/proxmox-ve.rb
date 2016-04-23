##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Proxmox-VE" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "Proxmox Virtual Environment is an easy to use Open Source virtualization platform for running Virtual Appliances and Virtual Machines."
website "http://www.proxmox.com/products/proxmox-ve"

# Google results as at 2011-05-23 #
# 2 for "JavaScript is not available" intitle:"Proxmox Virtual Environment"

# Dorks #
dorks [
'"JavaScript is not available" intitle:"Proxmox Virtual Environment"'
]



# Matches #
matches [

# Version Detection # boxheadline
{ :version=>/<a href='http:\/\/www\.proxmox\.com' target='_blank' class="boxheadline">Proxmox Virtual Environment ([^<^\s]+)<\/a>/ },

# Logo HTML
{ :text=>'<img alt="" style="display:block;border:0px;width:1000px;max-height:300px;" src=\'/images/logo_pve.jpg\'>' },

]

end

