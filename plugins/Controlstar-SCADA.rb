##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Controlstar-SCADA" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "Controlstar SCADA - Homepage: http://www.controlstar.com/product_scada.php"

# Examples #
examples %w|
86.159.112.158
86.186.217.18
86.135.111.21
86.153.104.34
|

# Matches #
matches [

# / # applet HTML
{ :text=>'<APPLET archive="scada.jar, toolbox.jar, batik.jar, crimson-parser.jar" code="Scada" style="position:absolute;left:0;top:0;width:expression(document.body.clientWidth);height:expression(document.body.clientHeight);" >' },

]

end

