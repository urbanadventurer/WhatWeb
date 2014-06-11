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



# Matches #
matches [
{:name=>'Set-cookie Header', :search=>"headers[set-cookie]", :regexp=>/anonprofile/i},
{:text=>'/PoweredByADX.gif'},
{:text=>'alt="Powered by Adxstudio"'},
{:text=>'/poweredbyadx.png'},
]

end
