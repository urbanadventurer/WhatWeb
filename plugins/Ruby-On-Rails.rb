##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ruby-on-Rails" do
author "Andrew Horton"
version "0.1"
description "Ruby on rails is an MVC web application framework written in the ruby language. Doesn't detect all RoR sites. Homepage: http://www.rubyonrails.org."
examples %w| http://yeah.com/   http://www.twitter.com/ http://www.shopify.com/ http://www.yellowpages.com/ http://www.github.com/ http://www.lighthouseapp.com/ http://sortfolio.com/ http://www.hulu.com/ http://www.groupon.com/ http://www.geni.com/ http://www.backpackit.com/ http://www.ravelry.com/ http://www.43things.com/ http://www.justin.tv/ http://www.scribd.com/ http://www.ilike.com/ http://www.streeteasy.com/ http://www.chow.com/ http://www.facebook.com/apps/application.php?id=2427603417 http://home.inklingmarkets.com/ http://www.alistapart.com/ http://www.revolutionhealth.com/ http://www.newyorkjets.com/ http://www.mingle2.com/ http://www.vitalsource.com/betterbooks/ http://www.blinksale.com/ http://www.cookpad.com/ http://www.blurb.com/ http://www.tobi.com/ http://www.spock.com/ http://www.lumosity.com/ http://www.lacoctelera.com/ http://www.a-better-tomorrow.com/http://minutestrading.com/ http://qurl.net/ http://pickem.terrbear.org/ http://now.dartmouth.edu/ http://nosleepmedia.com/ http://store.iamstillalive.net/ http://weed.rbse.com/ http://weasel-ware.org/ http://vorlesungsverzeichnis.hgkz.ch/ http://techzingo.com/|


matches [
{:url=>"/images/rails.png", :md5=>'450fc241fab7867e96536903244087f4'},
{:url=>"/images/rails.png", :md5=>'9c0a079bdd7701d7e729bd956823d153'}, # in rails 2.3.8
{:url=>"/404.html", :text=>'<!-- This file lives in public/404.html -->'},
{:url=>"/422.html", :text=>'<!-- This file lives in public/422.html -->'},
{:url=>"/500.html", :text=>'<!-- This file lives in public/500.html -->'},
{:url=>"/404.html", :md5=>'adc851c2e0698b5d05ef0380ed69f6b9'},{:url=>"/422.html", :md5=>'c6bd78379a0ad92caa6cbef7de676ce8'},
{:url=>"/500.html", :md5=>'8e19fd3c53aec78af1087378d5367833'}, 
{:url=>"/500.html", :md5=>'5b2d690ba72c890af0abdf5ee5c46c94'}, # in rails 2.3.8
{:url=>"/javascripts/application.js", :text=>'// This file is automatically included by javascript_include_tag :defaults'},
{:url=>"/doesnotexist", :text=>'No route matches "/doesnotexist" with {:method=>:get}'},
{:url=>"/doesnotexist", :text=>"<title>The page you were looking for doesn't exist (404)</title>", :md5=>'adc851c2e0698b5d05ef0380ed69f6b9'},
{:url=>"/stylesheets/scaffold.css", :text=>'#errorExplanation h2 {'},
{:text=>'<h3><a href="rails/info/properties" onclick="about(); return false">About your application&rsquo;s environment</a></h3>', :string=>'default page'},
{:text=>"<p>Run <tt>rake db:migrate</tt> to create your database. If you're not using SQLite (the default), edit <tt>config/database.yml</tt> with your username and password.</p>", :string=>'default page'},

]

def passive
	m=[]
	m << {:name=>'5 JS files', :certainty=>75} if @body =~ /javascripts\/prototype\.js\?[0-9]+/ and @body =~ /javascripts\/effects\.js\?[0-9]+/ and @body =~ /javascripts\/dragdrop\.js\?[0-9]+/ and @body =~ /javascripts\/controls\.js\?[0-9]+/ and @body =~ /javascripts\/application\.js\?[0-9]+/

	m << {:name=>"X-Powered-By: Phusion Passenger"} if @meta["x-powered-by"] =~ /Phusion Passenger/ # Phusion is only for rails
	m
end

end

