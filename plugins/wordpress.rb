##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3
# Now using :version=>// instead of a passive function, added description, examples and included relative /wp-content/ link detection

Plugin.define "WordPress" do
author "Andrew Horton"
version "0.3"
description "WordPress is an opensource blogging system commonly used as a CMS. Homepage: http://www.wordpress.org/ "
examples %w| http://lonnroth.info/ http://mattbrett.com/ http://www.komodomedia.com/ http://bestwebgallery.com/ http://cssremix.com/ http://www.cssbloom.net/ http://www.screenz.de/ http://www.kineda.com/ http://ifelse.co.uk/ http://fadtastic.net/ http://www.funci.org/en/ |

# identifying strings
# <meta name="generator" content="WordPress 2.5.1" />
# <meta name="generator" content="WordPress 2.6.5" />
# <meta name="generator" content="WordPress.com" />

matches [
{:text=>"<meta name=\"generator\" content=\"WordPress.com\" />"},
{:text=>"<a href=\"http://www.wordpress.com\">Powered by WordPress</a>", :name=>"powered by link"},
{:regexp=>/"[^"]+\/wp-content\/[^"]+"/, :name=>"wp-content", :certainty=>75 },

{:version=>/<meta name=\"generator\" content=\"(WordPress)[ ]?([0-9\.]+)\"/, :offset=>1  }, # if offset=>1 were missing then it would report WordPress as the version.


{:url=>"/wp-cron.php"}, # url exists, i.e. returns HTTP status 200
{:url=>"/readme.html", :md5=>'6cfb514bbb51d883bb6fece65d5fd450', :version=>"2.9.2"}, # url exists & the hash is ...
{:url=>"/readme.html", :md5=>'9ea06ab0184049bf4ea2410bf51ce402', :version=>"3.0"}, # url exists & the hash is ...
{:url=>"/readme.html", :md5=>'a73cac84b8b9a99377917a6974c9eea2', :version=>"3.0.1"}, # url exists & the hash is ...


#{:url=>"/admin/", :full=>true }, # full means that whatweb will run all plugins against this url - this isn't yet implemented as of 0.4.6

{:url=>"/wp-login.php", :text=>'<a title="Powered by WordPress" href="http://wordpress.org/">'}, # url exists & contains a string
{:url=>"/wp-login.php", :text=>'<a href="http://wordpress.org/" title="Powered by WordPress">', :name=>'wp3 login page'}, # url exists & contains a string

{:url=>"/wp-login.php", :tagpattern=>"!doctype,html,head,title,/title,meta,link,link,script,/script,meta,/head,body,div,h1,a,/a,/h1,form,p,label,br,input,/label,/p,p,label,br,input,/label,/p,p,label,input,/label,/p,p,input,input,input,/p,/form,p,a,/a,/p,p,a,/a,/p,/div,script,/script,/body,/html"}, #note that WP plugins can add script tags. tags are delimited by commas so we can count how close it is
{:url=>"favicon.ico", :md5=>'f420dc2c7d90d7873a90d82cd7fde315'}, # not common, seen on http://s.wordpress.org/favicon.ico
{:url=>"favicon.ico", :md5=>'fa54dbf2f61bd2e0188e47f5f578f736'},  # on wordpress.com blogs  http://s2.wp.com/i/favicon.ico 

{:url=>"/wp-login.php", :text=>'action=lostpassword'}, # url exists & contains a string

]

def passive
	m=[]

	# detect /wp-content/ on this site but don't be confused by links to other sites.
	#<link rel="stylesheet" href="http://bestwebgallery.com/wp-content/themes/master/style.css" type="text/css" />

	if @body =~ /(href|src)="[^"]*\/wp-content\/[^"]*/
		# is it a relative link or on the same site?
		links= @body.scan(/(href|src)="([^"]*\/wp-content\/[^"]*)/).map {|x| x[1].strip }.flatten
		links.each do |thislink|
			# join this link wtih target, check if host part is ==, if so, it's relative
			joined_uri=URI.join(@base_uri.to_s,thislink)

			if joined_uri.host == @base_uri.host
				#puts "yes, #{joined_uri.to_s} is relative to #{@base_uri.to_s}"
				m << {:name=>"Relative /wp-content/ link" }
				break
			end
		end
	end


	m
end

# http://www.morningstarsecurity.com/readme.html
# aggressive plugin should get this file for the version


end

