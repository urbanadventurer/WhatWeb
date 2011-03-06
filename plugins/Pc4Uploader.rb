##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "Pc4Uploader" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.2"
description "File upload web app - homepage: http://www.pc4arb.com/"

# Google results as at 2010-09-17 #
# 266 results for "powered by Pc4Uploader"

# Examples #
examples %w|
3yonic.net
3inain.com
5h5h.com
7eznah.net
m7li.com
hicom10.com
im2up.com
up.nqeia.com
up.mansouracity.com
up.ta7a.com
up.arjwan.com
up.mansouracity.com
ro0o.net
s4up.com
w4w5.net
wa7dani.com
x7x7x.net
www.gamr15.org
www.mlafk.com
www.q8up.com
www.zainup.com
www.dwn1.com
www.m5azn.com
www.m7li.com
www.7ww7.com
www.imslm.net
www.shy22.com
www.v5p.net
www.wa7dani.com
www.q8up.com
www.f9f9f.com/up/
www.a6iaf.net/up2/
www.600kb.com
www.wlidk.net
www.4-up.biz
www.mbc66.net/upload/
www.upoup.com
www.brg8.org
|

# Matches #
matches [

# Default javascript in version 10.x
{ :text=>'eval("page" + id + " = window.open(URL, \'" + id + "\', \'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=650,height=400,left = 199.5,top = 196.5\');");', :version=>["10.x"] },

# Version Detection # Version 9
{ :version=>/Pc4Uploader <font color="#000080"> <b>v([\d\.]+)<\/b><\/font>/ },

# Version Detection # Pro # Version 9
{ :version=>/Pc4Uploader <font color="#000080"> <b>v([\d\.]+) Pro<\/b><\/font>/, :string=>"Pro" },

# Version Detection # Powered by text
{ :version=>/<p id="legal" style="text-align: center">Powered by Pc4Uploader v<span lang="en-us">([\d\.]+)<\/span><\/p>/ },

# Version Detection # Version 10
{ :version=>/Powered by Pc4Uploader <b>v([\d\.]+)<\/b>&nbsp; Copyright <b>/ },

# Version Detection # Pro # Version 10
{ :version=>/Powered by Pc4Uploader <b>v([\d\.]+) Pro<\/b>&nbsp; Copyright <b>/, :string=>"Pro" },

]

end

