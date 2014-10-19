##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "XyberShield" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "XyberShield is a web-based, Software as a Service web application security solution delivered as an on-demand service. XyberShield utilizes individual, specialized security modules to defend against the top web application vulnerabilities and OWASP-defined attacks, as well as aid companies pursuing PCI 6.6 compliance requirements."
website "https://www.xybershield.com/default.aspx"

# ShodanHQ results as at 2011-08-25 #
# 4 for XyberShieldStatus
# 4 for XyberShieldSession



# Matches #
matches [

# XyberShieldSession Cookie
{ :search=>"headers[set-cookie]", :regexp=>/XyberShieldSession=[^\s]+;/ },

# XyberShieldSession Cookie
{ :search=>"headers[set-cookie]", :regexp=>/XyberShieldStatus=[^\s]+;/ },

]

end

