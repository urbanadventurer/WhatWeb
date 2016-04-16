##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CoDeSys-Web-Visualization" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-20
version "0.1"
description "CoDeSys can create XML descriptions of the visualization objects and download them to the PLC. There a Web-Server will provide the PLC data in XML format too and thus can create a continuously updated visualization which can be opened in the Web Browser of any computer which is connected via Internet, independently from the target platform (e.g. useful for remote maintenance purposes)."
website "http://www.3s-software.com/index.shtml?en_CoDeSys_WebVisu"

# ShodanHQ results as at 2011-06-20 #
# 90 for PLC -SoftPLC webvisu

# Google results as at 2011-06-20 #
# 12 for inurl:"plc/webvisu.htm" intitle:"CoDeSys WebVisualization"

# Dorks #
dorks [
'inurl:"plc/webvisu.htm" intitle:"CoDeSys WebVisualization"'
]



# Matches #
matches [

# Title
{ :text=>'<TITLE>CoDeSys WebVisualization</TITLE>' },

# Applet
{ :text=>'<APPLET CODEBASE=. CODE=webvisu/WebVisu.class name="WebVisu" width="100%" height="100%" id="webvisuapplet">' },
{ :text=>'<APPLET CODEBASE=. CODE=webvisu/WebVisu.class name="WebVisu" width="99%" height="99%" id="webvisuapplet">' },

# Applet param
{ :text=>'<param name="archive" value="webvisu.jar,minml.jar">' },

]

# Passive #
def passive
	m=[]

	# Redirect location # /plc/webvisu.htm
	if @headers["location"] =~ /\/plc\/webvisu\.htm$/
		m << { :name=>"Redirect location" }
	end

	# HTTP Server header
	if @headers["server"] =~ /^WAGO_Webs$/
		m << { :name=>"HTTP Server Header" }
	end

	# Return passive matches
	m
end

end

