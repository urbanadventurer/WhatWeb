##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Veo-Observer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "Web interface for discontinued network cameras from Veo"

# About 50 SHODAN results for Server:"Observer XT (c) Veo" @ 2010-07-18
# 2 Google results for "JPEG refresh mode" "Live Image" +intitle:"Live Image" @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1783
# 5 Google results for intitle:"Veo Observer Web Client" @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1348


matches [

{ :text=>'<title>Veo Observer XT</title>', :version=>"XT" },
{ :text=>'  <frame src="/en/sitemonitor.html" name="sitecheck" scrolling="NO" noresize>', :version=>"XT" },

{ :text=>'		<title>Veo Observer Web Client</title>', :version=>"XNC" },
{ :text=>'		<object classid="clsid:0957C19A-D854-482A-A4F9-18856C723D7D" id="VeoNetCamAcx" width="0" height="0" codebase="XNC600NetCam.cab#version', :version=>"XNC" },

]


end

