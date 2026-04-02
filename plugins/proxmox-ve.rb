##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Proxmox-VE"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-23
  "Patrik Wallstrom <pawal@amplitut.de>", # 2026-03-25 # v0.2 # Refresh detection for current Proxmox VE releases
]
version "0.2"
description "Proxmox Virtual Environment is an open-source virtualization platform for managing KVM virtual machines, LXC containers, storage, and clusters."
website "https://www.proxmox.com/en/proxmox-virtual-environment/overview"

dorks [
  'intitle:"Proxmox Virtual Environment"'
]

matches [
  # Current UI title format is "<node> - Proxmox Virtual Environment"
  { :name => "title", :regexp => /<title>[^<]+ - Proxmox Virtual Environment<\/title>/ },

  # Some pages expose product-specific auth identifiers in the response body
  { :name => "PVE auth marker", :search => "all", :regexp => /PVE(?:API|Auth)Token|PVEAuthCookie/, :certainty => 75 },

  # Aggressive version detection. This endpoint is product-specific and commonly
  # returns JSON including version/release details.
  { :url => "/api2/json/version", :status => 200, :version => /"version"\s*:\s*"([^"]+)"/ },
]

end
