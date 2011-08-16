##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ActiveX-CLSID" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.1"
description "ActiveX is a framework based on Microsoft's Component Object Model (COM) and Object Linking and Embedding (OLE) technologies. ActiveX components officially operate only with Microsoft's Internet Explorer web browser and the Microsoft Windows operating system. - More info: http://en.wikipedia.org/wiki/ActiveX"

# Examples #
examples %w|
drthorup.com
www.keepthefaithministries.org/contact_us.htm
teacher.tnherbert.com
www.ususbdc.org
|

# Matches #
matches [

# Extract object clsid
{ :string=>/<object [^>]*classid=["'](clsid:[\s]*[a-f\d\-]+)['"]/i },

]

end


