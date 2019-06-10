##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##

Plugin.define do 
name "Odoo" 
  authors [
  	"Naglis Jonaitis",
    "Andrew Horton", # v0.2 # 2019-07-10 # Removed Homepage: from the website
  ]
  version '0.2'
  description 'Odoo is an all-in-one management software that offers a range of business applications that form a complete suite of enterprise management applications targeting companies of all sizes.'
  website 'https://www.odoo.com/'

  matches [
    { :name => 'generator', :text=>'<meta name="generator" content="Odoo"/>' },
    { :name => 'favicon', :url => '/web/static/src/img/favicon.ico', :md5 => 'a342fe863a8e41dff2a55410c7f118c5'},
  ]
end

