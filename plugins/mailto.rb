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
# Version 0.4
# Updated regex, added > and comments
# Version 0.5
# find all email addresses, return only unique addresses, rename to email

Plugin.define "Email" do
author "Andrew Horton"
version "0.5"
description "Extract email addresses. Find valid email address and syntactically invalid email addresses from mailto: link tags. We match syntactically invalid links containing mailto: to catch anti-spam email addresses, eg. bob at gmail.com. This uses the simplified email regular expression from http://www.regular-expressions.info/email.html for valid email address matching."

# identifying strings
# mailto: email@address
# A regex for valid email addresses is not included so that anti-spam email addresses can be returned, eg bob at gmail dot com.

def passive
	m=[]
	emails=@body.scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i) # valid email address in the page
	emails += @body.scan(/<[^>]+href=[^>]*mailto:([^\'\"\?>]+)[^>]*>/) # any emial address in a mailto: tag
	unless emails.empty?
		emails.flatten!
		emails.map! {|e| CGI.unescapeHTML(e)  }
		emails.map! {|e| CGI.unescape(e)  }
		emails.map! {|e| e.strip }
		emails.sort!.uniq!
		m << {:string=>emails}
	end
	m		
end

end

