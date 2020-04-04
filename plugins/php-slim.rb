##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.1 # 2020-04-04 # Marcelo Gimenes
##
Plugin.define "PHP-Slim" do
  author "Marcelo Gimenes <marcelo.gimenes.oliveira@gmail.com>" # 2020-04-04
  version "0.1"
  description "Slim Framework"
  website "https://www.slimframework.com/"

  matches [
    { :name => 'Slim < 4.0', 
      :status => 404, 
      :text => "to ensure your URL is spelled correctly. If all else fails, you can" },
    { :name => 'Slim > 4.0', 
      :status => 404, 
      :text => "The requested resource could not be found. Please verify the URI and try again." }
  ] 

  def random_string(length=32)
    # should probably be moved somewhere else to be used in other plugins
    (1..length).map{|i| ('a'..'z').to_a[rand(26)]}.join
  end

  ##
  # get a random page to check for default 404 slim page
  ##
  def from_404(target, redirections=0)
    info = []
    begin
      status, url, ip, body, headers = open_target(target)

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

  def aggressive
    target = @base_uri.dup
    target.path = "/#{random_string}"
    from_404 target.to_s
  end
end

