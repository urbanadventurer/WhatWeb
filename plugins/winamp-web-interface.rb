##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Winamp-Web-Interface" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-02
version "0.1"
description "web interface for winamp mp3 player - homepage: http://www.winamp.com/"
examples %w|
radio.hfqradio.com
everquest.ita.chalmers.se
|

matches [

# 5 results @ 2010-07-02
{:ghdb=>'"About Winamp Web Interface" intitle:"Winamp Web Interface"', :certainty=>75 },

{:text=>'<noframes><p><b>Frames are required for this site!<b></p><p>If no-frames operation is required, check the <b>No Frames Mode</b> box in the Options screen.</p>' }

]

def passive
        m=[]

        if @body =~ /<a href="JavaScript:about\(\)">About Winamp Web Interface v[\.\d]+<\/a><\/h6><hr>/
                version=@body.scan(/<a href="JavaScript:about\(\)">About Winamp Web Interface v([\.\d]+)<\/a><\/h6><hr>/)[0][0]
                m << {:version=>version}
        end

        m
end


end

