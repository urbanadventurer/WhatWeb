##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Dhiraj Mishra <@mishradhiraj_>

Plugin.define 'subrion' do
  author 'Dhiraj Mishra'
  version '0.1'
  description 'Subrion is a PHP/MySQL based CMS & framework that allows you to build websites for any purpose. Yes, from blog to corporate mega portal.'
  website 'Homepage: https://subrion.org/'

dorks [
'"Powered by subrion"'
]

  matches [
    { :name => 'title', :text=>'<title>Home :: Powered by Subrion 4.0</title>' },
    { :name => 'title', :text=>'<title>Home :: Powered by Subrion 4.2</title>' },
    { :name => 'title', :text=>'<title>iaBootstrap :: Powered by Subrion 3.2</title>' },
    { :name => 'title', :text=>'<title>Car Listings :: Powered by Subrion 2.3</title>' },
    { :name => 'favicon', :url => '/favicon.ico', :md5 => '09BDDB30D6AE11E854BFF82ED638542B'},
    { :name => 'powered by', :text=>'<meta property="og:url" content="https://subrion.org/">' },
    { :name => 'meta', :text=>'<meta name="generator" content="Subrion CMS 2.3.1 - Open Source Content Management System" />' },
  ]

end
