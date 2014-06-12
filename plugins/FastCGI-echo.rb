##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FastCGI-echo" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-10
version "0.1"
description "Many Oracle web server installations have a fcgi-bin/echo script left over from default demo (google for inurl:fcgi-bin/echo). This file should have been removed as per: http://download.oracle.com/docs/cd/B14099_19/core.1012/b13999/checklist.htm#BABIBCIC"
# Vulnerable to XSS: /fcgi-bin/echo?<script>alert(1)</script>

# Google results as at 2010-10-10 #
# 247 for inurl:fcgi-bin/echo intitle:"FastCGI echo"
# 53  for inurl:fcgi-bin/echo intitle:"FastCGI echo" inurl:.gov
# 46  for inurl:fcgi-bin/echo intitle:"FastCGI echo" inurl:.edu

# Dorks #
dorks [
'inurl:fcgi-bin/echo intitle:"FastCGI echo"'
]



matches [

{ :text=>'SCRIPT_NAME=/fcgi-bin/echo' },
{ :text=>'<title>FastCGI echo</title><h1>FastCGI echo</h1>' },
{ :text=>'REQUEST_URI=/fcgi-bin/echo' },

# Version detection
{ :version=>/HTTP_ORACLE_CACHE_VERSION=([\d\.]+)/ },
{ :version=>/SERVER_SOFTWARE=([^\n]+)/ },
{ :version=>/SERVER_SIGNATURE=<ADDRESS>([^<]+)/ },

]

end

