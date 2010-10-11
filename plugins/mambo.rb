##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.3 - Aung Khant(http://yehg.net)
# added two aggressive check url - README.php, administrator 
# added certainty 100 to avoid overlapping with Joomla

Plugin.define "Mambo" do
author "Andrew Horton"
version "0.3"
description "Mambo CMS (http://mambo-foundation.org)"

examples=%w|
http://mamboserver.com/
|	


matches [
{:name=>'Metatag', :regexp=>/<meta name="Generator" content="Mambo - Copyright 2000 - [0-9]+ Miro International Pty Ltd.  All rights reserved." \/>/, :certain=>100},
{:name=>'Metatag', :regexp=>/<meta name="description" content="Mambo - the dynamic portal engine and content management system" \/>/,:certain=>100},
{:url=>'README.php', :text=>'Mambo is OSI Certified Open Source Software, released under the GNU General Public License', :certain=>100 },
{:url=>'administrator/templates/mambo_admin/templateDetails.xml', :regexp=> /(<name>Mambo Admin<\/name>|<authorUrl>http:\/\/www\.mambo\-foundation\.org<\/authorUrl>)/, :certain=>100},


]


# identifying strings
# <meta name="Generator" content="Mambo - Copyright 2000 - 2005 Miro International Pty Ltd.  All rights reserved." />
# <meta name="Generator" content="Mambo - Copyright 2000 - 2005 Miro International Pty Ltd.  All rights reserved." />
# 
# mambo.css
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


