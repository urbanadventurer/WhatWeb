##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ActiveX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.1"
description "ActiveX is a framework for defining reusable software components in a programming language independent way. - More info: http://en.wikipedia.org/wiki/ActiveX"

# Examples #
examples %w|
drthorup.com
www.keepthefaithministries.org/contact_us.htm
teacher.tnherbert.com
|

# Matches #
matches [

# Extract object clsid
{ :string=>/<object [^>]*classid=["'](clsid:[\s]*[a-f\d\-]+)['"]/i },

]

end


