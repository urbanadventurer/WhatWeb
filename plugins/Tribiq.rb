##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tribiq" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.1"
description "Tribiq CMS is a content management system for websites. Without needing technical skills, you can edit and grow your website."
website "http://tribiq.com/"

# 130 results for "powered by Tribiq" @ 2010-09-17

# Dorks #
dorks [
'"powered by Tribiq"'
]



matches [

# Default favicon
{ :md5=>'1d334359c5d0f68de91f33c78581f25c', :url=>'/favicon.ico' },

# Powered by text
{ :text=>'Powered by <a href="http://tribiq.com/" target="_blank">Tribiq CMS</a>' },
{ :text=>'Designed &amp; Powered by <a alt="Tribiq CMS" target="_blank" title="Tribiq CMS" href="http://www.tribiq.com">Tribiq CMS</a>' },
{ :regexp=>/Designed &amp; Powered by <a href="http:\/\/www.tribiq.com[\/]*[^>]+>Tribiq CMS<\/a>/ },
{ :text=>'Powered by <a href="http://tribiq.com" title="TRIBiQ Content Management System" target="_blank">Tribiq</a>' },
{ :text=>'<a href="http://tribiq.com">Powered by Tribiq CMS</a>' },
{ :text=>'Powered by <a href="http://tribiq.com" target="_blank">TRIBiQ</a>' },

# Admin Page # Default Javascript
{ :text=>'					document.location.href = "adminlogin.php?sk=" + (hash? hash : "tribiq__content");' },

# Admin Page # Default HTML
{ :text=>'				<p><a href="adminlogin.php">Please log in</a></p>' },

# Login page # Default title
{ :text=>'<title>Tribiq CMS Administrator Login</title>' },

]

# Version detection
def passive
        m=[]

	# Meta generator
        if @body =~ /<meta name="generator" content="Tribiq CMS ([\d\.a-z]+)" \/>/
                version=@body.scan(/<meta name="generator" content="Tribiq CMS ([\d\.a-z]+)" \/>/)[0][0]
                m << {:version=>version}
        end

	# Login page # Powered by text
	if @body =~ /    			Powered by <a href="http:\/\/tribiq.com[\/]*" target="_blank">Tribiq CMS<\/a>/
		if @body =~ /    			([\d\._a-z]+)    		<\/div>/
			version=@body.scan(/    			([\d\._a-z]+)    		<\/div>/)[0][0]
			m << {:version=>version}
		end
	end

        m

end


end

