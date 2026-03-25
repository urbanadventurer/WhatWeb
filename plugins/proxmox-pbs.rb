##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Proxmox-PBS"
authors [
  "Patrik Wallström <pawal@amplitut.de>", # 2026-03-25 # v0.1
]
version "0.1"
description "Proxmox Backup Server is an open-source enterprise backup solution for virtual machines, containers, and physical hosts."
website "https://www.proxmox.com/en/proxmox-backup-server/overview"

dorks [
  'intitle:"Proxmox Backup Server"'
]

matches [
  # The web UI title is product-specific across current PBS releases.
  { :name => "title", :regexp => /<title>[^<]*Proxmox Backup(?: Server)?<\/title>/ },

  # PBS-specific login and authentication markers observed in upstream UI code.
  { :name => "PBS auth marker", :search => "all", :regexp => /PBSAPIToken|PBS\.LoginView|__Host-PBSAuthCookie/, :certainty => 75 },

  # Aggressive version detection via the product API.
  { :url => "/api2/json/version", :status => 200, :version => /"version"\s*:\s*"([^"]+)"/ },
]

end
