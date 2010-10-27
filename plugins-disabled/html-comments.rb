##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HTML-Comments" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-20
version "0.1"
description "This plugin extracts the HTML comments from the HTML source."

examples %w|
www.morningstarsecurity.com
itsecuritysolutions.org
|

matches [

# Get HTML comments
{ :version=>/<!--([^>]+)-->/, :version_regexp_offset=>0 },

]

end

