##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "VTS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.2"
description "VTS Server"

# 123 ShodanHQ results for Server: VTS
# 103 ShodanHQ results for Set-Cookie: VTS=


matches [

# Error Page # Default HTML
{ :status=>401, :regexp=>/<html>\r\n<head>\r\n<title>Error Message<\/title>\r\n<link rel="stylesheet" href="\/VTS.css">\r\n\r\n<\/head>\r\n<body class=error>\r\n<h1>Error Message<\/h1>\r\n<p>Error Code 401.\r\n<p>Message: Unauthorized.\r\n<p>Description: 401 = No permission -- see authorization schemes./ },

# HTTP Server Header
{ :regexp=>/VTS /, :search=>"headers[server]" },

# Version Detection # HTTP Server Header
{ :version=>/VTS ([\d\.]+)/, :search=>"headers[server]" },

# Version Detection # HTTP Set-Cookie Header
{ :version=>/^VTS=([\d\.]+)/, :search=>"headers[set-cookie]" },

]

end

