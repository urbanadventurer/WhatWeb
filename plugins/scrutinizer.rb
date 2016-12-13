##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Scrutinizer" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-10
version "0.1"
description "Scrutinizer NetFlow - monitoring solution"
website "http://www.plixer.com/products/netflow-sflow/scrutinizer-netflow-sflow.php"

# Google results as at 2012-07-10 #
# 1 for intitle:"Scrutinizer" "For the best Scrutinizer experience possible, please address the issues below"

# Dorks #
dorks [
'intitle:"Scrutinizer" "For the best Scrutinizer experience possible, please address the issues below"'
]



# Matches #
matches [

# div id='testAlertDivTitle' # Version Detection
{ :version=>/<div id='testAlertDivTitle'>Scrutinizer ([^<]+)<\/div>/ },

# link id='scrutStyle'
{ :regexp=>/<link id='scrutStyle' rel="stylesheet" href="\/css\/classic\.css/ },

# div id='testAlertHdrMsg'
{ :regexp=>/<div id='testAlertHdrMsg'>For the best Scrutinizer experience possible, please address the issues below:<\/div>/ },

]

end

