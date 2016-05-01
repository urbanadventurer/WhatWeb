##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.5 # 2016-05-1 # Brendan Coles
# Updated phpMyAdmin Cookie
##
# Version 0.4 # 2012-08-16 # Andrew Horton
# Updated MD5 syntax. In future someone should move the MD5 hash matches into the matches array
##
# Version 0.3 # 2011-04-06 #
# Added aggressive md5 matches
##
# Version 0.2 #
# Updated regex
# Added version detection
# Added favicon md5 hash
# Added cookie matches
##
Plugin.define "phpMyAdmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-01 
version "0.5"
description "phpMyAdmin is a free software tool written in PHP intended to handle the administration of MySQL over the World Wide Web."
website "http://www.phpmyadmin.net/home_page/index.php"

# Google results as at 2010-10-26 #
# 3,490 for +intitle:phpMyAdmin +"Language: Afrikaans" +"Welcome to phpMyAdmin"

# ShodanHQ results as at 2010-10-26 #
# 1,868 for pma_theme=original

# Dorks #
dorks [
'intitle:phpMyAdmin "Language: Afrikaans" "Welcome to phpMyAdmin"',
'inurl:main.php "Welcome to phpMyAdmin"'
]



# Matches #
matches [

# GHDB Match
{ :certainty=>75, :ghdb=>'intitle:phpMyAdmin "Language: Afrikaans" "Welcome to phpMyAdmin"' },

# Version Detection # Default Title
{ :version=>/<title>phpMyAdmin ([^\s^<]+)[^<]*<\/title>/ },

# Version Detection # Default heading HTML
{ :version=>/<h2>Welcome to  phpMyAdmin ([^<]+)<\/h2>/ },

# Default Logo HTML
{ :text=>'<img src="./themes/original/img/logo_right.png" id="imLogo" name="imLogo" alt="phpMyAdmin" border="0" /></a>' },

# Default logo
{ :md5=>"d037ef2f629a22ddadcf438e6be7a325", :url=>"favicon.ico" },

# Login page # Default form HTML
{ :regexp=>/<form method="post" action="index\.php" target="_(top|parent)"><input type="hidden" name="phpMyAdmin" value="/ },

]

# Passive #
def passive
	m=[]

	# Cookies
	m << {:name=>"phpMyAdmin Cookie" } if @headers["set-cookie"] =~ /phpMyAdmin=[a-z0-9]+/
	m << {:name=>"pma_theme Cookie" } if @headers["set-cookie"] =~ /pma_theme=original/

	# Return passive matches
	m
end

# Aggressive #
def aggressive
	m=[]

# the paths are relative to the url path if they don't start with /
# this path, with this md5 = this version
files=[
{:version=>'2.10.0',  :md5=>'4c06efa60065abe716e32229fc273c01', :path=>"README"},
{:version=>'2.10.0.1', :md5=>'a45ea22038859ea43ca3939e48095994', :path=>"README"},
{:version=>'2.10.0.2', :md5=>'fb5ed3d88acf3597286f99852e355d8e', :path=>"README"},
{:version=>'2.10.1',  :md5=>'7af790f225d73a9ce817cca8e37691b3', :path=>"README"},
{:version=>'2.10.2',  :md5=>'edd3f3669d6164e50046eedf3c753279', :path=>"README"},
{:version=>'2.10.3',  :md5=>'5b1f00a05f693c3e13806afe431d6487', :path=>"README"},
{:version=>'2.11.0',  :md5=>'55947bd70e5c25272121e390fcf8c897', :path=>"README"},
{:version=>'2.11.1',  :md5=>'35dd8265cee0571d3b322d1f2e787b75', :path=>"README"},
{:version=>'2.11.1.1', :md5=>'278d9a6aeb935f770bb89e1dfe412719', :path=>"README"},
{:version=>'2.11.1.2', :md5=>'0d861d29b2e2048a63ac051f36a3f361', :path=>"README"},
{:version=>'2.11.10', :md5=>'4d9578575978d5d8ed4a47756c01c3ca', :path=>"README"},
{:version=>'2.11.2',  :md5=>'18b673f7ef447040b49e16f6b976eec6', :path=>"README"},
{:version=>'2.11.2.1', :md5=>'aa29c13828d254bee5e48bba193cbe29', :path=>"README"},
{:version=>'2.11.2.2', :md5=>'c0f2ca0bb9bc877a0c58656b1de8e153', :path=>"README"},
{:version=>'2.11.3',  :md5=>'05c87ad89a504992db504f0bf95bc11f', :path=>"README"},
{:version=>'2.11.4',  :md5=>'fa26c5c4b46d9f1b59b0d5ee83815b19', :path=>"README"},
{:version=>'2.11.5',  :md5=>'16335f02ce528df4b606ac238b024988', :path=>"README"},
{:version=>'2.11.5.1', :md5=>'4e91eceb7ce42b1642d10d81e93b9230', :path=>"README"},
{:version=>'2.11.5.2', :md5=>'29f019f69ea21678a5d5f2eb2bd6dfe4', :path=>"README"},
{:version=>'2.11.6',  :md5=>'02f9f9e2fd8edab7feaae9e571ca593a', :path=>"README"},
{:version=>'2.11.7',  :md5=>'c7a5c33922615b9f180967f5c921c3c5', :path=>"README"},
{:version=>'2.11.7.1', :md5=>'cdd7ef1b46ab6c078a33eacf158481b0', :path=>"README"},
{:version=>'2.11.8',  :md5=>'2cb1d469710c7f12b948551b6984010b', :path=>"README"},
{:version=>'2.11.8.1', :md5=>'11e77de74849fd026cd473e9c88ddd94', :path=>"README"},
{:version=>'2.11.9',  :md5=>'c8b1da9b3680e561e74502df451a35c7', :path=>"README"},
{:version=>'2.11.9.1', :md5=>'664f52aaf2dd92bf1a5f8f60bbcdd4b7', :path=>"README"},
{:version=>'2.11.9.2', :md5=>'bc6f08397c045689b24a1fab8fb9e549', :path=>"README"},
{:version=>'2.11.9.3', :md5=>'4743249c31f5de1752cbc08b1599c045', :path=>"README"},
{:version=>'2.11.9.4', :md5=>'254e8e8d4296528a3508a9dd7c5f44b2', :path=>"README"},
{:version=>'2.11.9.5', :md5=>'de4786ec584fd2b9eaae86bf6a9e7857', :path=>"README"},
{:version=>'2.11.9.6', :md5=>'9469b91f4b2bb119bf904a9765510c56', :path=>"README"},
{:version=>'2.11.11.3', :md5=>'37897ebc2d024c7d113a957a1b5ea782', :path=>"README"},
{:version=>'2.2.0',   :md5=>'9f1f13d075044b51b247a767b313cb2d', :path=>"README"},
{:version=>'2.2.x',   :md5=>'229f99fde3366a8f952ef5fc46d027b0', :path=>"README"},
{:version=>'2.2.1 - 2.2.5', :md5=>'6482a96f3e86cfa7f056b5ade23b8ecb', :path=>"README"},
{:version=>'2.2.6',   :md5=>'e7006399103e0126a2badc4acf7845cb', :path=>"README"},
{:version=>'2.2.7pl1', :md5=>'11c7c0a0bdd3a225d60269cf74d2b331', :path=>"README"},
{:version=>'2.3.0',   :md5=>'c98c4eaf0da9222c2c06d02d585fd023', :path=>"README"},
{:version=>'2.3.1 - 2.5.2', :md5=>'f0ad142b2ef7ea53964d05ccdeb52035', :path=>"README"},
{:version=>'2.5.3',   :md5=>'1d90d370466f7a52136adde0c6bfb108', :path=>"README"},
{:version=>'2.5.3-rc3', :md5=>'29de96781e63cbb4af6951796d12c5bf', :path=>"README"},

{:version=>'2.5.4',   :md5=>'469c3c2cd68859b62f1653ffffc95cd4', :path=>"README"},
{:version=>'2.5.4',   :md5=>'cd5fd08b00f36b08b272131440e326c5', :path=>"README"},

{:version=>'2.5.5-pl1', :md5=>'3d8de5d32895269e7f04d44016eb2028', :path=>"README"},
{:version=>'2.5.6',   :md5=>'f168cb1403bbfad7ab2cbbfed747a152', :path=>"README"},

{:version=>'2.5.7-pl1', :md5=>'07ed831d01abf90cf2211fdb5ad10d60', :path=>"README"},
{:version=>'2.5.7-pl1', :md5=>'861e09a07e2e1c502362b36589aa5eeb', :path=>"README"},

{:version=>'2.6.0-pl3', :md5=>'c4b88ca54187fb1d54dcbefe2f6627de', :path=>"README"},
{:version=>'2.6.1', :md5=>'4c8aa8016b9e3c73ef792f46053a53cc', :path=>"README"},

{:version=>'2.6.1-pl3', :md5=>'b76786f301a739be5495cb8c843ecde7', :path=>"README"},
{:version=>'2.6.1-pl3', :md5=>'cb1dd403025b43b603266e048ec6eb20', :path=>"README"},

{:version=>'2.6.2', :md5=>'9388aa6172a45d99921f75af2555ec4e', :path=>"README"},

{:version=>'2.6.2-pl1', :md5=>'5d4c438de835d784d4c8280f585434fb', :path=>"README"},
{:version=>'2.6.2-pl1', :md5=>'dd4386d57907669bce9d10817104af58', :path=>"README"},

{:version=>'2.6.3-pl1', :md5=>'0842c25861357b5e535b4ac93a862f09', :path=>"README"},
{:version=>'2.6.3-pl1', :md5=>'343b4a43789d98472dd388e42b809675', :path=>"README"},

{:version=>'2.6.4-pl1', :md5=>'8ff307e9122053b8f14650d348c04119', :path=>"README"},
{:version=>'2.6.4-pl4', :md5=>'b981f65409134362ce0441c02983a500', :path=>"README"},
{:version=>'2.7.0-pl2', :md5=>'6f18db3f3e9d4ae425e96c8c58398a42', :path=>"README"},
{:version=>'2.8.0.3', :md5=>'89a0f6c94833a0c502a83e5a8defcdbd', :path=>"README"},
{:version=>'2.8.0.4', :md5=>'51eba4598063b26ea2d5ac091d5cc21b', :path=>"README"},
{:version=>'2.8.1',   :md5=>'9f0fb027d48fdc5c308f504430cd08db', :path=>"README"},
{:version=>'2.8.2.4', :md5=>'fd9ebbd6a011f5c068e3fede5bf3e8c0', :path=>"README"},
{:version=>'2.9.0',   :md5=>'f006341b331ca5fbc86e05f8054f08cf', :path=>"README"},
{:version=>'2.9.0.1', :md5=>'065f4a7e6a2cf4937232d9bece285bcf', :path=>"README"},
{:version=>'2.9.0.2', :md5=>'9961106d6d6b87c95d1ccb7114d69626', :path=>"README"},
{:version=>'2.9.0.3', :md5=>'a23133f8890ef36cf177e39096c4defc', :path=>"README"},
{:version=>'2.9.1.1', :md5=>'17333514823c2fab1587988940fa16fd', :path=>"README"},
{:version=>'2.9.2',   :md5=>'c11bdc89e1f8d5f3aa66b3c479b2bd7c', :path=>"README"},
{:version=>'3.0.0',   :md5=>'14a3933f1f0f6dea11c4471f616039c5', :path=>"README"},
{:version=>'3.0.1',   :md5=>'b32b9f3e08ff848adcd4c172d35ca1af', :path=>"README"},
{:version=>'3.0.1.1', :md5=>'aa7c4a696752d466f64fde54686c0569', :path=>"README"},
{:version=>'3.1.0',   :md5=>'999b10c93f593d1378af0751759c3670', :path=>"README"},
{:version=>'3.1.1',   :md5=>'8eec96ced6f4802906611c1c0ed2aa98', :path=>"README"},
{:version=>'3.1.2',   :md5=>'c12c9f4087a50a7050fee87be17d11b9', :path=>"README"},
{:version=>'3.1.3',   :md5=>'fe9aebf3468d3bfc3a709ba41d6e191a', :path=>"README"},
{:version=>'3.1.3.1', :md5=>'a4e63bea00c15b0f294e76f427de0131', :path=>"README"},
{:version=>'3.1.3.2', :md5=>'a762a17361517f63e384a8d0d1169362', :path=>"README"},
{:version=>'3.1.4',   :md5=>'c0c2091119b7ba461c115230d08eb883', :path=>"README"},
{:version=>'3.1.5',   :md5=>'2ba54b620a956ad7c3fd84246b6dbb58', :path=>"README"},
{:version=>'3.2.0',   :md5=>'e1f67893278797cb1f5b0406d31ca8fc', :path=>"README"},
{:version=>'3.2.0-beta1', :md5=>'8943be66720f7a1b0aff984385e27942', :path=>"README"},
{:version=>'3.2.0-rc1', :md5=>'0d8f87ce919fadc5ca61104017eecd42', :path=>"README"},
{:version=>'3.2.0.1', :md5=>'9b72351e14fba81418e91daccdfe6c00', :path=>"README"},
{:version=>'3.2.1',   :md5=>'0c4a45f27334416679ca94a2ec31b6f4', :path=>"README"},
{:version=>'3.2.2',   :md5=>'e79743b0ce7e3d729e8a6216ea082a4c', :path=>"README"},
{:version=>'3.2.2.1', :md5=>'eddb65b391a790007cbfb6403a9d3c59', :path=>"README"},
{:version=>'3.2.3',   :md5=>'03b2591998bfe265766c8744796a2d2d', :path=>"README"},
{:version=>'3.2.4',   :md5=>'fdff087103e3cd763446bc7336decbaf', :path=>"README"},
{:version=>'3.3.4-rc1', :md5=>'ce8bee6859e51915a83c27183cf6c1ea', :path=>"README"},
{:version=>'3.3.7', :md5=>'71168994d7bce6ce5351c5bd51f885d4', :path=>"README"},
{:version=>'3.3.9', :md5=>'d28393c2956e278570e6876fad3fce2e', :path=>"README"},
{:version=>'3.3.9.2', :md5=>'6fa959ab76b2eebedc21c1f5056415a4', :path=>"README"},
{:version=>'3.3.10', :md5=>'faced5f008177dacea61ed953ec799e2', :path=>"README"},
{:version=>'3.3.11-dev', :md5=>'3493c96f533215e62409dd8ab07126b8', :path=>"README"},
{:version=>'3.4.0-beta4', :md5=>'1ee74431ac623654fd9a3dc2a3717c45', :path=>"README"},

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

        # Extract version from Documentation.html (README is not present in debian package)
	target = URI.join(@base_uri.to_s, "Documentation.html").to_s
	status,url,ip,body,headers=open_target(target)

	if body =~ /<title>phpMyAdmin ([^\s^<]+)[^<]*<\/title>/
		version = body.scan(/<title>phpMyAdmin ([^\s^<]+)[^<]*<\/title>/)[0].to_s
		m << {:name=>"Documentation version", :version=>version }
	end

	# Return aggressive matches
	m
end

end

