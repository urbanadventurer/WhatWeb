##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kibana" do
author "Brendan Coles <bcoles@gmail.com>" # 2015-04-26
version "0.1"
description "Kibana is an open source data visualization platform that allows you to interact with your data - Homepage: https://www.elastic.co/products/kibana"

# Default Port: 5601


# Matches #
matches [

# HTTP X-App-Name Header
{ :search=>"headers[x-app-name]", :regexp=>/^kibana$/ },

# Body tag
{ :text=>'<body kibana ng-class' },

# Version Detection
{ :version=>/<script>\s+window\.KIBANA_VERSION='([\d\.]+)';\s+window\.KIBANA_BUILD_NUM='[\d]+';/ },

]

end

