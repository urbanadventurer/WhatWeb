##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.1 # 2018-11-16 # Marcelo Gimenes
##
Plugin.define "PHP-Slim" do
  author "Marcelo Gimenes <marcelo.gimenes.oliveira@gmail.com>" # 2018-11-16
  version "0.1"
  description "Slim Framework"
  website "https://www.slimframework.com/"

  matches [
    { :status => 404, :text => "The page you are looking for could not be found. Check the address bar" },
    { :status => 404, :text => "to ensure your URL is spelled correctly. If all else fails, you can" },
    { :status => 404, :text => "visit our home page at the link below.", :certainty => 90 },
    { :status => 404, :text => "Visit the Home Page", :certainty => 90 },
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
          { :text => "The page you are looking for could not be found. Check the address bar" },
          { :text => "to ensure your URL is spelled correctly. If all else fails, you can" },
          { :text => "visit our home page at the link below." },
          { :text => "Visit the Home Page", :certainty => 10 },
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

