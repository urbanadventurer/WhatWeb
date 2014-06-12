##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 & :name. convert :regexp to :text

Plugin.define "ToshibaPrinter" do
author "Andrew Horton"
version "0.2"
description "Toshiba printer Top Access"


# <TITLE CLASS="clsTitle1">TopAccess</title>
# Server: TOSHIBA TEC CORPORATION

matches [
{:text=>'<TITLE CLASS="clsTitle1">TopAccess</title>' }
]

end

