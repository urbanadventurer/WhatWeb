##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WhiteBoard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-15
version "0.1"
description "WhiteBoard is a fast, powerful, and free open source discussion board solution. - homepage: http://sarosoftware.com/"

# 21 results for "powered by Whiteboard" @ 2010-08-15
examples %w|
community.sarosoftware.com
designbyhand.net/community/index.php
aduhaii-hp.com/forum/index.php
moresms.org/forum/index.php
|

matches [

{ :text=>'			&copy; <a href="http://www.powerwd.com">SaroSoftware</a><br />' },

]

def passive
        m=[]

        if @body =~ /Powered By WhiteBoard [\d\.]+<br \/>/
                version=@body.scan(/Powered By WhiteBoard ([\d\.]+)<br \/>/)[0][0]
                m << {:version=>version}
        end

	if @body =~ /Powered By WhiteBoard <span id="version">([\d\.]+)<\/span><br \/>/
		version=@body.scan(/Powered By WhiteBoard <span id="version">([\d\.]+)<\/span><br \/>/)[0][0]
		m << {:version=>version}
	end

        m

end


end

