##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AB-WEB-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "AB WEB CMS [French]"
website "http://www.aeline-informatique.com/"

# Google results as at 2011-03-13 #
# 73 for inurl:ab_fct.php?fct=

# Dorks #
dorks [
"inurl:ab_fct.php?fct="
]


# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>"inurl:ab_fct.php?fct=" },

# Maximize Link
{ :text=>'<a href="#" onclick="maximize();" class="hdp_z01_z03_l" onmouseover="ShowIB(' },

# Imprimer Link
{ :text=>'<div style="text-align: center;"><br /><br /><a href="#" onclick="imprfct();" class="main_link">[Imprimer]</a></div>' },

# Version Detection # Runs with footer
{ :version=>/&nbsp;<a href="http:\/\/www.(ab-psi.com|aeline-informatique.com)" class="bdp_z01_z02_l">[^<]+ AB WEB v. ([\d\.]+)<\/a>/, :offset=>1 },

]

end


