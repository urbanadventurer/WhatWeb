##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Puppet-Dashboard" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-20
version "0.1"
description "The Puppet Dashboard is a web interface and reporting tool for a Puppet installation."
website "http://projects.puppetlabs.com/projects/dashboard"

# Google results as at 2012-02-20 #
# 48 for intitle:"Puppet Node Manager" "Puppet Labs"

# Dorks #
dorks [
'intitle:"Puppet Node Manager" "Puppet Labs"'
]



# Matches #
matches [

# /images/favicon.ico
{ :url=>"/images/favicon.ico", :md5=>"ba4bfe5d1deb2b4410e9eb97c5b74c9b" },

# Title
{ :certainty=>75, :text=>'<title>Puppet Node Manager</title>' },

# CHANGELOG link # Version Detection
{ :version=>/<li class='' id='dashboard-version'>[\s]+<a href="https:\/\/github\.com\/puppetlabs\/puppet-dashboard\/blob\/([^\s]+)\/CHANGELOG">/ },

# Year
{ :string=>/<p><a href="http:\/\/puppetlabs\.com\/">&copy; Copyright (20[\d]{2}) Puppet Labs<\/a><\/p>/ },

# Background image HTML
{ :text=>"<a href='/' style=\"background-repeat: no-repeat; text-indent: -9000px; background-image: url('/images/dashboard_logo.png'); height: 23px; width: 155px\" title='Puppet Dashboard'>Puppet Dashboard</a>" },

]

end

