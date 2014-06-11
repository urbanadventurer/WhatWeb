##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.6 # 2011-03-19 # Brendan Coles <bcoles@gmail.com>
# Updated regex
##
# Version 0.5
# find all email addresses, return only unique addresses, rename to email
##
# Version 0.4
# Updated regex, added > and comments
##
# Version 0.3
# added \' to regex
##
# Version 0.2
# removed :certainty
# end at an optional ?, return the email address as a :string
##
Plugin.define "Email" do
author "Andrew Horton"
version "0.6"
description "Extract email addresses. Find valid email address and syntactically invalid email addresses from mailto: link tags. We match syntactically invalid links containing mailto: to catch anti-spam email addresses, eg. bob at gmail.com. This uses the simplified email regular expression from http://www.regular-expressions.info/email.html for valid email address matching."

# More Info:
# The regex will only detect anti-spam e-mail addresses if present in "mailto:"
# The regex does not validate e-mail addresses in "mailto:"
#
# Example:
# <a href="mailto:bob at gmail dot com"> will return "bob at gmail dot com"
# <p>Contact me:  bob at gmail dot com</p> will not be detected
# <p>Contact me:  bob@gmail.com</p> will return "bob@gmail.com"

# Google results as at 2011-03-19 #
# 902 for "contact me" ("@hotmail.com"|"@gmail.com"|"@yahoo.com")



# Matches #
matches [

	# Detect valid email address in the page
	{ :string=>/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i },

	# Detect any email address in a mailto: tag
	{ :string=>/<[^>]+href=[^>]*mailto:([^\'\"\?>]+)[^>]*>/i },

]

end

