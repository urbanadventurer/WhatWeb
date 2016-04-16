##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DT-Centrepiece" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.1"
description "DT Centrepiece is a free open-source content management system (CMS) for commercial or personal use."
website "www.dt.net.nz/centrepiece/"

# 14 results for "powered by DT Centrepiece" @ 2010-08-06

# Dorks #
dorks [
'"powered by DT Centrepiece"'
]



matches [

{ :text=>'	<meta name="generator" content="DT Centrepiece - www.dt.net.nz/centrepiece/" />' },
{ :text=>'<a href="http://www.dt.net.nz/centrepiece/" target="_blank">Powered By DT Centrepiece</a>' },

]

end

