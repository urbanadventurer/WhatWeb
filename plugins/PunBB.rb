##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2012-08-16 # Andrew Horton
# Updated MD5 syntax. In future someone should move the MD5 hash matches into the matches array
##
Plugin.define "PunBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-06
version "0.2"
description "PunBB is a fast and lightweight PHP-powered discussion board. It is released under the GNU General Public License."
website "http://punbb.informer.com/"

# Google results as at 2011-04-06
# 302 for "Powered by PunBB, supported by Informer Technologies"

# Dorks #
dorks [
'"Powered by PunBB, supported by Informer Technologies"'
]



# Matches #
matches [

# HTML Comment
{ :certainty=>25, :text=>'<!-- forum_debug -->' },

# brd-index div
{ :text=>'<div id="brd-index" class="brd-page basic-page">' },

# Powered by link
{ :text=>'<p id="copyright">Powered by <strong><a href="http://punbb.informer.com/">PunBB</a></strong>, supported by <strong><a href="http://www.informer.com/">Informer Technologies, Inc</a></strong>.</p>' },

# Module Detection
{ :module=>/<p style="clear: both; ">Currently installed <span id="extensions-used" title="([^"]+)\.">[\d]+ official extensions<\/span>\. Copyright &copy; 2003&ndash;/ },

]

# Aggressive #
def aggressive
	m=[]

	# the paths are relative to the url path if they don't start with /
	# this path, with this md5 = this version
	files=[
	{:version=>'1.0',    :path=>"docs/install.html", :md5=>'d2748bb3397ec0de230ed0b6f460d307'},
	{:version=>'1.0.1',  :path=>"docs/install.html", :md5=>'578fa4261a4a8bb35389d07c112b924b'},
	{:version=>'1.2',    :path=>"docs/install.html", :md5=>'d5eda4db7271483b563213747a7fcd65'},
	{:version=>'1.2.1',  :path=>"docs/install.html", :md5=>'e39950020c0102948ceccdd30e01f8d3'},
	{:version=>'1.2.10', :path=>"docs/install.html", :md5=>'a96ce1acc811fa2dc99368185f1550a6'},
	{:version=>'1.2.11', :path=>"docs/install.html", :md5=>'2f686cf8cb8d4f32aa4f921a7b3ae3e9'},
	{:version=>'1.2.12', :path=>"docs/install.html", :md5=>'a88d9f44bdc1057ccdf488e9442944b2'},
	{:version=>'1.2.13', :path=>"docs/install.html", :md5=>'8b9553a0b9894e1488b97d6e8721ad3e'},
	{:version=>'1.2.14', :path=>"docs/install.html", :md5=>'b9754e06ddb051f3d7e66710cab79f90'},
	{:version=>'1.2.15', :path=>"docs/install.html", :md5=>'e47a0ae180d2428c20232cb641ca474f'},
	{:version=>'1.2.16', :path=>"docs/install.html", :md5=>'d50e093e34251b0a7c03ac3d45f64616'},
	{:version=>'1.2.17', :path=>"docs/install.html", :md5=>'ea5696cb9d85e692f0241565dd7cf007'},
	{:version=>'1.2.2',  :path=>"docs/install.html", :md5=>'8cf393c2a65c6d6865663f8335b49727'},
	{:version=>'1.2.3',  :path=>"docs/install.html", :md5=>'17c33dd4020226c34254956b71789991'},
	{:version=>'1.2.4',  :path=>"docs/install.html", :md5=>'1469f7c2d8647453d3a82294f9b000e5'},
	{:version=>'1.2.5',  :path=>"docs/install.html", :md5=>'2f683a8dc5c790364d9a1cdc337d460b'},
	{:version=>'1.2.6',  :path=>"docs/install.html", :md5=>'76b7473156af95d8df10f27510734f81'},
	{:version=>'1.2.7',  :path=>"docs/install.html", :md5=>'310e902cfb9f77a403fec67f03214cd8'},
	{:version=>'1.2.8',  :path=>"docs/install.html", :md5=>'7cb6e4e22b6795ea40f081ee846a2674'},
	{:version=>'1.2.9',  :path=>"docs/install.html", :md5=>'9159987d634a9d0cc678b9d51e84b466'},

	{:version=>'1.1.x', :path=>"img/smilies/sad.png", :md5=>'1be05e25934491d75e8f8af7609e56e2'},
	{:version=>'1.2.x', :path=>"img/smilies/sad.png", :md5=>'bdf6c4d929f95b28f4e33623797aaeb0'},
	{:version=>'1.3.x', :path=>"img/smilies/sad.png", :md5=>'02526986b095d2d745397efe5db47076'},

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


