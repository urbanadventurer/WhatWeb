##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define do
name "BLOX"
author "Shuai Lin"
version "0.1"
description "BLOX is a CMS from townnews.com"

examples %w|
http://www.omaha.com/
http://thetandd.com/
http://www.billingsgazette.com/
|

matches [

{:regexp => /BLOX CMS version: [\d.]+/},

]

end
