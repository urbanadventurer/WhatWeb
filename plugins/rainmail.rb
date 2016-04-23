##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Rainmail" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-27
version "0.1"
description "Rainmail Intranet Server is integrated software for providing complete Intranet and Network Infrastructure to enterprises."
website "http://www.carizen.com/carizen/index.php?task=ris"

# Google results as at 2011-09-27 #
# 24 for intitle:"Rainmail Intranet Page"

# Dorks #
dorks [
'intitle:"Rainmail Intranet Page"'
]



# Matches #
matches [

# form
{ :certainty=>25, :text=>"<form action='/cgi-bin/openwebmail/openwebmail.pl'" },

# HTML Comment
{ :certainty=>75, :text=>'<!--  SCRIPT CONFIGURATION SECTION -->' },

# Rainmail is a product of
{ :text=>'<TD width=50%><font color="ffffff" size="1"face="Verdana, Helvetica">Rainmail is a product of :</font>' },

# Rainmail Intranet Login heading
{ :text=>'<div align="center">.: <b>Rainmail Intranet Login </b> :.</div>' },

# /chpasswd.php
{ :url=>'/chpasswd.php', :text=>'<TD><font color="ffffff" size="1"face="Verdana, Arial, Helvetica, sans-serif">Rainmail is a product of :</font></TD>' },


]

end

