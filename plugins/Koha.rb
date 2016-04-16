##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Koha" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Koha is an open source software library automation package (ILS)"
website "http://koha-community.org/"

# Google results as at 2011-07-27 #
# 262 for inurl:cgi-bin/koha ext:pl
#  57 for intitle:"Log in to Koha" +Password

# Dorks #
dorks [
'intitle:"Log in to Koha" "Password"',
'inurl:cgi-bin/koha ext:pl'
]



# Matches #
matches [

# Aggressive # favicon.ico
{ :md5=>"0c240ea1e838d2b398f48122924bf7a0", :url=>"/opac-tmpl/prog/en/includes/favicon.ico" },
{ :md5=>"0c240ea1e838d2b398f48122924bf7a0", :url=>"/intranet-tmpl/prog/en/includes/favicon.ico" },

# favicon.ico HTML
{ :regexp=>/<link rel="shortcut icon" href="\/(intranet|opac)-tmpl\/[^\/]+\/[a-z]{2}\/includes\/favicon\.ico" type="image\/x-icon" \/>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Koha ([^\s^"]+)" \/>/ },

# input name="koha_login_context"
{ :regexp=>/<input type="hidden" name="koha_login_context" value="(opac|intranet)" \/>/ },

# CSS
{ :text=>'<link rel="stylesheet" type="text/css" href="/intranet-tmpl/prog/en/lib/jquery/plugins/ui.tabs.css" />' },
{ :text=>'<link rel="stylesheet" type="text/css" href="/opac-tmpl/prog/en/lib/jquery/plugins/ui.tabs.css" />' },

# Admin Page
{ :text=>'<li><a href="/cgi-bin/koha/lostpassword.pl" title="Password Lost and Found">Lost your password?</a></li>' },

# Admin Page # HTML Comment
{ :certainty=>25, :text=>'<!-- login prompt time-->' },

# Admin Page # You are not logged in
{ :text=>'<div id="help"><span class="loggedin">You are not logged in | </span><a href="/cgi-bin/koha/help.pl" onclick="Help(); return false;">[ ? ]</a></div>' },

]

end

