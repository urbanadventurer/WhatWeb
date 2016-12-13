##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Posterita-POS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-18
version "0.1"
description "Posterita POS is a full web POS for large distribution and multi-site Point of Sale for thousands of users. Posterita POS is built on Adempiere/ERP."
website "http://www.posterita.com/"

# 3 for "powered by Posterita POS" "POS APPLICATION"

# Dorks #
dorks [
'"powered by Posterita POS" "POS APPLICATION"'
]



# Matches #
matches [

# Logo HTML
{ :text=>'<img src="images/newUI/logo.gif" alt="Powered by Posterita POS" width="133px" height="41px" border="0px"/>' },

# HTML Comment
{ :certainty=>75, :text=>'<!-- chooseApplication.jsp -->' },

# Version Detection # Footer
{ :version=>/<div class="footer">[\s]+<div class="floatLeft">[\s]+All Contents .[\s]+Posterita 20[\d]{2}[\s]+<b>Version &nbsp;([^\s^<]+)<\/b>[\s]+<\/div>[\s]+<\/div>/ },

]

end

