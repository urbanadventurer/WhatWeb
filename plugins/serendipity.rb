##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2014-10-12 # Napz
# Added Serendipity text search
##
# Version 0.3 # 2012-08-16 # Andrew Horton
# Updated MD5 syntax. In future someone should move the MD5 hash matches into the matches array
##
# Version 0.2 # 2011-04-09 # Brendan Coles <bcoles at gmail dot com>
# Added aggressive md5 matches
##
Plugin.define "Serendipity" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.3"
description "Serendipity - a PHP Weblog/Blog software. Serendipity is a PHP-powered weblog application which gives the user an easy way to maintain an online diary, weblog or even a complete homepage."
website "http://www.s9y.org"

# Google results as at 2011-02-24 #
# 342 for "powered by Serendipity"
# 299 for "My weblog is proudly powered by Serendipity"

# ShodanHQ results as at 2011-02-24 #
# 339 for X-blog: Serendipity
# 26 for x-serendipity-interfacelang
# 12 for X-serendipity-ml-sl-reset
# 5 for x-serendipity-contentlang

# Dorks #
dorks [
'"powered by Serendipity"',
'"My weblog is proudly powered by Serendipity"'
]



# Matches #
matches [

# Version Detection # Meta Powered-By
{ :version=>/<meta name="Powered-By" content="Serendipity v.([^"]+)" \/>/i },

# Version Detection # Proudly powered by text
{ :version=>/My weblog is proudly powered by <a href="http:\/\/www.s9y.org">Serendipity ([^<]+)<\/a>.<br \/>/ },

# Powered by text
{ :text=>'<p>Powered by <a href="http://www.s9y.org" target="_blank">Serendipity</a>' },

# Copyright text
{ :text=>'<div class="copyright">Powered by <a href="http://www.s9y.org" title="a PHP Weblog/Blog software">Serendipity</a>' },

{ :text=>'serendipity_entry_body' },

{ :text=>'serendipity_entry_author_Admin' },

{ :text=>'serendipity_entryFooter' },

{ :text=>'<div id="serendipityLeftSideBar">' },
]

# Passive #
def passive
	m=[]

	# x-serendipity-interfacelang
	m << { :name=>'x-serendipity-interfacelang' } unless @headers['x-serendipity-interfacelang'].nil?

	# x-serendipity-contentlang
	m << { :name=>'x-serendipity-contentlang' } unless @headers['x-serendipity-contentlang'].nil?

	# x-blog: serendipity
	m << { :name=>'x-blog: serendipity' } if @headers['x-blog'] =~ /^Serendipity$/

	# Return passive matches
	m
end

# Aggressive #
def aggressive
	m=[]

# the paths are relative to the url path if they don't start with /
# this path, with this md5 = this version
files=[

{ :md5=>'79c1b6a769935747118a677ef7aa3982', :version=>'0.3.x - 0.5.x', :path=>'serendipity_editor.js' },
{ :md5=>'74eaef55e0951e216421bb01cc92082a', :version=>'0.6-pl3', :path=>'serendipity_editor.js' },
{ :md5=>'c9fd7b9fb103678b44a922bffda02fea', :version=>'0.7.x', :path=>'serendipity_editor.js' },
{ :md5=>'f1751045478704d6c4bc2cf0207cbb9b', :version=>'0.8', :path=>'serendipity_editor.js' },
{ :md5=>'d2e8aba1ed100c6ec1e36101b5aa24e4', :version=>'0.8.1', :path=>'serendipity_editor.js' },
{ :md5=>'36c4f911d9ca31a272203187d1878957', :version=>'0.8.2', :path=>'serendipity_editor.js' },
{ :md5=>'74c5736300bbfd11429858e990d7e864', :version=>'0.8.3', :path=>'serendipity_editor.js' },
{ :md5=>'8f21fdb6a1d9b9ceacc06ee627389bde', :version=>'0.8.4', :path=>'serendipity_editor.js' },
{ :md5=>'9c484f7fe5b24c1d9a6332e67b6fbbd5', :version=>'0.8.5', :path=>'serendipity_editor.js' },
{ :md5=>'802d4efbc2f518811cc6ab0b80c16d31', :version=>'0.9.x', :path=>'serendipity_editor.js' },
{ :md5=>'e3e676fdc4554fe78132db6622548363', :version=>'1.0', :path=>'serendipity_editor.js' },
{ :md5=>'970ac406dfd81ad78f3e09a75b423682', :version=>'1.0.1 - 1.0.4a', :path=>'serendipity_editor.js' },
{ :md5=>'20c00879135d75de0e0e1fb787e0ccc6', :version=>'1.1.x', :path=>'serendipity_editor.js' },
{ :md5=>'6f53ddcda7b56d71424473cb336452af', :version=>'1.2.x', :path=>'serendipity_editor.js' },
{ :md5=>'28268a9cfaa70503d5240e871be8f323', :version=>'1.3.x - 1.4.x', :path=>'serendipity_editor.js' },
{ :md5=>'4f641152c6e24d29816e839c361c2b88', :version=>'1.5.x', :path=>'serendipity_editor.js' },

]

	# Fetch and hash files
	to_download = files.map {|x| x[:path]}.sort.uniq
	downloads={}
	to_download.each do |d|
		target = URI.join(@base_uri.to_s,d).to_s	
		status,url,ip,body,headers=open_target(target)
		downloads[d] = {:md5sum=>Digest::MD5.hexdigest(body).to_s}	
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
