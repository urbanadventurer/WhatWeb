##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Wowza-Media-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-18
version "0.1"
description "Wowza Media Server is used for streaming of live and on-demand video, audio, and RIAs (rich Internet applications) over public and private IP networks to desktop, laptop, and tablet computers, mobile devices, IPTV set-top boxes, internet-connected TV sets, and other network-connected devices - Homepage: www.wowza.com/"
# More info: https://en.wikipedia.org/wiki/Wowza_Media_Server

# ShodanHQ results as at 2012-03-18 #
# 56 for wowza

# Google results as at 2012-03-18 #
# 12 for intitle:"Wowza Media Server 3 Monthly Edition"

# Dorks #
dorks [
'intitle:"Wowza Media Server 3 Monthly Edition"'
]

# Examples #
examples %w|
68.68.29.37
68.68.29.19
68.68.29.17
68.68.29.25
178.21.120.198
201.7.180.143
68.68.29.20
m.live-fstreams.rambla.be
82.80.218.164:8086
178.86.20.88:1935/dawn/dawn_sub/Manifest.f4m
timaotv.uol.com.br
awv.m.live-fstreams.cdn01.rambla.be
wow.eleden.com:1935/cristov/cristov.stream
|

# Matches #
matches [

# Version Detection # document body
{ :version=>/<html><head><title>Wowza Media Server [\d]+ Monthly Edition ([\d\.]+ build[\d]+)<\/title><\/head><body>Wowza Media Server [\d]+ Monthly Edition ([\d\.]+ build[\d]+)<\/body><\/html>/ },

# WWW-Authenticate
{ :search=>"headers[www-authenticate]", :text=>'realm="Wowza Media Systems"' },

]

end

