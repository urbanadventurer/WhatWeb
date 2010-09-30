##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :certainty, end at an optional ?, return the email address as a :string
# Version 0.3
# added \' to regex

Plugin.define "Mailto" do
author "Andrew Horton"
version "0.2"
description "email addresses in mailto: links"
# identifying strings
# mailto: email@address

def passive
	m=[]
	emails=@body.scan(/mailto:([^\'\"\?]+)/)
	if emails.size > 0
		match=true
		emails.flatten!
		emails.map! {|e| CGI.unescapeHTML(e)  }
		emails.map! {|e| CGI.unescape(e)  }
		m << {:name=>"mailto:",:string=>emails}
	end

	m		
end

end




