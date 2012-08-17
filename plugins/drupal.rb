##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
# Version 0.4 # 2012-08-16 # Andrew Horton
# Updated MD5 syntax. In future someone should move the MD5 hash matches into the matches array
##
# Version 0.3 # 2011-04-09 # Brendan Coles <bcoles@gmail.com>
# Added aggressive md5 matches
##
# Version 0.2
# removed :name and :certainty=>100
##
Plugin.define "Drupal" do
author "Andrew Horton"
version "0.4"
description "Drupal is an opensource CMS written in PHP. Homepage: http://www.drupal.org"

# ShodanHQ results as at 2012-05-29 #
# 6,646 for drupal.org
# 2,790 for x-drupal-cache
#    50 for mobileplugin_group

# Google results as at 2011-09-17 #
# 876 for inurl:/user/register +"Powered by Drupal"

# Dorks #
dorks [
'inurl:/user/register "Powered by Drupal"'
]

# Examples #
examples %w| amnesty.org/ appel.nasa.gov/ beta.worldbank.org/ entergy.pewclimate.org/ labs.divx.com/ lindenlab.com/ littlestarprints.com moby.com/ myplay.com/ sequelnaturals.com/ teen.secondlife.com/ www.artwaves.de www.asys.com.br/ www.atomicbop.net www.cristal.com.pe/?adulto=si www.dutchbutnotfromholland.eu/ www.elespectador.com/ www.ensembles.com.ph/ www.foxsearchlight.com/index.php www.freshbrain.org/ www.icsalabs.com/ www.johnnycashonline.com/ www.journalismcenter.org/ www.jovenscriativos.com.br/ www.koalafoundation.org.au/ www.la2day.com/ www.moove.be www.mtv.co.uk/channel/flux www.mulinobianco.it/ www.multiways.com/ www.nowpublic.com/ www.pravda.lt/ www.realismssoftware.com/ www.save-your-future.com www.shock.com.co/ www.sosojuicy.com/ www.spreadfirefox.com/ www.tidningenresultat.se www.ubuntu.com/ www.universitytowers.net/ www.warnerbrosrecords.com 116.12.54.172 97.107.131.55 194.78.165.246 174.143.214.105 79.125.13.223 195.34.165.6 64.207.153.57 62.149.1.2 184.72.243.245 209.235.237.98 81.137.254.82 23.21.133.51 184.172.190.100 74.204.112.71 106.187.54.63 130.207.32.161 202.27.28.168 69.195.78.78 67.222.35.207 75.56.232.150|

# Matches #
matches [

# JavaScript
{:regexp=>/<script type="text\/javascript" src="[^\"]*\/misc\/drupal.js[^\"]*"><\/script>/},

# alt text
{:regexp=>/<[^>]+alt="Powered by Drupal, an open source content management system"/},

# Stylesheet
{:regexp=>/@import "[^\"]*\/misc\/drupal.css"/},

# JavaScript
{:text=>'jQuery.extend(Drupal.settings,'},
{:certainty=>75, :text=>'Drupal.extend('},

# SESS Drupal Cookie
{ :name=>"SESS Drupal Cookie", :certainty=>75, :search=>"headers[set-cookie]", :regexp=>/^SESS[a-z0-9]{32}=[a-z0-9]{32}/ },

# Mobile Plugin Cookie
{ :module=>"Mobile Plugin", :name=>"Mobile Plugin Cookie", :search=>"headers[set-cookie]", :regexp=>/mobileplugin_group=/ },

# x-drupal-cache Header
{ :search=>"headers[x-drupal-cache]", :regexp=>/(HIT|MISS)/ },

# X-Generator Header
{ :search=>"headers[x-generator]", :version=>/^Drupal ([^\s]+) \(http:\/\/drupal\.org\)$/ },

]

# Aggressive #
def aggressive
	m=[]

