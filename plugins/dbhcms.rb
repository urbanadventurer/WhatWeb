##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "DBHcms"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-02-27
  "Andrew Horton" # 2019-07-10 # Simplified matches and fixed warning: character class has duplicated range
]
version "0.2"
description "The DBHcms is a small free Open Source content management system for personal and small business websites."
website "http://www.drbenhur.com"

# Google results as at 2011-02-27 #
# 65 for "powered by DBHcms" -dork

# Dorks #
dorks [
'"powered by DBHcms" -dork'
]



# Matches #
matches [

# Powered by text
{ :text=>'<a target="_blank" href="http://www.drbenhur.com/" class="copyright"> powered by DBHcms </a>' },

# HTML Comment
{ :regexp=>/<!--[\s]+\#{90,100}[\s]+#[\s]+#[\s]+#  DBHCMS - Web Content Management System[\s]+#[\s]+#[\s]+#[\s]+\#{90,100}/ },

# HTML Comment
{ :regexp=>/<!--[\s]+Please leave this link on your website, it will help a lot for the DBHcms to get well-known./ },

# HTML Comment
{ :regexp=>/<!--[\s]+Change the copyright but please leave a link "powered by DBHcms" to http:\/\/www.drbenhur.com[\s]/ },

]

end


