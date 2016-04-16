##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pivotal-CRM" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-07
version "0.1"
description "Pivotal CRM is a customer relationship management (CRM) software system offered by CDC Software."
website "http://www.cdcsoftware.com/en/PivotalCRM.aspx"

# Google results as at 2011-04-07 #
# 33 for g_PORTAL_TITLE

# Dorks #
dorks [
'g_PORTAL_TITLE'
]



# Matches #
matches [

# GHDB # url pattern and JavaScript variable
{ :ghdb=>'filetype:asp inurl:"xmlloader.asp" "var g_LDSTRING_HEADER_ERROR_CLIENT_ERROR ="' },

# Encoded HTML
{ :text=>'&lt;script language=&quot;javascript&quot; src=&quot;javascript/utils.js&quot;&gt;&lt;/script&gt;&lt;script language=&quot;javascript&quot; src=&quot;javascript/navigation.js&quot;&gt;&lt;/script&gt;&lt;script language=&quot;javascript&quot;&gt;' },

# Frameset # Hidden frame
{ :text=>'<frame name="hidden" src="xmlloader.asp?type=portal" marginwidth="0" marginheight="0" scrolling="no" noresize>' },

# Frameset # Hidden frame with title paramater
{ :text=>'<frame name="hidden" title="Hidden" src="xmlloader.asp?type=portal" marginwidth="0" marginheight="0" scrolling="no" noresize>' },

]

end


