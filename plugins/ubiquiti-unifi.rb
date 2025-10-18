##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
  name "Ubiquiti UniFy"
  authors [
    "John de Kroon <john.de.kroon@cyberant.com>", # 2025-10-18
  ]
  version "0.1"
  description "Ubiquiti UniFy network"
  website "https://ui.com/"

  # Dorks #
  dorks [
    'intitle:"UniFi Network"'
  ]

  # Matches #
  matches [
    # Detect the standard web‑UI page title
    {
      :text => "<div id=\"unifi-network-app-container\"></div>"
    },
    {
      :text => "<title>UniFi Network</title>"
    },

    # Detect the public status page to extract the version
    {
      :url      => "/status",
      :search   => "body",
      :version => /"server_version"\s*:\s*"([^"]+)"/,
    }
  ]
end
