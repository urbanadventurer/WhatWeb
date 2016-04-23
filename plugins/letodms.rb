##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LetoDMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-24
version "0.1"
description "LetoDMS is an open-source document-management-system based on PHP and MySQL published under the GPL."
website "http://www.letodms.com/"

# ShodanHQ results as at 2012-08-24 #
# 30 for out/out.ViewFolder.php

# Google results as at 2012-08-24 #
# 84 for "letoDMS free document management system - www.letodms.com" "This is a classified area. Access is permitted only to authorized personnel"

# Dorks #
dorks [
'"letoDMS free document management system - www.letodms.com" "This is a classified area. Access is permitted only to authorized personnel"'
]



# Matches #
matches [

# Login Page # Disclaimer Footer
{ :text=>'<div class="disclaimer">This is a classified area. Access is permitted only to authorized personnel. Any violation will be prosecuted according to the national and international laws.</div>' },

# Footer
{ :text=>'letoDMS free document management system - www.letodms.com</div></body>' },

# Location Header
{ :search=>"headers[location]", :regexp=>/out\/out\.ViewFolder\.php/ },

]

end

