##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :name & :certainty

Plugin.define "Mambo" do
author "Andrew Horton"
version "0.2"
description "CMS Mambo.org"

matches [
{:regexp=>/<meta name="Generator" content="Mambo - Copyright 2000 - [0-9]+ Miro International Pty Ltd.  All rights reserved." \/>/},

{:name=>"seconds since epoch in html comment afer </html>",
:certainty=>25, # joomla 1.0 + mambo have this
:regexp=>/<\/html>.*(\n)*<!-- [0-9]+.*-->(\n)*\z/}

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


