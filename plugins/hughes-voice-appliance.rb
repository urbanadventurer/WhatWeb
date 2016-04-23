##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Hughes-Voice-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-11-11
version "0.1"
description "Hughes VoIP Appliance for HughesNet integration"
website "http://www.hughes.com/"



# Matches #
matches [

# / # Redirect Page
{ :text=>'<HTML><HEAD></HEAD><BODY onload="window.location=\'/fs/home.htm\'"></BODY></HTML>' },

# /fs/home.htm # Frameset # Title
{ :text=>'<head><title>HughesNet Appliance Control Center</title></head>' },

# /systeminfo/ # Software Version Detection
{ :url=>"/systeminfo/", :version=>/<td width='50%'>Main\.bin Version<\/td><td width='50%' align='center'>([^<^\s]+)<\/td>/ },

]

end

