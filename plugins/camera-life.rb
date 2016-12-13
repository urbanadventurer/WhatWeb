##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CameraLife" do
author "Andrew Horton" # 2015-05-07
version "0.1"
description "Camera Life is an open source software package you install and run on your own server running PHP and MySQL."
website "https://fulldecent.github.io/cameralife/"

# Matches #
matches [
# Version in HTTP header
{ :version=>/<meta name="generator" content="Camera Life version ([^"]+)">/},
{ :string =>'<a href="http://fulldecent.github.io/cameralife"><i class="fa fa-globe"></i> Built with Camera Life</a>'},
{ :version=>/This site is powered by Camera Life version ([^ ]+)/}

]
end
