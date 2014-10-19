##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2012-07-29 #
# Updated dorks
##
# Version 0.2 # 2011-01-07 #
# Updated version detection method
# Added MailServer detection
##
Plugin.define "Atmail-WebMail" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-26
version "0.3"
description "Atmail allows users to access IMAP Mailboxes on any server of your choice. You and your users can experience webmail via a fluid, intuitive interface that excels aesthetically and functionally; a benchmark that very few webmail clients have achieved."
website "http://www.atmail.com/webmail-client/"

# Google results as at 2012-07-29 #
# 333 for "Powered by Atmail" "WebAdmin Control Panel" "Email" "Password" "More" " Mailserver" "Protocol" "Language"

# Dorks #
dorks [
'"Powered by Atmail" "WebAdmin Control Panel" "Email" "Password" "More" " Mailserver" "Protocol" "Language"'
]



# Matches #
matches [

	# Login page # Default title
	{ :text=>'<title>Acceder a UOWebmail</title>' },

	# Login page # UO # Powered by text
	{ :text=>"<a href='http://atmail.com/webmail-client/' title='Webmail client' target='_blank'>Powered by Atmail Webmail UO</a>", :version=>"UO" },

	# Login page # Powered by text
	{ :regexp=>/<a href="http:\/\/www.atmail.com[\/]*" target="_blank">Powered by Atmail[\s]*<\/a>/ },

	# Login page # Expand options JavaScript / HTML
	{ :text=>'<td class="more"><a href="javascript:ExpandOptions()"><img src="imgs/login-more.gif" alt="more" border="none"></a></td>' },

	# Version Detection # Login page # Default title
	{ :version=>/<title>Atmail ([\d\.]+) - Login Page<\/title>/ },

	# Version Detection # Login page # Powered by text
	{ :version=>/<a href="http:\/\/www.atmail.com\/" target="_blank">Powered by Atmail ([\d\.]+)/ },

	# MailServer Detection # Login Page # Input box HTML
	{ :string=>/<input id="Mailserverinput" class="input" type="text" name="MailServer" value="([^>]*)"/ },

]

end

