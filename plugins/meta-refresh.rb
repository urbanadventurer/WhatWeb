##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# renamed from Meta-Refresh to Meta-Refresh-Redirect
# Expanded description

Plugin.define "Meta-Refresh-Redirect" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-26
version "0.2"
description "Meta refresh tag is a deprecated URL element that can be
used to optionally wait x seconds before reloading the current page or loading a
new page. More info: https://secure.wikimedia.org/wikipedia/en/wiki/Meta_refresh"

examples %w|
www.google.com/mobile/gmail/
|

def passive
        m=[]

        if @body =~ /<meta[\s]*http\-equiv=[\"]*refresh[\"]*[^>]+content=[\"]*[0-9];[^"]+[\"]*/i
                content=@body.scan(/<meta[\s]*http\-equiv[\s]*=[\"]*refresh[\"]*[^>]+content[\s]*=[\"]*[0-9]+;([^"]+)[\"]*/i)[0][0]
                m << { :name=>"meta refresh tag", :string=>content }
	end

	m

end


end

