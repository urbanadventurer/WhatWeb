##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.1 # 2020-04-04 # Marcelo Gimenes
# Version 0.2 # 2020-04-21 # Marcelo Gimenes
##
Plugin.define do
  name "PHP-Slim"
  authors [
    "Marcelo Gimenes <marcelo.gimenes.oliveira@gmail.com>"
  ]
  version "0.2"
  description "Slim Framework"
  website "https://www.slimframework.com/"

  matches [
    { :name => 'Slim < 4.0', 
      :text => "to ensure your URL is spelled correctly. If all else fails, you can",
      :url => randstr()},
    { :name => 'Slim > 4.0', 
      :text => "The requested resource could not be found. Please verify the URI and try again.",
      :url => randstr()}
  ] 
end

