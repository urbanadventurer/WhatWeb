##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb

# Vesion 0.8 # Andrew
#  Added aggressive match for /administrator/. Use match now
#  
##
# Version 0.7 # 2011-03-19 # Brendan Coles <bcoles@gmail.com>
# Added aggressive match for /administrator/
# Updated matches to remove false positives
##
# Version 0.6
# added seconds since epoch match from the mambo plugin
##
# Version 0.5
# uses :module instead of :string, changed the 3rd regexp from 75 certainty to 25.
##
# Version 0.4
# removed :probability & :name
##
Plugin.define "Joomla" do
author "Andrew Horton"
version "0.7"
description "Opensource CMS written in PHP. Aggressive version detection compares just 5 files, valid for versions 1.5.0-1.5.22 and 1.6.0-1.6.1. Homepage: http://joomla.org."

# Google results as at 2011-03-19 #
# 602 for "powered by joomla" inurl:option=com_content
# 537 for "powered by joomla"

# Examples #
examples %w|
biokolchuga.com
cosmicfantasia.net.au
rustedfables.com
www.1000usi.ch
www.azrul.com
www.bittdesign.nl
www.clubjoomla.com
www.danone.com
www.imusictools.com
www.joomla.org
www.joomlawebdesigns.com
www.livelovehope.org
82.223.114.249
www.gendervision.org/joomla15/
da-anime.info
www.miru.net
hostingdemo.joomlapolis.com
www.johngiczewski.com
|

# Matches #
matches [
{ :version=>"1.0", :regexp=>/<meta name="Generator" content="Joomla! - Copyright \(C\) 200[0-9] - 200[0-9] Open Source Matters. All rights reserved." \/>/ },
{ :version=>/<meta name="generator" content="Joomla! (\d\.\d) - Open Source Content Management" \/>/ },
{ :text=>'Powered by <a href="http://www.joomla.org">Joomla!</a>.' },

{ :url=>'/administrator/', :regexp=>/<div id="joomla"><img src="[^"]*\/images\/header_text.png" alt="Joomla! Logo"/ , :name=>'admin page'} #"
]

# Passive #
def passive
	m=[]

	# mosvisitor cookie # Also used by mambo
	m << { :certainty=>75, :name=>"mosvisitor cookie" } if @meta["set-cookie"] =~ /mosvisitor=[0-9]+/ 

	# P3P Privacy Headers # Also used by phpcake
	m << { :name=>"P3P Privacy Headers", :certainty=>25 } if @meta["p3p"] == 'CP="NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"'

	# HTML Comment # seconds since epoch # Also used by mambo
	if @body =~ /<\/html>.*(\n)*<!-- [0-9]+.*-->(\n)*\z/ and @body !~ /mambo/i
		m << {:name=>"seconds since epoch in html comment after </html>",:certainty=>25}
	end


	# Module Detection # Doesn't work in SEO mode # Also used by mambo
	if @body =~ /<a href="[^"]*index.php\?option=(com_[^&^"]+)/

		# Absolute URL
		m << { :certainty=>75, :module=>@body.scan(/<a href="https?:\/\/#{Regexp.escape(@base_uri.host)}[^"]*index.php\?option=(com_[^&^"]+)/) } if @body =~ /<a href="https?:\/\/#{Regexp.escape(@base_uri.host)}[^"]*index.php\?option=(com_[^&^"]+)/

		# Relative URL
		m << { :certainty=>75, :module=>@body.scan(/<a href="[^"^:]*index.php\?option=(com_[^&^"]+)/) } if @body =~ /<a href="[^"^:]*index.php\?option=(com_[^&^"]+)/

	end


	# Return passive matches
	m
end

# Aggressive #
def aggressive
	m=[]
	

	# Download and md5 hash additional files
	to_download = %w| language/en-GB/en-GB.ini administrator/language/en-GB/en-GB.ini administrator/language/en-GB/en-GB.xml plugins/editors/tinymce.xml components/com_contact/metadata.xml|
	downloads={}
	to_download.each do |d|	
		target = URI.join(@base_uri.to_s,d).to_s	
		status,url,ip,body,headers=open_target(target)
		downloads[d] = {:md5sum=>MD5.new(body).to_s}	
	end

	# Compare md5 hashes # this could be improved
	version=nil
	version = "1.5.0" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "903fb75f4369d78373b7b00db1c86c20"
	version = "1.5.1" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "be9408d25f37e91111caefca9b07f7d9"
	version = "1.5.2" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "630486389fb8b81bd17417acdf82534d"
	version = "1.5.3" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "7ce67c338528faac3870827d439daa8e"
	version = "1.5.4" if downloads["administrator/language/en-GB/en-GB.ini"][:md5sum] == "d7961bdd2528bf4bfc505b1d44920edd"
	version = "1.5.5 - 1.5.6" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "18bcc3be286f5c9ee03b211c3fcc02f6" and downloads["administrator/language/en-GB/en-GB.ini"][:md5sum] == "36a0b9af0fb86d84f51d2cfeef7577e8" and downloads["administrator/language/en-GB/en-GB.xml"][:md5sum] == "ff479e4f49c099208728077a6cc02f39"
	version = "1.5.7" if downloads["administrator/language/en-GB/en-GB.xml"][:md5sum] == "2629ad61fae0ff36fd2b2715a8defbcf"
	version = "1.5.8" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "fb5fcb1739656a7056573a1f04feb294"
	version = "1.5.9" if downloads["administrator/language/en-GB/en-GB.ini"][:md5sum] == "5516cf074a67bb54bbdb4fd9c340574d"
	version = "1.5.10" if downloads["administrator/language/en-GB/en-GB.ini"][:md5sum] == "a8b4a2477bc332f9039828c45aea92c2"
	version = "1.5.11" if downloads["administrator/language/en-GB/en-GB.ini"][:md5sum] == "c42788d652d97e2a103a7dcd3d507789"
	version = "1.5.12" if downloads["plugins/editors/tinymce.xml"][:md5sum] == "88c25322c0e878b6944cf9ea462c5071"
	version = "1.5.13 - 1.5.14" if downloads["plugins/editors/tinymce.xml"][:md5sum] == "e6537f60fc9e6a04eda14d55f852a9d8"
	version = "1.5.15" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "449d7bb356fcefa1343d72d203297438"
	version = "1.5.16" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "5a17bbf04d1e3fb4177dfa429b8e52b9"

	version = "1.5.17" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "685fdb13400fb459490c72f829427685"
	version = "1.5.18" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "5a17bbf04d1e3fb4177dfa429b8e52b9" and downloads["components/com_contact/metadata.xml"][:md5sum] == "9ea9550db4b1ae1eb7af7d7770301d16"

	version = "1.5.19 - 1.5.22" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "5a17bbf04d1e3fb4177dfa429b8e52b9" and downloads["components/com_contact/metadata.xml"][:md5sum] == "24095af7fbd32685fe2c817544df5117"

	version = "1.6.0" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "e3b7be6d318f23c22e0248bfe72d39f9"
	version = "1.6.1" if downloads["language/en-GB/en-GB.ini"][:md5sum] == "ce8bc2340afc690f1fedf6808284c201"

	# Return version matches from md5 hashes, if present
	unless version.nil?
		m << {:name=>"MD5 sums", :version=>version}
	end	

	# Return aggressive matches
	m
end

end

