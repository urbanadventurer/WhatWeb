##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Lasso-Web-Data-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-04
version "0.1"
description "Lasso Web Data Engine is a cross-platform Web Application Server"
website "http://www.blueworld.com/blueworld/products/"

# ShodanHQ results as at 2011-09-04 #
# 619 for Lasso

# Google results as at 2011-09-04 #
# 447 for ext:lasso

# Dorks #
dorks [
'ext:lasso'
]



# Matches #
matches [

# GHDB # File extension
{ :certainty=>25, :ghdb=>"filetype:lasso" },

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/Lasso\/([^\s]+)/ },

]

end

