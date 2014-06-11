##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SHOUTcast-Administrator" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-03
version "0.1"
description "homepage: http://www.shoutcast.com/"


matches [

# about 27,000 results for intitle:"SHOUTcast Administrator" @ 2010-07-02
{:text=>'<title>SHOUTcast Administrator</title>' },

{:regexp=>/<tr><td><font class=ltv>Written by Stephen 'Tag Loomis, Tom Pepper and Justin Frankel<\/font><\/td><\/tr><\/table><\/td><\/tr><tr><td nowrap colspan=5 align=center><font class=ST><b><a href="http:\/\/www.shoutcast.com\/disclaimer.phtml">Copyright Nullsoft Inc<\/a>[<a href="\/llamacookie">.<\/a>]* 1998-[0-9]{4}<\/b><\/font><\/td><\/tr><\/table><\/font><\/body><\/html>/ },

]

def passive
        m=[]

        if @body =~ /<tr><td height=14 align=right><font class=ltv><a id=ltv href="http:\/\/www.shoutcast.com\/">SHOUTcast Server Version [0-9a-zA-Z\-\.\/\\_]+<\/a><\/font><\/td><\/tr>/
                version=@body.scan(/<tr><td height=14 align=right><font class=ltv><a id=ltv href="http:\/\/www.shoutcast.com\/">SHOUTcast Server Version ([0-9a-zA-Z\-\.\/\\_]+)<\/a><\/font><\/td><\/tr>/)[0][0]
                m << {:version=>version}
        end

        m

end

end

