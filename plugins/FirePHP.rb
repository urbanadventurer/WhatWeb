##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FirePHP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-15
version "0.1"
description "FirePHP enables you to log to your Firebug Console using a simple PHP method call. FirePHP works by sending JSON encoded debug data in the response headers instead of the page content."
website "http://www.firephp.org/"

# ShodanHQ results as at 2011-09-15 #
# 17 for X-Wf-Protocol
# 16 for x-wf-1-plugin
# 15 for x-wf-1-structure
# 14 for X-Wf-1-1-1



# Matches #
matches [

# FirePHPCore # Version Detection # X-Wf-1-Plugin-1
{ :search=>"headers[x-wf-1-plugin-1]", :version=>/^http:\/\/meta\.firephp\.org\/Wildfire\/Plugin\/FirePHP\/Library-FirePHPCore\/([^\s]+)$/ },

# FirebugConsole # Version Detection # X-Wf-1-Structure-1
{ :search=>"headers[x-wf-1-structure-1]", :string=>/^http:\/\/meta\.firephp\.org\/Wildfire\/Structure\/FirePHP\/(FirebugConsole\/[^\s]+)$/ },

# X-Wf-Protocol
{ :search=>"headers[x-wf-protocol-1]", :regexp=>/^http:\/\/meta\.wildfirehq\.org\/Protocol\// },

]

end

