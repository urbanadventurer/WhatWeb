##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 & :name

Plugin.define "WebGuard" do
author "Andrew Horton"
version "0.2"
description "Security surveillance  Homepage: http://novuscctv.com/"
examples %w| 124.198.140.159 144.131.54.78 www.dvronline.net |

# product is: © NOVUS Security
# NV-DVR5816/DVD

# <title>WebGuard Login</title>
# newWindow = window.open(addr + '.htm', 'WEBGUARD', 'width=1000,
# watchPort = 8016;


matches [
{:text=>'<title>WebGuard Login</title>' },
{:certainty=>75, :text=>'watchPort = 8016;' },
{:certainty=>75, :text=>"newWindow = window.open(addr + '.htm', 'WEBGUARD', 'width=1000" }

]

end


