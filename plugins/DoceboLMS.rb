##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DoceboLMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "DoceboLMS is a SCORM compliant Open Source e-Learning platform used in corporate, government and education markets."
website "http://www.docebo.org/doceboCms/index.php"

# Google results as at  2011-03-24 #
# 253 for "Powered by Docebo"

# Dorks #
dorks [
'"Powered by Docebo"'
]



# Matches #
matches [

# Powered by link
{ :text=>'Powered by <a href="http://www.docebo.com/?versions" onclick="window.open(this.href); return false;">Docebo <sup>&reg;</sup></a>' },

# Powered by link # "." matches unencoded (R) symbols which fail in regex
{ :regexp=>/<div class="powered"><a href="http:\/\/www.docebo.com\/\?[a-z]+" target="_blank" alt="Powered by Docebo ." title="Powered by Docebo .">Powered by Docebo .<\/a><\/div>/ },

# Version Detection # Title
{ :certainty=>25, :version=>/<title>DoceboCore ([\d\.]+)<\/title>/ },

# Version Detection # Powered by text
{ :version=>/Powered by Docebo <sup>&reg;<\/sup> (Community|Enterprise) Edition/ },

# Version Detection # Powered by link
{ :version=>/Powered by <a href="http:\/\/www\.docebo\.com\/\?versions" onclick="window\.open\(this\.href\); return false;">Docebo <sup>&reg;<\/sup> (Community|Enterprise) Edition<\/a>/ },

# JavaScript
{ :text=>'lang_setup.setBody("<ul class=\"link_list_inline\" id=\"language_selection\"><li><a class=\"lang-sprite lang_' },

]

# Passive #
def passive
	m=[]

	# Version Detection # Install Page # Title and h1 heading
	if @body =~ /<title>Docebo installer<\/title>/ and @body =~ /<h1>Docebo ([\d\.]+) - Installation<\/h1>/
		m << { :string=>"Install Page", :version=>@body.scan(/<h1>Docebo ([\d\.]+) - Installation<\/h1>/) }
	end 

	# Return passive matches
	m
end

end


