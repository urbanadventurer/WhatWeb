##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-31 #
# Updated regex
##
Plugin.define "iLO" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.2"
description "Integrated Lights-Out, or iLO, is an embedded server management technology exclusive to Hewlett-Packard but similar in functionality to the Lights out management (LOM) technology of other vendors."
website "http://en.wikipedia.org/wiki/HP_Integrated_Lights-Out"

# Google results as at 2011-03-31 #
# 75 for "select 'Yes' to accept the certificate to access Integrated Lights-Out."

# Dorks #
dorks [
'"select \'Yes\' to accept the certificate to access Integrated Lights-Out."'
]



# Matches #
matches [

# Derivative work text
{ :text=>'Derivative Work - 1996, 1998-2000 Copyright 1996, 1998-2000 The Regents of the University of California<br>' },

# Default title
{ :regexp=>/<title>[\s]+HP Integrated Lights-Out( [\d])?[\s]+<\/title>/ },

# Default HP logo HTML
{ :text=>'<a href="http://www.hp.com/servers/lights-out" target="new"><IMG height=60 src="ilo.gif" width=150 border=0 alt="Integrated Lights-Out"></a>' },

# Default JavaScript
{ :text=>'document.title="Integrated Lights Out: "+serverName;' },

# Version 2.x # Default HP logo HTML
{ :text=>'<a href="http://www.hp.com/go/ilo" target="new"><IMG src="iLO2_blue.jpg" height=57 border=0 alt="Integrated Lights-Out"></a>', :version=>"2.x" },

# Version Detection # Copyright footer and HTML comment
{ :version=>/(\*|&copy;)[\s]{1,2}Copyright 2002,[\s]?([\d]{4}) Hewlett-Packard Development Company, L\.P\./, :offset=>1 },

# Version Detection # Copyright footer and HTML comment
{ :version=>/(\*|&copy;)[\s]{1,2}Copyright ([\d]{4}) Hewlett-Packard Development Company, L\.P\./, :offset=>1 },

# Version 2.x # Default JavaScript
{ :text=>'document.title="Integrated Lights Out 2: "+serverName;', :version=>"2.x" },

]

# Passive #
def passive
	m=[]

	# Get server nic name # JavaScript
	if @body =~ /document\.title="Integrated Lights Out( [\d])?: "/
		m << { :string=>@body.scan(/^nicName="([^"^\s]+)";/) } if @body =~ /^nicName="([^"^\s]+)";/
	end

	# Return passive matches
	m
end

end

