##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.4
# removed :probability & :name
# Version 0.5
# uses :modules instead of :string, changed the 3rd regexp from 75 certainty to 25.
# Version 0.6
# added seconds since epoch match from the mambo plugin

Plugin.define "Joomla" do
author "Andrew Horton"
version "0.6"
description "Opensource CMS written in PHP. Homepage: http://joomla.org. Plugin can aggresively identify version by comparing md5 hashes of 4 files. Valid up to version 1.5.15."

examples %w|biokolchuga.com cosmicfantasia.net.au rustedfables.com turning2joomla.com www.1000usi.ch www.allananova.com www.azrul.com www.bittdesign.nl www.clubjoomla.com www.danone.com www.imusictools.com www.joomla.org www.joomlawebdesigns.com www.livelovehope.org |

#index.php?option=com_content&

# identifying strings
#<meta name="generator" content="Joomla! 1.5 - Open Source Content Management" />
# older joomla
#<meta name="Generator" content="Joomla! - Copyright (C) 2005 - 2007 Open Source Matters. All rights reserved." />
matches [
{:version=>"1.0", :regexp=>/<meta name="Generator" content="Joomla! - Copyright \(C\) 200[0-9] - 200[0-9] Open Source Matters. All rights reserved." \/>/},
{:version=>"1.5", :text=>'<meta name="generator" content="Joomla! 1.5 - Open Source Content Management" />'},
{:certainty=>25, :regexp=>/<a href="[^"]*index.php\?option=com_/}
]



def passive
	m=[]
#	http://www.porsche.com.br/component/option,com_artbanners/Itemid,0/task,clk/id,45/">
#   <a href="http://www.porsche.com.br/index.php?option=com_content&task=view&id=242&Itemid=235">Galeria</a>


	# joomla 1.0 + mambo have this
	if @body.scan(/<\/html>.*(\n)*<!-- [0-9]+.*-->(\n)*\z/) and !@body.scan(/mambo/i)
		m << {:name=>"seconds since epoch in html comment afer </html>",:version=>"1.0",:certainty=>25}
	end


	# get modules, doesn't work in SEO mode
	if @body =~ /<a href="[^"]*index.php\?option=com_/
		modules = @body.scan(/<a href="[^"]*index.php\?option=(com_[^&"]+)/).flatten.compact.sort.uniq		
		m << {:certainty=>75,:modules=>modules}
	end
	
	# phpcake has this string too	
	m << {:name=>"P3P Privacy Headers", :certainty=>25 } if @meta["p3p"] == "CP=\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\""	
	m
end

def aggressive

	# get more urls, check md5sums
=begin
				/language/en-GB/en-GB.ini			/administrator/language/en-GB/en-GB.ini	/administrator/language/en-GB/en-GB.xml		/plugins/editors/tinymce.xml
Joomla-1.5.0	903fb75f4369d78373b7b00db1c86c20	d80eae132ce6388dec5d0358304e1d01		97dc186a935a9934ffea258cea80ccf3			ff546c69031508003813804477e4d656
Joomla-1.5.1  	be9408d25f37e91111caefca9b07f7d9 	f29d32a0e552fa97ffa1ff734d993c33		97dc186a935a9934ffea258cea80ccf3			ff546c69031508003813804477e4d656
Joomla-1.5.2  	630486389fb8b81bd17417acdf82534d 	557efbb161ba45b07cdf1b524b8e261e		ff479e4f49c099208728077a6cc02f39			ff546c69031508003813804477e4d656
Joomla-1.5.3  	7ce67c338528faac3870827d439daa8e 	d31cbdea7fcfddf450319f333ff75d79		ff479e4f49c099208728077a6cc02f39			ff546c69031508003813804477e4d656
Joomla-1.5.4  	18bcc3be286f5c9ee03b211c3fcc02f6	d7961bdd2528bf4bfc505b1d44920edd 		ff479e4f49c099208728077a6cc02f39			ff546c69031508003813804477e4d656
Joomla-1.5.5  	18bcc3be286f5c9ee03b211c3fcc02f6	36a0b9af0fb86d84f51d2cfeef7577e8		ff479e4f49c099208728077a6cc02f39 [5&6]		ff546c69031508003813804477e4d656
Joomla-1.5.6  	18bcc3be286f5c9ee03b211c3fcc02f6	36a0b9af0fb86d84f51d2cfeef7577e8		ff479e4f49c099208728077a6cc02f39			ff546c69031508003813804477e4d656
Joomla-1.5.7  	18bcc3be286f5c9ee03b211c3fcc02f6  	36a0b9af0fb86d84f51d2cfeef7577e8		2629ad61fae0ff36fd2b2715a8defbcf			ff546c69031508003813804477e4d656
Joomla-1.5.8	fb5fcb1739656a7056573a1f04feb294	619004137db98efca550609eac13204e		3747e98219b70ae68510c54246029735			ff546c69031508003813804477e4d656
Joomla-1.5.9	75586cfdf36020bdbfe66bd90072fb07	5516cf074a67bb54bbdb4fd9c340574d		f0ba735dd9f9ffe238a2acf296a38611			ff546c69031508003813804477e4d656
Joomla-1.5.10	75586cfdf36020bdbfe66bd90072fb07	a8b4a2477bc332f9039828c45aea92c2		f0ba735dd9f9ffe238a2acf296a38611			ff546c69031508003813804477e4d656
Joomla-1.5.11	75586cfdf36020bdbfe66bd90072fb07  	c42788d652d97e2a103a7dcd3d507789		f0ba735dd9f9ffe238a2acf296a38611			ff546c69031508003813804477e4d656
Joomla-1.5.12	45907aad7ad3fae5b2859caff35e68fe  	1af3cb82c9a106a9479c1915bae512e1		f0ba735dd9f9ffe238a2acf296a38611			88c25322c0e878b6944cf9ea462c5071
Joomla-1.5.13	45907aad7ad3fae5b2859caff35e68fe  	1af3cb82c9a106a9479c1915bae512e1		f0ba735dd9f9ffe238a2acf296a38611			e6537f60fc9e6a04eda14d55f852a9d8
Joomla-1.5.14	45907aad7ad3fae5b2859caff35e68fe  	1af3cb82c9a106a9479c1915bae512e1		f0ba735dd9f9ffe238a2acf296a38611			e6537f60fc9e6a04eda14d55f852a9d8
Joomla-1.5.15	449d7bb356fcefa1343d72d203297438  	dedb7fdc930f76d32def6c89523711f1		ca05270bb8b29fa22bc43ada00a89eb6			376593ec7b3fa8378e4338d105619090

1.5.0 - 1.5.3   X
1.5.4												X
1.5.5 (1.5.6)	X									X										X
1.5.7																						X
1.5.8			X
1.5.9												X
1.5.10												X
1.5.11												X
1.5.12																																	X
1.5.13 (1.5.14)																															X
1.5.15			X
=end
m=[]

to_download = %w| language/en-GB/en-GB.ini administrator/language/en-GB/en-GB.ini administrator/language/en-GB/en-GB.xml plugins/editors/tinymce.xml|

downloads={}
to_download.each do |d|	
	target = URI.join(@base_uri.to_s,d).to_s	
	status,url,ip,body,headers=open_target(target)
	downloads[d] = {:md5sum=>MD5.new(body).to_s}	
end

# this could be improved on. 
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

unless version.nil?
	m << {:name=>"md5sums of 4 files", :version=>version}
end	

m
end

end


