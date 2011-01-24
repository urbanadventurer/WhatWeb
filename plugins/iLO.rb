##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iLO" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "Integrated Lights-Out, or iLO, is an embedded server management technology exclusive to Hewlett-Packard but similar in functionality to the Lights out management (LOM) technology of other vendors. - homepage: http://en.wikipedia.org/wiki/HP_Integrated_Lights-Out"

# 2 results for intitle:"HP Integrated Lights-Out" "Note: When the 'Security Alert' panel is displed, you must select 'Yes' to accept the certificate to access Integrated Lights-Out." @ 2010-10-15
examples %w|
vmhost1.ilo.vpsnode.net
ukpip.com
|

matches [

# Derivative work text
{ :text=>'Derivative Work - 1996, 1998-2000 Copyright 1996, 1998-2000 The Regents of the University of California<br>' },

# Version < 2.0 # Default copyright text
{ :text=>'&copy; Copyright 2008 Hewlett-Packard Development Company, L.P.<br>', :version=>"< 2.0" },

# Version < 2.0 # Default HTML comment
{ :text=>'*  Copyright 2002,2005 Hewlett-Packard Development Company, L.P.', :version=>"< 2.0" },

# Default title
{ :regexp=>/<title>[^HP]+HP Integrated Lights-Out[^<]+<\/<title>/ },

# Default HP logo HTML
{ :text=>'<a href="http://www.hp.com/servers/lights-out" target="new"><IMG height=60 src="ilo.gif" width=150 border=0 alt="Integrated Lights-Out"></a>' },

# Default JavaScript
{ :text=>'document.title="Integrated Lights Out: "+serverName;' },

# Default logo
{ :md5=>"ca4359b01fd51be95f7fafbeb98b607b", :url=>"ilo.gif" },

# Version 2.x # Copyright text
{ :text=>'&copy; Copyright 2002, 2010 Hewlett-Packard Development Company, L.P.<br>', :version=>"2.x" },

# Version 2.x # Default HP logo HTML
{ :text=>'<a href="http://www.hp.com/go/ilo" target="new"><IMG src="iLO2_blue.jpg" height=57 border=0 alt="Integrated Lights-Out"></a>', :version=>"2.x" },

# Version 2.x # Default HTML comment
{ :text=>'*  Copyright 2002, 2009 Hewlett-Packard Development Company, L.P.', :version=>"2.x" },

# Version 2.x # Default JavaScript
{ :text=>'document.title="Integrated Lights Out 2: "+serverName;', :version=>"2.x" },

# Version 2.x # Default logo
{ :md5=>"f5e2b9db23986b014cf265923a052cc4", :url=>"iLO2_blue.jpg", :version=>"2.x" },

# Version 2.x # Default title
{ :regexp=>/<title>[^HP]+HP Integrated Lights-Out 2[^<]+<\/title>/,:version=>"2.x" },

]

# Get server nic name
def passive
	m=[]

	if @body =~ /document.title="Integrated Lights Out: "/ or @body =~ /document.title="Integrated Lights Out 2: "/

		if @body =~ /^nicName="([^\"]+)";/
			modules=@body.scan(/^nicName="([^\"]+)";/)
			m << {:module=>modules}
		end

	end

	m

end

end

