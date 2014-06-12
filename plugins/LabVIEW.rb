##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LabVIEW" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "LabVIEW is a graphical programming environment used by millions of engineers and scientists to develop sophisticated measurement, test, and control systems using intuitive graphical icons and wires that resemble a flowchart. - Homepage: http://www.ni.com/labview/"

# More Info #
# http://www.ni.com/labview/whatis/
# http://sine.ni.com/np/app/flex/p/docid/nav-77/lang/en/page/technicalresources

# ShodanHQ results as at 2011-06-02 #
# 211 for LabVIEW



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^LabVIEW\/([\d\.]+)$/) } if @headers["server"] =~ /^LabVIEW\/([\d\.]+)$/

	# Return passive matches
	m
end

end