# the paths are relative to the url path if they don't start with /
# this path, with this md5 = this version
files=[

{ :md5=>'dc0fbe017fd1cc3d97b8c12bc45dde41', :version=>'4.7.x', :path=>'misc/drupal.js' },
{ :md5=>'f151220aded688adf35c623a17a0147a', :version=>'4.7.0-beta3', :path=>'misc/drupal.js' },
{ :md5=>'476482ca90e5ba941b43cdfbde04d03c', :version=>'4.7.0-beta4', :path=>'misc/drupal.js' },
{ :md5=>'c25d79ddd0ab2ed014e19918955ba305', :version=>'4.7.0-beta5 or 4.7.0-beta6', :path=>'misc/drupal.js' },
{ :md5=>'179dc761149f23569d95011cc816e981', :version=>'4.7.0-rc1', :path=>'misc/drupal.js' },
{ :md5=>'316dc20843384ab2760022694ad46ab5', :version=>'4.7.0-rc2 or 4.7.0-rc3', :path=>'misc/drupal.js' },
{ :md5=>'98cd0c4c8bde66a3227ce1d583f433f4', :version=>'4.7.2 or 4.7.3', :path=>'misc/drupal.js' },
{ :md5=>'3130d555431177091ff7ac5b4f3fe19e', :version=>'4.7.4', :path=>'misc/drupal.js' },
{ :md5=>'dd465695d5ae35ecc33c8cad33f7880c', :version=>'4.7.5 - 4.7.11', :path=>'misc/drupal.js' },
{ :md5=>'afd188dc6cd982d37463209679ab01ec', :version=>'5.0 - 5.1', :path=>'misc/drupal.js' },
{ :md5=>'9e557006e956d365119eb2ebd2169051', :version=>'5.2 - 5.9', :path=>'misc/drupal.js' },
{ :md5=>'2c5e4277fec6afac333e913744e0408f', :version=>'5.10 - 5.16', :path=>'misc/drupal.js' },
{ :md5=>'4677b027fed107133090dabccee2b4f5', :version=>'5.17 - 5.21', :path=>'misc/drupal.js' },
{ :md5=>'ebbcc0156242a08a25c596432ca92f67', :version=>'6.0', :path=>'misc/drupal.js' },
{ :md5=>'1c264213d843edbb232494511a1041b9', :version=>'6.0-beta1', :path=>'misc/drupal.js' },
{ :md5=>'e383c0fdd397c0f12d57fdf6dd9c4ab0', :version=>'6.0-x', :path=>'misc/drupal.js' },
{ :md5=>'7082fbcedd60f675111cfa387dd59b00', :version=>'6.0-rc2 or 6.0-rc3', :path=>'misc/drupal.js' },
{ :md5=>'ebbcc0156242a08a25c596432ca92f67', :version=>'6.0-rc4', :path=>'misc/drupal.js' },
{ :md5=>'2ff7dc985e57d1139ce4dc844b06bc64', :version=>'6.1 or 6.2', :path=>'misc/drupal.js' },
{ :md5=>'398b3832c2de0a0ebd08cb7f2afe1545', :version=>'6.3 - 6.13', :path=>'misc/drupal.js' },
{ :md5=>'88682723723be277fb57c0d8e341c0cf', :version=>'6.14 - 6.20', :path=>'misc/drupal.js' },
{ :md5=>'cb392dbb30f9d1f60ad9111ff04ec76f', :version=>'7.x', :path=>'misc/drupal.js' },
{ :md5=>'847afc6e14d280e66a564194e166a66e', :version=>'7.x', :path=>'misc/drupal.js' },

{ :md5=>'049b663495feb2dd2711cd15ced57c33', :version=>'4.2.0', :path=>'misc/drupal.css' },
{ :md5=>'86ee0ad8c19c96802f58f7d3c80a1bfa', :version=>'4.3.0 - 4.3.2', :path=>'misc/drupal.css' },
{ :md5=>'1ac2a22c7c0ce23abe186d76c4d251c3', :version=>'4.4.0 - 4.4.3', :path=>'misc/drupal.css' },
{ :md5=>'b9034cf9306d869c36616c5813eef31c', :version=>'4.5.0 or 4.5.1', :path=>'misc/drupal.css' },
{ :md5=>'041b90405d369eb5953ebf39317b94a3', :version=>'4.5.2 - 4.5.6', :path=>'misc/drupal.css' },
{ :md5=>'b690fd502bbd3770508ba9c552f9b8a7', :version=>'4.5.7', :path=>'misc/drupal.css' },
{ :md5=>'041b90405d369eb5953ebf39317b94a3', :version=>'4.5.8', :path=>'misc/drupal.css' },
{ :md5=>'1e94fde1440a3a5fc3235e85ae4ec264', :version=>'4.6.0', :path=>'misc/drupal.css' },
{ :md5=>'bddf11eb117a1729906797bd22e3436b', :version=>'4.6.x', :path=>'misc/drupal.css' },
{ :md5=>'94c5a7d8807b9ea6a6123751f3b6ab9d', :version=>'4.6.5', :path=>'misc/drupal.css' },
{ :md5=>'4dede1e52c41cbdbc81889375e0a9728', :version=>'4.7.0', :path=>'misc/drupal.css' },
{ :md5=>'f8448a4d6c6f0a1a0dd910fc7fc54377', :version=>'4.7.0-beta3', :path=>'misc/drupal.css' },
{ :md5=>'bbd97ab6662c17313dc779d08237b845', :version=>'4.7.0-beta4', :path=>'misc/drupal.css' },
{ :md5=>'e89eec8214eb000899279e49470da4cc', :version=>'4.7.0-beta5', :path=>'misc/drupal.css' },
{ :md5=>'106c3de80afec82dc572dddcd6fec44f', :version=>'4.7.0-beta6', :path=>'misc/drupal.css' },
{ :md5=>'e68496c423508e04f62f049c78432432', :version=>'4.7.0-rc1', :path=>'misc/drupal.css' },
{ :md5=>'07195254c1be0303f0638f25333e9b74', :version=>'4.7.0-rc2', :path=>'misc/drupal.css' },
{ :md5=>'4dede1e52c41cbdbc81889375e0a9728', :version=>'4.7.0-rc3 or 4.7.0-rc4', :path=>'misc/drupal.css' },
{ :md5=>'a10833aa1fa69cf9cb94ff9f129bdefe', :version=>'4.7.1 or 4.7.2', :path=>'misc/drupal.css' },
{ :md5=>'717d81e5ba0b3248111eb64043efbd4e', :version=>'4.7.3 or 4.7.4', :path=>'misc/drupal.css' },
{ :md5=>'f08a47da41387a1d2f4dff983369ec17', :version=>'4.7.5 - 4.7.11', :path=>'misc/drupal.css' },

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

