##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
Plugin.define "CMS-Made-Simple" do
author "Andrew Horton" # 2016-05-25
version "0.1"
description "CMS Made Simple is an opensource Content Management System developed in PHP."
website "http://www.cmsmadesimple.org/"


# This is the matches array. 
# Each match is treated independently.

# Matches #
matches [

{ :name => "CMSSESSID cookie", :regexp => /^CMSSESSID/, :search => "headers[set-cookie]" },

{ :name => "Meta generator", :text => '<meta name="Generator" content="CMS Made Simple' },

{ :name => "Powered by footer", :version => /This site is powered by <a[^>]+>CMS Made Simple<\/a> version ([0-9\.]+)/ },

{ :name => "Admin Login Title", :text => "<title>Login to CMS Made Simple</title>", :url=> "/admin/login.php" },

{ :name => "Version from /doc/CHANGELOG.txt", :version => /^Version ([^ ]+).*/m, :url => "/doc/CHANGELOG.txt" },

{ :name => "favicon", :url => "/favicon_cms.ico", :md5 => "ebf500d206705bda0cb79021c15da98a" },

] 


end
