##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define do 
name "Odoo" 
  authors [
  	"Naglis Jonaitis",
  ]
  version '0.1'
  description 'Odoo is an all-in-one management software that offers a range of business applications that form a complete suite of enterprise management applications targeting companies of all sizes.'
  website 'Homepage: https://www.odoo.com/'

  matches [
    { :name => 'generator', :text=>'<meta name="generator" content="Odoo"/>' },
    { :name => 'favicon', :url => '/web/static/src/img/favicon.ico', :md5 => 'a342fe863a8e41dff2a55410c7f118c5'},
  ]
end

