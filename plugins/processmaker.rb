##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ProcessMaker" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-23
version "0.1"
description "ProcessMaker - Open source web based workflow software and Business Process Management software."
website "http://www.processmaker.com/"

# Google results as at 2012-06-23 #
# 49 for "User" "Password" "Language" "System Information" "Colosa, Inc. All rights reserved."

# Dorks #
dorks [
'"User" "Password" "Language" "System Information" "Colosa, Inc. All rights reserved."'
]



# Matches #
matches [

# Footer # Version Detection
{ :version=>/<div class="x-pm-footer-text">\s+ProcessMaker Ver\. ([^\s]+)<br\/>/ },

# Logo HTML
{ :text=>'<div class="companyLogo"><img src="/images/processmaker2.logo2.png"/></div>' },

# Powered by link
{ :text=>'<a href="http://www.processmaker.com" alt="Powered by ProcessMaker - Open Source Workflow & Business Process Management (BPM) Management Software" title="Powered by ProcessMaker" target="_blank">' },

# Copyright Footer
{ :text=>'<div class="content"><a href="#" onclick="openInfoPanel();return false;" class="FooterLink">| System Information |</a><br /><br />Copyright &copy; 2003-2012 <a href="http://www.colosa.com" alt="Colosa, Inc." target="_blank">Colosa, Inc.</a> All rights reserved.' },

# Redirect Page
{ :text=>'<meta http-equiv="REFRESH" content="0;URL=/sys/en/classic/login/login.html" />' },

]

end

