##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Artifactory"
authors [
  "bcoles", # 2020-09-29
]
version "0.1"
description "JFrog Artifactory enterprise universal repository manager supports all major packages, enterprise ready secure, clustered, HA, Docker registry, multi-site replication and scalable."
website "https://jfrog.com/artifactory/"

dorks [
'"Artifactory is happily serving" "Artifactory Version" intitle:"Artifactory"'
]

matches [

{ :text=>'<html ng-app="artifactory.ui">' },
{ :text=>'<body jf-body-class ng-class="{\'load-complete\':jfBodyClass.isLoadCompleted()}">' },
{ :url=>'/ui/auth/screen/footer', :version=>/"buildNumber":"([\d\.]+ rev \d+)"/ },
{ :url=>'/artifactory/ui/auth/screen/footer', :version=>/"buildNumber":"([\d\.]+ rev \d+)"/ },

]

end

