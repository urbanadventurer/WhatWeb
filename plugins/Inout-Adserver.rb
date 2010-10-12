##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Inout-Adserver" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "Inout Adserver  is powerful, feature rich, fully customizable PayPerClick advertiser/publisher networking script from inoutscripts.com. Advertisers can register into adserver and can post their text/ banner/catalog PayPerClick(PPC) ads. - homepage: http://www.inoutscripts.com/products/adserver/"

# 154 results for "Powered by Inoutscripts" @ 2010-10-12
examples %w|
www.420ppc.com/admin/
www.420ppc.com/ppc-publisher-login.php
www.geekadz.com/admin/
www.inoutdemo.com/inout_adserver_ultimate/ppc-user-login.php
www.inoutdemo.com/inout_adserver_ultimate/ppc-publisher-login.php
www.inoutdemo.com/inout_adserver_ultimate/admin/
www.inoutdemo.com/inout_adserver_ultimate/demo-page.php
www.inoutdemo.com/inout_adserver/ppc-user-login.php
www.inoutdemo.com/inout_adserver/ppc-publisher-login.php
www.inoutdemo.com/inout_adserver/admin/
www.inoutdemo.com/inout_adserver/demo-page.php
www.ybuzzers.com/admin/
|

matches [

# Default Javascript # Certainty=>75 as this is used by other Inout scripts
{ :text=>'function trim(stringValue){return stringValue.replace(/(^\s*|\s*$)/, "");}', :certainty=>75 },

# Admin page # Default title
{ :text=>'<title>Inout Adserver - Pay Per Click Advertising Expert!</title>' },
{ :text=>'<title>Inout Search Engine Admin Login</title>' },

# Powered by text # Certainty=>75 as this is used by other Inout scripts
{ :text=>'Powered by <a href="http://www.inoutscripts.com/?r=0">Inoutscripts</a>', :certainty=>75 },

]

end

