##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2011-04-06 #
# Added aggressive md5 matches
##
# Version 0.3
# Now using :version=>// instead of a passive function, added description, examples and included relative /wp-content/ link detection
##
# Version 0.4
# removed non-relative /wp-content/ match

Plugin.define "WordPress" do
author "Andrew Horton"
version "0.4"
description "WordPress is an opensource blogging system commonly used as a CMS. Homepage: http://www.wordpress.org/ "

# Examples #
examples %w| http://lonnroth.info/ http://mattbrett.com/ http://www.komodomedia.com/ http://bestwebgallery.com/ http://cssremix.com/ http://www.cssbloom.net/ http://www.screenz.de/ http://www.kineda.com/ http://ifelse.co.uk/ http://fadtastic.net/ http://www.funci.org/en/ |

# Dorks #
dorks [
'"is proudly powered by WordPress"'
]

# Matches #
matches [

{:text=>"<meta name=\"generator\" content=\"WordPress.com\" />"},
{:text=>"<a href=\"http://www.wordpress.com\">Powered by WordPress</a>", :name=>"powered by link"}

{:version=>/<meta name=\"generator\" content=\"(WordPress)[ ]?([0-9\.]+)\"/, :offset=>1  }, # if offset=>1 were missing then it would report "WordPress" as the version.

# url exists, i.e. returns HTTP status 200
{:url=>"/wp-cron.php"},

#{:url=>"/admin/", :full=>true }, # full means that whatweb will run all plugins against this url - this isn't yet implemented as of 0.4.7

# /wp-login.php  exists & contains a string
{:url=>"/wp-login.php", :text=>'<a title="Powered by WordPress" href="http://wordpress.org/">'},
{:url=>"/wp-login.php", :text=>'<a href="http://wordpress.org/" title="Powered by WordPress">', :name=>'wp3 login page'},
{:url=>"/wp-login.php", :text=>'action=lostpassword'},

{:url=>"/wp-login.php", :tagpattern=>"!doctype,html,head,title,/title,meta,link,link,script,/script,meta,/head,body,div,h1,a,/a,/h1,form,p,label,br,input,/label,/p,p,label,br,input,/label,/p,p,label,input,/label,/p,p,input,input,input,/p,/form,p,a,/a,/p,p,a,/a,/p,/div,script,/script,/body,/html"}, #note that WP plugins can add script tags. tags are delimited by commas so we can count how close it is
{:url=>"favicon.ico", :md5=>'f420dc2c7d90d7873a90d82cd7fde315'}, # not common, seen on http://s.wordpress.org/favicon.ico
{:url=>"favicon.ico", :md5=>'fa54dbf2f61bd2e0188e47f5f578f736'},  # on wordpress.com blogs  http://s2.wp.com/i/favicon.ico 

]

# Passive #
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

	# Return passive matches
	m
end

# Aggressive #
def aggressive
	m=[]

# the paths are relative to the url path if they don't start with /
# this path, with this md5 = this version
files=[

{:version=>'0.71-gold', :path=>"readme.html", :md5=>'0c1e4a01d4ccf6dbedda30bf3c5eeb9e'},
{:version=>'0.72-RC1 or 0.72-beta-1', :path=>"readme.html", :md5=>'dacf325336ae55fffbcd54bd08de55b4' },
{:version=>'1.0-RC1', :path=>"readme.html", :md5=>'613b5eca59267b5b62b6e81dd9536b1b' },
{:version=>'1.0-platinum', :path=>"readme.html", :md5=>'6e08f4bfb7f79de78a3278f0f4ad981f' },
{:version=>'1.0.1-RC1', :path=>"readme.html", :md5=>'11f6a057f13e9413edc98e4614230622' },
{:version=>'1.0.1-miles', :path=>"readme.html", :md5=>'7ccd56b1c5b7123ed9afb222e6e93924' },
{:version=>'1.0.2', :path=>"readme.html", :md5=>'c91375254e9f56e45939ffcc28424c72' },
{:version=>'1.2-RC1', :path=>"readme.html", :md5=>'790736d62d442117f9d28b64161919a2' },
{:version=>'1.2-RC2', :path=>"readme.html", :md5=>'790736d62d442117f9d28b64161919a2' },
{:version=>'1.2-beta', :path=>"readme.html", :md5=>'790736d62d442117f9d28b64161919a2' },
{:version=>'1.2-delta', :path=>"readme.html", :md5=>'790736d62d442117f9d28b64161919a2' },
{:version=>'1.2-mingus', :path=>"readme.html", :md5=>'6c3c457ed408be44244edc121cada9a2' },
{:version=>'1.2.1', :path=>"readme.html", :md5=>'75eaf1c4b267e11fffd42c34e8832567' },
{:version=>'1.2.2', :path=>"readme.html", :md5=>'6c3c457ed408be44244edc121cada9a2' },
{:version=>'1.5.1 - 1.5.1.2', :path=>"readme.html", :md5=>'c60692ee8e176db0ac0be5ca69ba6c24' },
{:version=>'1.5-strayhorn or 1.5.1.3 or 1.5.2', :path=>"readme.html", :md5=>'aaa2d12586d9632c76b7b7f03d58a9f6' },
{:version=>'2.0 - 2.0.7', :path=>"readme.html", :md5=>'010ac2a095f4d30b2a650b94cf3f8842' },
{:version=>'2.0.8 - 2.0.11', :path=>"readme.html", :md5=>'ec9a2ffad38a3f0185aa6d9c0b8d6673' },
{:version=>'2.1-RC1', :path=>"readme.html", :md5=>'1808e8f88b490dffdfe0e3ea0a951e86' },
{:version=>'2.1-beta3', :path=>"readme.html", :md5=>'1808e8f88b490dffdfe0e3ea0a951e86' },
{:version=>'2.1-beta4', :path=>"readme.html", :md5=>'1808e8f88b490dffdfe0e3ea0a951e86' },
{:version=>'2.1-beta1', :path=>"readme.html", :md5=>'33228916bae952810ca10a09b23bc366' },
{:version=>'2.1-beta2', :path=>"readme.html", :md5=>'0bb72a5175266c98406b8b42a31114de' },
{:version=>'2.1 - 2.1.3', :path=>"readme.html", :md5=>'a5bc745849e1971abf8efb9a135ce764' },
{:version=>'2.2 - 2.2.3', :path=>"readme.html", :md5=>'939a797929aec1b8e0039014e9a29433' },
{:version=>'2.3-beta1', :path=>"readme.html", :md5=>'0384d4bdace37e066df6bb7a85b009aa' },
{:version=>'2.3 - 2.3.3', :path=>"readme.html", :md5=>'95803b846df1873416ee96c1577b3adf' },
{:version=>'2.5 - 2.6-beta3', :path=>"readme.html", :md5=>'c3024b888aeb1539f4c29df7b166d483' },
{:version=>'2.6 - 2.6.1-beta2', :path=>"readme.html", :md5=>'5bca147a86a1d277328c298ab06b772b' },
{:version=>'2.6.1 - 2.6.5', :path=>"readme.html", :md5=>'0377751ad219ccbb809d527952ff7325' },
{:version=>'2.7 - 2.8-beta2', :path=>"readme.html", :md5=>'94c4cdfa20778d1bf9784941f9fca133' },
{:version=>'2.8.1', :path=>"readme.html", :md5=>'7ed95e0b7ae663cbd0a8e77d787a4637' },
{:version=>'2.8.1-beta1 - 2.8.1-RC1', :path=>"readme.html", :md5=>'4a64408bdaaa6c8af7cab9346f0ce380' },
{:version=>'2.8.2', :path=>"readme.html", :md5=>'ef8665ddd2d87badccb3532705b95992' },
{:version=>'2.8.3', :path=>"readme.html", :md5=>'de32a1268d126ea71127ad5f9fa8f60d' },
{:version=>'2.8.4', :path=>"readme.html", :md5=>'7d93c7feb3e2e2c2112474f92e3ee6f8' },
{:version=>'2.8.5 or 2.8.5-beta1', :path=>"readme.html", :md5=>'f32252ef12c927f6285e4fb29efce04f' },
{:version=>'2.8.6 or 2.8.6-beta1', :path=>"readme.html", :md5=>'027283d03b08abae67279fd17a37760b' },
{:version=>'2.9 or 2.9.1-beta1', :path=>"readme.html", :md5=>'1eaf3b4f4c2d039d26a473c0e0b5622e' },
{:version=>'2.9-beta-1 - 2.9-RC1', :path=>"readme.html", :md5=>'f182f41b25a96a12c393e35d9d063ed4' },
{:version=>'2.9.2', :path=>"readme.html", :md5=>'6cfb514bbb51d883bb6fece65d5fd450' },
{:version=>"3.0", :path=>"readme.html", :md5=>'9ea06ab0184049bf4ea2410bf51ce402' },
{:version=>"3.0.1", :path=>"readme.html", :md5=>'a73cac84b8b9a99377917a6974c9eea2' },
{:version=>"3.1", :path=>"readme.html", :md5=>'f01635ffca23e49e01f47e98553ea75d' },
{:version=>"3.1.1", :path=>"readme.html", :md5=>'d74be699794f7fd969232bfe73c0ab04' },
{:version=>"3.1.2", :path=>"readme.html", :md5=>'20f882b08b2804bc7431c0866a8999d1' },

]

	# Fetch and hash files
	to_download = files.map {|x| x[:path]}.sort.uniq
	downloads={}
	to_download.each do |d|
		target = URI.join(@base_uri.to_s,d).to_s	
		status,url,ip,body,headers=open_target(target)
		downloads[d] = {:md5sum=>MD5.new(body).to_s}	
	end

	# Compare file hashes to known hashes
	version=nil
	files.each do |thisfile|
		unless downloads[thisfile[:path]].nil?
			version=thisfile[:version] if downloads[thisfile[:path]][:md5sum] == thisfile[:md5]
		end
	end

	# Set version if present
	unless version.nil?
		m << {:name=>"md5 sums of files", :version=>version}
	end

	# Return aggressive matches
	m
end

end

