##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phxEventManager" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-03
version "0.1"
description "phxEventManager is an event resource calendar system designed to manage all aspects of an occasion."
website "http://phxeventmanager.com/"

# Google results as at 2012-03-03 #
# 114 for intext:"Powered by phxEventManager" -intext

# Dorks #
dorks [
'intext:"Powered by phxEventManager" -intext'
]



# Matches #
matches [

# div class="minicalmonth"
{ :text=>'<td><div class="minicalmonth"><a href="/?y=' },

# JavaScript
{ :certainty=>75, :text=>'<script type="text/javascript" src="pem-includes/xajax/xajax_js/xajax_core.js"></script>' },

# Footer # Version Detection
{ :version=>/<div id="footer">\s+Copyright &copy; 20[\d]{2}[^\n]+\s+Powered by phxEventManager ([^<]+)<br \/>/ },

]

end

