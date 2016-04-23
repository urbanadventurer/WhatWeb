##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Redmine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-15
version "0.1"
description "Redmine is a flexible project management web application. Written using Ruby on Rails framework, it is cross-platform and cross-database."

# ShodanHQ results as at 2011-09-15 #
# 1,394 for _redmine_session

# Google results as at 2011-09-15 #
# 295 for "Powered by Redmine"
#  25 for inurl:"redmine/login?back_url="

# Dorks #
dorks [
'"Powered by Redmine"'
]



# Matches #
matches [

# _redmine_session Cookie
{ :search=>"headers[set-cookie]", :regexp=>/_redmine_session=/ },

# Year Detection # Powered by link
{ :string=>/Powered by <a href="http:\/\/www\.redmine\.org\/">Redmine<\/a> &copy; 2006-(20[\d]{2}) Jean-Philippe Lang/ },

# Meta Description
{ :certainty=>25, :text=>'<meta name="description" content="Redmine" />' },

# Error Page
{ :status=>404, :text=>'<title>redMine 404 error</title>' },

]

end

