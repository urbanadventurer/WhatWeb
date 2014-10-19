##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Jenkins" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-23
version "0.1"
description "Jenkins is an application that monitors executions of repeated jobs, such as building a software project or jobs run by cron."
website "http://jenkins-ci.org/"

# ShodanHQ results as at 2012-02-23 #
# 100 for x-jenkins

# Google results as at 2012-02-23 #
# 20 for intitle:"Jenkins" "Remember me on this computer" "Jenkins ver"
# 11 for inurl:":8080/jenkins/job/"

# Dorks #
dorks [
'intitle:"Jenkins" "Remember me on this computer" "Jenkins ver"'
]



# Matches #
matches [

# JavaScript
{ :regexp=>/<script>var isRunAsTest=false; var rootURL="[^"]*";<\/script>/ },

# Footer # Version Detection
{ :version=>/<\/span><a href="http:\/\/jenkins\-ci\.org\/">Jenkins ver\. ([^<]+)<\/a>/ },

# x-hudson-theme
{ :search=>"headers[x-hudson-theme]", :regexp=>/^.*$/ },

# x-instance-identity
{ :search=>"headers[x-instance-identity]", :regexp=>/^.*$/ },

# x-hudson-cli-port
{ :search=>"headers[x-hudson-cli-port]", :regexp=>/^.*$/ },

# x-jenkins # Version Detection
{ :search=>"headers[x-jenkins]", :version=>/^(.+)$/ },

# x-hudson
{ :search=>"headers[x-hudson]", :regexp=>/^.*$/ },

# x-jenkins-cli-port
{ :search=>"headers[x-jenkins-cli-port]", :regexp=>/^.*$/ },

# x-ssh-endpoint
{ :search=>"headers[x-ssh-endpoint]", :regexp=>/^.*$/ },

]

end

