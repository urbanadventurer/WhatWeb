##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Support-Incident-Tracker" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "Support Incident Tracker (or SiT!) is a Free Software/Open Source (GPL) web based application which uses PHP and MySQL for tracking technical support calls/emails (also commonly known as a 'Help Desk' or 'Support Ticket System') - Homepage: http://sitracker.org/"

# ShodanHQ results as at 2011-07-27 #
# 14 for SiTsessionID

# Google results as at 2011-07-27 #
# 27 for "SiT! - Login" "Username" "Password" "Forgotten your details"

# Dorks #
dorks [
'"SiT! - Login" "Username" "Password" "Forgotten your details"'
]

# Examples #
examples %w|
demo.sitracker.org
190.144.109.26
216.252.70.78
200.72.17.58
216.177.9.3
81.252.137.37
www.ermesconsulting.com/sit/
www.repostor.com/sit-3.63/
clearcasecomputers.com/sit/htdocs/index.php
www.insight-ict.co.uk/helpdesk/
www.spocsys-server4.info/sit-3.60/
support.sfraser.net
support.shadowsystems.com.au/
www.videoezy.co.th/sit/
support.newporthigh.co.uk/
chimpleit.com/sit350/
www.econtact.co.za/support/
sit.flipmode.dk
|

# Matches #
matches [

# Heading
{ :text=>"<div id='masthead'><h1 id='apptitle'><span>SiT! Support Incident Tracker</span></h1></div>" },

# Version Detection # Meta Generator
{ :version=>/<meta name="GENERATOR" content="SiT! Support Incident Tracker v([^"]+)" \/>/ },

# Heading
{ :text=>"<div class='windowtitle'>SiT! - Login</div>" },

]

# Passive #
def passive
	m=[]

	# HTML Comment # Copyright Notice
	if @body =~ /<!-- SiT \(Support Incident Tracker\) - Support call tracking system[\s]+Copyright \(C\) (20[\d]{2}-)?(20[\d]{2}) (The Support Incident Tracker Project|Salford Software Ltd\. and Contributors)/

		# Year Detection # HTML Comment # Copyright Notice
		m << { :string=>@body.scan(/<!-- SiT \(Support Incident Tracker\) - Support call tracking system[\s]+Copyright \(C\) (20[\d]{2}-)?(20[\d]{2}) (The Support Incident Tracker Project|Salford Software Ltd\. and Contributors)/)[0][1] }

		# Version Detection # Meta Generator
		m << { :version=>@body.scan(/<meta name="GENERATOR" content="[^"]+ v([^"]+)" \/>/) } if @body =~ /<meta name="GENERATOR" content="[^"]+ v([^"]+)" \/>/

	end

	# SiTsessionID Cookie
	m << { :name=>"SiTsessionID Cookie" } if @meta["set-cookie"] =~ /SiTsessionID=[^;^\s]+/

	# Return passive matches
	m
end
end

