##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ORCA-Platform" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-04
version "0.1"
description "Welcome to ORCA Websites... We specialise in designing Professional & Affordable Websites for small to medium sized businesses across the UK."
website "http://www.orcawebsites.com/"

# 311 results for "powered by Orca Websites" @ 2010-08-04

# Dorks #
dorks [
'"powered by Orca Websites"'
]



matches [

{ :text=>'    <meta name="author" content="ORCA Websites"/>' },
{ :text=>'    <meta name="generator" content="ORCA Platform - http://www.orcawebsites.com"/>' },
{ :text=>'<a href="http://www.orcawebsites.com/" title="Powered By ORCA Websites">Powered By ORCA Websites</a>' },
{ :text=>'                <p class="orca">Powered By <a href="http://www.orcawebsites.com/" title="ORCA Websites">ORCA Websites</a></p>' },
{ :text=>'    <!-- Macro Initialisation - Don\'t Touch! -->' },

]

end

