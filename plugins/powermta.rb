##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PowerMTA" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-14
version "0.1"
description "PowerMTA - email gateway software (SMTP server) that makes it easy for senders to adopt the latest authentication specifications (SenderID, SPF, Domain Keys and DKIM) and comply with policies for accountable outbound email delivery."
website "http://www.port25.com/"

# ShodanHQ results as at 2011-09-14 #
# 4 for PowerMTA



# Matches #
matches [

# @body
{ :status=>403, :text=>"<html><body>Access denied.  Please consult the http-access directive in the User's Guide for more information.</body></html>" },

# WWW-Authenticate: Basic realm="PowerMTA" 
{ :certainty=>25, :search=>"headers[www-authenticate]", :regexp=>/^Basic realm="PowerMTA"$/ },

]

end

