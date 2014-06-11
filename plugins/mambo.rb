##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.6 # 2011-03-19 # Brendan Coles <bcoles@gmail.com>
# Added aggressive match for /administrator/
# Updated matches to remove false positives
##
# Version 0.5 # 2011-03-06 # Brendan Coles <bcoles@gmail.com>
# Updated module detection
##
# Version 0.4 by Andrew Horton
# added matches suggested by Aung Khant including 'meta name="description' and /<a href="[^"]*index.php\?option=com_/ from the Joomla plugin
##
# Version 0.3
# Andrew Horton added examples, changed time since epoch match for less false positives with Joomla, added mosvisitor cookie match
# Aung Khant(http://yehg.net) added description, README.php match, Mambo Admin match
##
# Version 0.2
# removed :name & :certainty
##
Plugin.define "Mambo" do
author "Andrew Horton"
version "0.6"
description "Mambo CMS (http://mambo-foundation.org)"

# Google results as at 2011-03-06 #
# 3,420,000 results for "powered by mambo" inurl:option=com_content



# Matches #
matches [

# Meta Generator
{:regexp=>/<meta name="Generator" content="Mambo - Copyright 2000 - [0-9]+ Miro International Pty Ltd.  All rights reserved." \/>/},

# Meta Description
{:regexp=>/<meta name="description" content="Mambo - the dynamic portal engine and content management system" \/>/},

# README.php
{:url=>'README.php', :text=>'Mambo is OSI Certified Open Source Software, released under the GNU General Public License' },

# administrator/templates/mambo_admin/templateDetails.xml
{:url=>'administrator/templates/mambo_admin/templateDetails.xml', :regexp=> /(<name>Mambo Admin<\/name>|<authorUrl>http:\/\/www\.mambo\-foundation\.org<\/authorUrl>)/ },

]

# Passive #
def passive
	m=[]

	# /administrator/ # Confirm the presence of Mambo with 100% certainty
	if @base_uri.path =~ /\/administrator\// and (@body =~ /<div id="mambo"><img src="[^"]*\/images\/header_text.png" alt="Mambo Logo" \/><\/div>/ or @body =~ /<a href="http:\/\/mambo-foundation.org">Mambo<\/a> is Free Software released under the GNU\/GPL License.<\/div>/ or @body =~ /<title>[^<]+ Administration \[Mambo( Open Source)?\]<\/title>/)
		m << { :name=>"Mambo Administration Page" }
	end

	# HTML Comment # seconds since epoch # Also used by joomla
	if @body =~ /<\/html>.*(\n)*<!-- [0-9]+.*-->(\n)*\z/ and @body !~ /joomla/i
		m << {:name=>"seconds since epoch in html comment after </html>",:certainty=>25}
	end

	# Module Detection # Doesn't work in SEO mode # Also used by joomla
	if @body =~ /<a href="[^"]*index.php\?option=(com_[^&^"]+)/

		# Absolute URL
		m << { :certainty=>75, :module=>@body.scan(/<a href="https?:\/\/#{Regexp.escape(@base_uri.host)}[^"]*index.php\?option=(com_[^&^"]+)/) } if @body =~ /<a href="https?:\/\/#{Regexp.escape(@base_uri.host)}[^"]*index.php\?option=(com_[^&^"]+)/

		# Relative URL
		m << { :certainty=>75, :module=>@body.scan(/<a href="[^"^:]*index.php\?option=(com_[^&^"]+)/) } if @body =~ /<a href="[^"^:]*index.php\?option=(com_[^&^"]+)/

	end

	# mosvisitor cookie # Also used by joomla
	m << { :certainty=>75, :name=>"mosvisitor cookie" } if @headers["set-cookie"] =~ /mosvisitor=[0-9]+/ 

	# Return passive matches
	m
end

# Aggressive #
def aggressive
	m=[]

	# Open base_uri + /administrator/
	status,url,ip,body,headers=open_target(@base_uri.to_s+"/administrator/")

	# Confirm the presence of Mambo with 100% certainty
	if (body =~ /<div id="mambo"><img src="[^"]*\/images\/header_text.png" alt="Mambo Logo" \/><\/div>/ or body =~ /<a href="http:\/\/mambo-foundation.org">Mambo<\/a> is Free Software released under the GNU\/GPL License.<\/div>/ or body =~ /<title>[^<]+ Administration \[Mambo( Open Source)?\]<\/title>/)
		m << { :name=>"Mambo Administration Page" }
	end

	# Return aggressive matches
	m
end

end

