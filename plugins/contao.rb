##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.1
# Based on the contao plugin

Plugin.define "Contao" do
author "Eric Sesterhenn"
version "0.1"
description "Contao is an OpenSource CMS written in PHP"
website "www.contao.org"



matches [
{:text=>'This website is powered by Contao Open Source CMS :: Licensed under GNU/LGPL'},
{:text=>'<!-- indexer::continue -->'}
]

def aggressive
	m=[]
	
	target = URI.join(@base_uri.to_s,"/contao/").to_s
	status,url,ip,body,headers=open_target(target)
	
	if body =~ /<title>[^<]+Contao[^<]+CMS ([^<]+)<\/title>/
		version=body.scan(/<title>[^<]+Contao[^<]+CMS ([^<]+)<\/title>/)[0][0]
		m << {:name=>"login page version", :version=>version}
	end	

	# the paths are relative to the url path if they don't start with /
	# this path, with this md5 = this version
	files=[

 	{ :md5=>'0469d85ecb18e9a1ede2b0b2d5aa79a9', :version=>'2.9.0 (2010-07-02)', :path=>'CHANGELOG.md' },
 	{ :md5=>'24fb115dd0722792961d04b62353954c', :version=>'2.9.1 (2010-08-09)', :path=>'CHANGELOG.md' },
 	{ :md5=>'0da80d24450b841298c7ce3cac558e67', :version=>'2.9.2 (2010-12-02)', :path=>'CHANGELOG.md' },
 	{ :md5=>'ef3fde9f072a6aa11b58fa8c84740a4a', :version=>'2.9.3 (2011-01-06)', :path=>'CHANGELOG.md' },
 	{ :md5=>'c793826598074586e98728855620ffd0', :version=>'2.9.4 (2011-03-08)', :path=>'CHANGELOG.md' },
 	{ :md5=>'782bb70f82ee7e1a137f20c5e5cce77c', :version=>'2.9.5 (2011-05-18)', :path=>'CHANGELOG.md' },
 	{ :md5=>'5aa9e3efbfa5bb1ccb0cc514651d9cdc', :version=>'2.10.0 (2011-08-11)', :path=>'CHANGELOG.md' },
 	{ :md5=>'ad37d582d58f6c247e0913b1f5800476', :version=>'2.10.1 (2011-08-31)', :path=>'CHANGELOG.md' },
 	{ :md5=>'f39cba7429e6ef6d05c42215357dc17a', :version=>'2.10.2 (2011-10-10)', :path=>'CHANGELOG.md' },
 	{ :md5=>'008b6f59ae7a0f3cebdfa835ae009b87', :version=>'2.10.3 (2011-11-07)', :path=>'CHANGELOG.md' },
 	{ :md5=>'c95232b9f7744f9cd29fd8da23083b9a', :version=>'2.10.4 (2011-12-30)', :path=>'CHANGELOG.md' },
	{ :md5=>'7e3d69c4f2ecd792435c4afc6770a5ae', :version=>'2.11.0 (2012-02-15)', :path=>'CHANGELOG.md' },
 	{ :md5=>'91a4f4c10be6c6dab55b2c51a5e8e381', :version=>'2.11.2 (XXXX-XX-XX)', :path=>'CHANGELOG.md' },
 	{ :md5=>'10465b6d6f8dbda6caeeb25e740ff525', :version=>'2.11.2 (2012-03-14)', :path=>'CHANGELOG.md' },
 	{ :md5=>'62e2b98bc73e3f895428e2b18d378e83', :version=>'2.11.3 (2012-05-04)', :path=>'CHANGELOG.md' },
 	{ :md5=>'8c13ae28a7c70c603521debbb9517133', :version=>'2.11.4 (2012-06-12)', :path=>'CHANGELOG.md' },
 	{ :md5=>'b0689b2c20f3dc8af30030c681ea3a62', :version=>'2.11.5 (2012-07-25)', :path=>'CHANGELOG.md' },
 	{ :md5=>'2683898890efc3cea7af0d8d996ade58', :version=>'2.11.6 (2012-09-26)', :path=>'CHANGELOG.md' },
 	{ :md5=>'5000fac5d77fe0aacb1871cb12551675', :version=>'2.11.7 (2012-11-29)', :path=>'CHANGELOG.md' },
 	{ :md5=>'d705ac48bd6328771f2956e234d60c87', :version=>'2.11.8 (2013-01-07)', :path=>'CHANGELOG.md' },
 	{ :md5=>'190c9e3309125ee3d6ccad71578fd45c', :version=>'2.11.9 (2013-02-05)', :path=>'CHANGELOG.md' },
	{ :md5=>'53a1a84a687662329f5e870563253229', :version=>'3.0.0/3.0.1', :path=>'README.md' },
 	{ :md5=>'c46c1e2bbc8c1a33682de0c0a9f64b87', :version=>'3.0.2 or later', :path=>'README.md' },

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

	m
end


end

