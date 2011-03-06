##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
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
version "0.5"
description "Mambo CMS (http://mambo-foundation.org)"

# Google results as at 2011-03-06 #
# 3,420,000 results for "powered by mambo" inurl:option=com_content

# Examples #
examples %w|http://historycouncilvic.org.au/ http://www.turksandcaicosproperty.com/ http://www.moneydepot.com.au/md/  http://www.fuzzytoad.com/mambo/ http://www.ultimatescrapbooksite.com/ http://wreathsbydesign.com/portal/ http://www.xpec.co.uk/|

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

# Module Detection
{ :module=>/<a href="[^"]*index.php\?option=(com_[^&^"]+)/, :regexp_offset=>0, :certainty=>25 },

]

# Passive #
def passive
	m=[]

	# HTML Comment # Seconds since epoch # joomla 1.0 + mambo have this
	if @body.scan(/<\/html>.*(\n)*<!-- [0-9]+.*-->(\n)*\z/) and !@body.scan(/joomla/i)
		m << {:name=>"seconds since epoch in html comment afer </html>",:certainty=>25}
	end

	# mosvisitor cookie
	m << {:name=>"mosvisitor cookie" } if @meta["set-cookie"] =~ /mosvisitor=[0-9]+/ 

	# Return passive matches
	m
end


# identifying strings
# <meta name="Generator" content="Mambo - Copyright 2000 - 2005 Miro International Pty Ltd.  All rights reserved." />
#
# mambo.css
#
# can also identify default installs from favicon
#
# at the end of the page it's got hte seconds since epoch - gives away the unix time
# </html><!-- 1242913058 -->
# </html>
#<!-- 1242913053 -->
# </html><!-- 1242913087 -->
# <!-- 1242913070  option:com_frontpage -->

# sometimes -- Set-Cookie: mosvisitor=1
# sometimes -- Expires: Mon, 26 Jul 1997 05:00:00 GMT

# to be sure, go to /administrator

end


