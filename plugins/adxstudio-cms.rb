##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "adxstudio-cms" do
author "Aung Khant <http://yehg.net/>" # 2012-02-12
version "0.1"
description "ADXStudio CMS - http://www.adxstudio.com"

# Examples #
examples %w|
http://www.shanmcarthur.net/
http://www.gpug.com/
http://www.microsoftexecexchange.com/
http://170.213.238.160/
http://173.8.112.169/
http://170.213.238.155/
http://27.32.253.126/
http://64.197.9.207/
http://170.213.238.162/
|

# Matches #
matches [
{:name=>'Set-cookie Header', :search=>"headers[set-cookie]", :regexp=>/anonprofile/i},
{:text=>'/PoweredByADX.gif'},
{:text=>'alt="Powered by Adxstudio"'},
{:text=>'/poweredbyadx.png'},
]

end
