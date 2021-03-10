##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Python"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-26
  "Andrew Horton", # v0.2 # 2021-02-28 # Added File Extension, convereted passive block to matches array
]
version "0.2"
description "Python is a programming language that lets you work more quickly and integrate your systems more effectively. You can learn to use Python and see almost immediate gains in productivity and lower maintenance costs."
website "http://www.python.org/"

# About 170076 ShodanHQ results for "server: python" @ 2010-10-26

# Matches #
matches [
	
	# Server # Version Detection
	{ :name=>"# Server # Version Detection", :search=>"headers[server]", :version => /[^\r^\n]* Python\/([^\s^\r^\n]+)/},

	# File Extension
	{ :name=>"File extension", :regexp=>/^(py|pyc|py3|pyo|pyw|pyx|pyd|pxd|pyi|pyz|pywz|rpy|pyde|pyp|pyt|xpy|ipynb)$/, :search=>"uri.extension" },
]

end

