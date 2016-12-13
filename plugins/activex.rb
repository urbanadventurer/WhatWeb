##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-18 # Andrew Horton
# Replaced passive function with match for Flash-ActiveX
##
# Version 0.2 by Andrew Horton
## Updated to return the CLSID as a module. Bugfix - quotes around classid are optional
#
Plugin.define "ActiveX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.3"
description "ActiveX is a framework based on Microsoft's Component Object Model (COM) and Object Linking and Embedding (OLE) technologies. ActiveX components officially operate only with Microsoft's Internet Explorer web browser and the Microsoft Windows operating system. - More info: http://en.wikipedia.org/wiki/ActiveX"


# Matches #
matches [
	# object clsid
	{ :module=>/<object [^>]*classid=["']?clsid:([\s]*[a-f\d\-]+)['"]?/i },
	# Flash-ActiveX
	{ :string=>"Flash-ActiveX", :regexp=>/d27cdb6e-ae6d-11cf-96b8-444553540000/ }
]


end

