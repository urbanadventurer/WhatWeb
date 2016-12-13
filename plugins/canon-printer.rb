##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-09-21 # Brendan Coles <bcoles@gmail.com>
# Updated model detection
# Updated http server header matches
##
Plugin.define "Canon-Printer" do
author "Andrew Horton"
version "0.2"
description "Remote UI for Canon Printers"
website "http://www.canon.com/"

# Google results as at 2011-09-21 #
# 10 for intitle:"Remote UI" intitle:"Top Page" intitle:Canon

# ShodanHQ results as at 2011-09-21 #
# 5,739 for CANON HTTP Server Ver
# 2,707 for KS_HTTP
#   817 for LPC Http Server

# Dorks #
dorks [
'intitle:"Remote UI" intitle:"Top Page" intitle:Canon'
]



# Matches #
# each model needs a different match
matches [

# iR2018i
{:model=>/<title>Remote UI<Top Page>: (\w+)/i},

# iR C3220
{:model=>/<title>Remote UI&lt;Top page&gt;: ([^:]+)/i, :url=>"/frame.cgi"},

# iR2870
{:model=>/<title>Remote UI&lt;Top page&gt;: ([^:]+)/i, :url=>"/frame.cgi?PageFlag=t_frame.tpl"},

# Model Detection # Title
{ :model=>/<link rel="shortcut icon" type="image\/x-icon" href="G24_favicon\.ico" \/><title>Remote UI \(Top Page\) : [^:^<]* : Canon ([^\s^<]+)<\/title>/ },
{ :model=>/<title>Canon ([^\s]+) series Network Configuration \| / },

# /_top.htm # Logo HTML
{ :url=>"/_top.htm", :text=>'<img src="top_canon.gif" width="123" height="33"' },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Canon Http Server/i },
{ :search=>"headers[server]", :version=>/^Canon Http Server (Ver)?(.*)/i, :offset=>1 },

# maybe used by other printers
{ :certainty=>75, :search=>"headers[server]", :version=>/^KS_HTTP\/([^\s]+)/ },

# also used by Konica-Minolta
{ :certainty=>25, :search=>"headers[server]", :version=>/^LPC Http Server\/V([^\s]+)/ },

]

end

