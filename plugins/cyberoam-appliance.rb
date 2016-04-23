##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cyberoam-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-09
version "0.1"
description "Cyberoam UTM appliances integrate multiple security features like Firewall, VPN, Intrusion Prevention System, Anti-Virus & Anti-Spyware, Anti-Spam, Web Filtering, Layer 7 Visibility & Control, Bandwidth Management, Multiple Link Management, and more on a single platform."
website "http://www.cyberoam.com/"

# Google results as at 2012-02-09 #
# 45 for "To use cyberoam console , enable JavaScript by changing your browser options."
#  6 for intitle:"Cyberoam - Please Login" "Username" "Password" "Login"

# Dorks #
dorks [
'"To use cyberoam console , enable JavaScript by changing your browser options."'
]



# Matches #
matches [

# /images/loginbox_left_logo.jpg
{ :url=>"/images/loginbox_left_logo.jpg", :md5=>"ecb82a4554f2ef5eefd06040cdae9872" },

# /images/session_ex.jpg
{ :url=>"/images/session_ex.jpg", :md5=>"7241a011a6057cdb723eccbf178b0e3a" },

# /corporate/webpages/sessionexpired.jsp # Version Detection
{ :url=>"/corporate/webpages/sessionexpired.jsp", :version=>/<font face="arial" size=2 color=white>([^<]+ build [^<]+)<\/font>/ },

# Login Page # Log on to
{ :text=>'<td align="right" class="arial12whitebold">Log on to:&nbsp; </td>' },

# Login Page # input NAME="js_autodetect_results"
{ :text=>'<INPUT TYPE=HIDDEN NAME="js_autodetect_results" VALUE="SMPREF_JS_OFF">' },

# Login page # noscript
{ :text=>'<noscript><font class="arial12whitebold">JavaScript must be enabled in order for you to use cyberoam admin console.</font></noscript><br>' },

# HTML Comment
{ :text=>'<!-- PUT THE LOGIC OF YOUR PAGE HERE -->' },

]

end

