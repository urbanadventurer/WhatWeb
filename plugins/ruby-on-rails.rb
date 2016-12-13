##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ruby-on-Rails" do
author "Andrew Horton"
version "0.1"
description "Ruby on rails is an MVC web application framework written in the ruby language. Doesn't detect all RoR sites"
website "http://www.rubyonrails.org."

# Matches #
matches [

# /images/rails.png
{:url=>"/images/rails.png", :md5=>'450fc241fab7867e96536903244087f4'},
{:url=>"/images/rails.png", :md5=>'9c0a079bdd7701d7e729bd956823d153'}, # in rails 2.3.8

# Error Pages
{:url=>"/404.html", :text=>'<!-- This file lives in public/404.html -->'},
{:url=>"/422.html", :text=>'<!-- This file lives in public/422.html -->'},
{:url=>"/500.html", :text=>'<!-- This file lives in public/500.html -->'},
{:url=>"/404.html", :md5=>'adc851c2e0698b5d05ef0380ed69f6b9'},{:url=>"/422.html", :md5=>'c6bd78379a0ad92caa6cbef7de676ce8'},
{:url=>"/500.html", :md5=>'8e19fd3c53aec78af1087378d5367833'}, 
{:url=>"/500.html", :md5=>'5b2d690ba72c890af0abdf5ee5c46c94'}, # in rails 2.3.8
{:url=>"/javascripts/application.js", :text=>'// This file is automatically included by javascript_include_tag :defaults'},
{:url=>"/doesnotexist", :text=>'No route matches "/doesnotexist" with {:method=>:get}'},
{:url=>"/doesnotexist", :text=>"<title>The page you were looking for doesn't exist (404)</title>", :md5=>'adc851c2e0698b5d05ef0380ed69f6b9'},

# /stylesheets/scaffold.css
{:url=>"/stylesheets/scaffold.css", :text=>'#errorExplanation h2 {'},

# asset pipeline
{ :regexp=>/<link[^>]*href="[^"]*\/assets\/application-?\w{32}?\.css"/ },
{ :regexp=>/<script[^>]*\/assets\/application-?\w{32}?\.js"/ },

# csrf-token
{ :regexp=>/<meta content="authenticity_token" name="csrf-param"\s?\/>\s?<meta content="[^"]{44}" name="csrf-token"\s?\/>/ },

# Default Page
{:text=>'<h3><a href="rails/info/properties" onclick="about(); return false">About your application&rsquo;s environment</a></h3>', :string=>'default page'},
{:text=>"<p>Run <tt>rake db:migrate</tt> to create your database. If you're not using SQLite (the default), edit <tt>config/database.yml</tt> with your username and password.</p>", :string=>'default page'},

# Error Page # Title
{ :certainty=>75, :text=>'<title>Action Controller: Exception caught</title>' },

# Error Page # Local Path Disclosure
{ :filepath=>/<p><code>RAILS_ROOT: ([^<]+)<\/code><\/p>/ },

# Error Page # div id="session_dump"
{ :text=>'<div id="session_dump" style="display:none"><pre class=\'debug_dump\'>---' },

]

# Passive #
def passive
	m=[]
	m << {:name=>'5 JS files', :certainty=>75} if @body =~ /javascripts\/prototype\.js\?[0-9]+/ and @body =~ /javascripts\/effects\.js\?[0-9]+/ and @body =~ /javascripts\/dragdrop\.js\?[0-9]+/ and @body =~ /javascripts\/controls\.js\?[0-9]+/ and @body =~ /javascripts\/application\.js\?[0-9]+/

	m << {:name=>"X-Powered-By: Phusion Passenger"} if @headers["x-powered-by"] =~ /Phusion Passenger/ # Phusion is only for rails
	m
end

end

