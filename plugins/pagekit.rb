##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define 'pagekit' do
  author 'Dhiraj Mishra <@mishradhiraj_>'
  version '0.1'
  description 'Pagekit - A new modern CMS to create and share - Intuitive. Modular. Flexible.'
  website 'Homepage: https://pagekit.com/'
 
# Matches #

  matches [
    { :name => 'meta', :text=>'<meta property="twitter:site" content="@pagekit">' },
    { :name => 'meta', :text=>'<meta property="og:site_name" content="Pagekit">' },
    { :name => 'URL', :text=>'<meta property="og:url" content="https://pagekit.com/">' },
    { :name => 'favicon', :url => '/app/system/modules/theme/favicon.ico', :md5 => '365b8bebd207c07ef45117dd3ca9f4fb'},
    { :name => 'tm-logo', :url => '/storage/pagekit-logo.svg', :md5 => 'fb7c1398fc562ffdea700a4e0cb7a2d7'},
    { :name => 'description', :text=>'<meta property="og:description" content="Pagekit is a modular and lightweight CMS built with modern technologies like Vue.js and Symfony components.">' },
  ]

end
