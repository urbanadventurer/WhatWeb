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

Plugin.define "Mailto" do
author "Andrew Horton"
version "0.4"
description "Extract email addresses from links containing mailto:"
# identifying strings
# mailto: email@address
# A regex for valid email addresses is not included so that anti-spam email addresses can be returned, eg bob at gmail dot com.

def passive
	m=[]
	emails=@body.scan(/<[^>]+href=[^>]*mailto:([^\'\"\?>]+)[^>]*>/)

	unless emails.empty?
		match=true
		emails.flatten!
		emails.map! {|e| CGI.unescapeHTML(e)  }
		emails.map! {|e| CGI.unescape(e)  }
		m << {:name=>"mailto:",:string=>emails}
	end

	m		
end

end

