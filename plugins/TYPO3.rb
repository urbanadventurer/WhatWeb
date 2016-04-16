##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2012-08-16 # Andrew Horton
# Updated MD5 syntax. In future someone should move the MD5 hash matches into the matches array
##
Plugin.define "TYPO3" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-09
version "0.2"
description "TYPO3 is a free Open Source content management system for enterprise purposes on the web and in intranets. It offers full flexibility and extendability while featuring an accomplished set of ready-made interfaces, functions and modules."
website "http://typo3.com/"

# More examples here: http://welovet3.com/



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="TYPO3 ([\d\.]+) CMS" \/>/ },

# HTML Comment
{ :text=>'<!--TYPO3SEARCH_end-->', :certainty=>75 },

]

# Aggressive #
def aggressive
	m=[]

	# the paths are relative to the url path if they don't start with /
	# this path, with this md5 = this version
	files=[

	{ :md5=>'fa6bed20b07e72ae7140daf35bf9d194', :version=>'3.3.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'f8cf9f0ee879a5ed1f4cdbda5f66fe42', :version=>'3.5.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'91679c5cebe4dd2d3c6ef41a01252f56', :version=>'3.6.x - 3.8.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'65cdbcbfda7bd1512d61033f22919c04', :version=>'4.0.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'8268823e266152decfb7bb1ba652ab32', :version=>'4.1.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'21ba8e02551157b345885d9aec091ca2', :version=>'4.2.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'efda8e345a6516ea97a8412875e3b100', :version=>'4.3.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'4a464632a5a0865009bdf3d48bacbba9', :version=>'4.4.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'12a91f85007c0deb3f1c798faef7a336', :version=>'4.5.x', :path=>'t3lib/jsfunc.evalfield.js' },


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


