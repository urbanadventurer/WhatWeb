##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.1 # 2020-04-04 # Marcelo Gimenes
##
Plugin.define do
  name "PHP-Slim"
  authors [
    "Marcelo Gimenes <marcelo.gimenes.oliveira@gmail.com>"
  ]
  version "0.1"
  description "Slim Framework"
  website "https://www.slimframework.com/"

  matches [
    { :name => 'Slim < 4.0', 
      :text => "to ensure your URL is spelled correctly. If all else fails, you can" },
    { :name => 'Slim > 4.0', 
      :text => "The requested resource could not be found. Please verify the URI and try again." }
  ] 

  aggressive do
    random_string = (1..32).map{|i| ('a'..'z').to_a[rand(26)]}.join

    target = @base_uri.dup
    target.path = "/#{random_string}"

    info = []
    redirections = 0
    begin
      status, url, ip, body, headers = open_target(target.to_s)

      if status == 301 && redirections < 3 
        info = from_404(headers['location'], redirections+1)
      end
      if status == 404
        texts = [
          { :text => "to ensure your URL is spelled correctly. If all else fails, you can" }, # Slim < 4.0
          { :text => "The requested resource could not be found. Please verify the URI and try again." } # Slim > 4.0
        ]
        texts.each do |m|
          s = body.scan(m[:text])
          unless s.empty?
            info <<  { :certainty => m[:certainty] }
          end
        end
      end
    rescue
    end
    info
  end
end

