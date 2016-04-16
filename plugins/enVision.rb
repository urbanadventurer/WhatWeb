##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "enVision" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-24
version "0.1"
description "Content Interface Corp enVision - interactive WYSIWYG layout editor"
website "http://www.contentinterface.com/index.php?option=com_content&task=view&id=14&Itemid=26"

# ShodanHQ results as at 2012-03-24 #
# 5 for Content Interface Corp enVision



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Content Interface Corp - enVision ([^\s]+)/ },

]

end

