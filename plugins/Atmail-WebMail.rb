##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Atmail-WebMail" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-26
version "0.1"
description "Atmail allows users to access IMAP Mailboxes on any server of your choice. You and your users can experience webmail via a fluid, intuitive interface that excels aesthetically and functionally; a benchmark that very few webmail clients have achieved. - homepage: http://www.atmail.com/webmail-client/"

# 3 results for "powered by Atmail WebMail" @ 2010-09-26
examples %w|
a6demo.atmail.com
atmail6.datawave.net.au/index.php/admin/
demo.atmail.com
webmail.uo.edu.cu/wclient/rect/index.php
|

matches [

# Login page # Default title
{ :text=>'<title>Acceder a UOWebmail</title>' },

# Login page # Powered by text
{ :text=>"<a href='http://atmail.com/webmail-client/' title='Webmail client' target='_blank'>Powered by Atmail Webmail UO</a>" },
{ :regexp=>/<a href="http:\/\/www.atmail.com[\/]*" target="_blank">Powered by Atmail[\s]*<\/a>/ },
]

# Version detection
def passive
        m=[]

	# Login page # Default title
        if @body =~ /<title>Atmail ([\d\.]+) - Login Page<\/title>/
                version=@body.scan(/<title>Atmail ([\d\.]+) - Login Page<\/title>/)[0][0]
                m << {:version=>version}
        end

	# Login page # Powered by text
	if @body =~ /<a href="http:\/\/www.atmail.com\/" target="_blank">Powered by Atmail ([\d\.]+)<\/a>/
		version=@body.scan(/<a href="http:\/\/www.atmail.com\/" target="_blank">Powered by Atmail ([\d\.]+)<\/a>/)[0][0]
		m << {:version=>version}
	end

        m

end


end

