##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Dhiraj Mishra <@mishradhiraj_>

Plugin.define 'phpmyfaq' do
  author 'Dhiraj Mishra'
  version '0.1'
  description 'phpMyFAQ is a mobile-friendly, feature-rich, scalable open source FAQ software using PHP 5.6+ and PHP 7+'
  website 'Homepage: https://www.phpmyfaq.de/'

# Dorks #
dorks [
'"Powered by phpmyfaq"'
]
  
# Matches #
  matches [
    { :name => 'powered by', :text=>'<a href="http://www.phpmyfaq.de" target="_blank">' },
    { :name => 'powered by', :text=>'<a href="http://www.phpmyfaq.de/">phpMyFAQ Team</a>' },
    { :name => 'favicon', :url => '/favicon.ico', :md5 => '5cc634424775c216d06120e5975eb9e5'},
    { :name => 'description', :text=>'<meta property="og:description" content="phpMyFAQ should be the answer for all questions in life">' },
  ]
end
