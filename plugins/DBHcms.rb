##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DBHcms" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "The DBHcms is a small free Open Source content management system for personal and small business websites."
website "http://www.drbenhur.com"

# Google results as at 2011-02-27 #
# 65 for "powered by DBHcms" -dork

# Dorks #
dorks [
'"powered by DBHcms" -dork'
]



# Matches #
matches [

# Powered by text
{ :text=>'<a target="_blank" href="http://www.drbenhur.com/" class="copyright"> powered by DBHcms </a>' },

# HTML Comment
{ :regexp=>/<!--[\r\n\s]+#############################################################################################[\r\n\s]+#                                                                                           #[\r\n\s]+#  DBHCMS - Web Content Management System                                                   #[\r\n\s]+#                                                                                           #[\r\n\s]+#############################################################################################/ },

# HTML Comment
{ :regexp=>/<!--[\r\n\s]+Please leave this link on your website, it will help a lot for the DBHcms to get well-known. [\r\n\s]+You may change color and size, you can even remove it if you wish but then at least let me [\r\n\s]+know about your website so I can add you to my references.[\r\n\s]+Thank you very much for your cooperation! Greets, Kai.[\r\n\s]+-->/ },

# HTML Comment
{ :regexp=>/<!--[\r\n\s]+Change the copyright but please leave a link "powered by DBHcms" to http:\/\/www.drbenhur.com[\r\n\s]+This will help a lot for the DBHcms to get well-known. You may change color and size, you[\r\n\s]+can even remove it if you wish but then at least let me know about your website so I can add[\r\n\s]+you to my references. Thank you very much for your cooperation! Greets, Kai.[\r\n\s]+-->/ },

]

end


