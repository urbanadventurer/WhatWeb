##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "LabVIEW"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-02
  "Andrew Horton", # v0.2 # 2016-04-21 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "LabVIEW is a graphical programming environment used by millions of engineers and scientists to develop sophisticated measurement, test, and control systems using intuitive graphical icons and wires that resemble a flowchart."
website "http://www.ni.com/labview/"

# More Info #
# http://www.ni.com/labview/whatis/
# http://sine.ni.com/np/app/flex/p/docid/nav-77/lang/en/page/technicalresources

# ShodanHQ results as at 2011-06-02 #
# 211 for LabVIEW

matches [

	{ :version=>/^LabVIEW\/([\d\.]+)$/, :search=>"headers[server]" },

]

end

