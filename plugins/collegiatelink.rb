##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CollegiateLink" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-22
version "0.1"
description "CollegiateLink"
website "http://www.collegiatelink.net/"

# 120 for "Powered by CollegiateLink Version"
# 109 for "Powered by CollegiateLink Version" inurl:"Community?action"

# Dorks #
dorks [
'"Powered by CollegiateLink Version" inurl:"Community?action"'
]



# Matches #
matches [

# Version detection # Powered by footer
{ :version=>/Powered by <a href="http:\/\/www\.collegiatelink\.net">CollegiateLink<\/a> Version ([\d\.]+)<\/p><div id="links">CollegiateLink uses / },

# HTML Comments + divs + span classes
{ :text=>'</div></div></div><div class="salink"><span class="shadow"><!----></span></div></div><span class="clearDiv"><!----></span></div></div><span class="clearDiv"><!----></span><script type="text/javascript">' },

]

end


