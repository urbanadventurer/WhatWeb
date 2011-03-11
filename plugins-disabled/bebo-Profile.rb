##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "bebo-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "This plugin extracts a person's name, country, gender and their friends' names from their bebo profile - homepage: http://bebo.com/"

# Google results as at 2011-01-16 #
# 144 for intitle:"bebo.com - Profile from"

# Examples #
examples %w|
http://www.bebo.com/crimestoppers
http://www.bebo.com/itdoesnthavetohappen
http://www.bebo.com/Profile.jsp?MemberId=1988068648
http://www.bebo.com/Profile.jsp?MemberId=1291026269
http://www.bebo.com/Profile.jsp?MemberId=1398176763
http://www.bebo.com/Profile.jsp?MemberId=3732493735
http://www.bebo.com/Profile.jsp?MemberId=8346464
http://www.bebo.com/Profile.jsp?MemberId=4050338547
http://www.bebo.com/Profile.jsp?MemberId=6365506443
http://www.bebo.com/Profile.jsp?MemberId=7161089119
http://www.bebo.com/Profile.jsp?MemberId=1384495306
http://www.bebo.com/Profile.jsp?MemberId=4885783813
http://www.bebo.com/Profile.jsp?MemberId=3445438819
|

# Matches #
matches [

	# Name :
	{ :version=>/<title>bebo.com - Profile from ([^&]*) &lt;[^&]*&gt;<\/title>/ },

	# Username :
	{ :account=>/<title>bebo.com - Profile from [^&]* &lt;([^&]*)&gt;<\/title>/ },

	# Gender :
	{ :string=>/DynamicValues = \{"FacebookConnect":\{"appId":"[0-9]+"\},"Viximo":\{"memberLocale":"[^\"]*","creatorUid":"[0-9]+","creatorName":"[^\"]*","memberCountry":"[^\"]*","creatorGender":"([^\"]*)"/ },

	# Country :
	{ :string=>/DynamicValues = \{"FacebookConnect":\{"appId":"[0-9]+"\},"Viximo":\{"memberLocale":"[^\"]*","creatorUid":"[0-9]+","creatorName":"[^\"]*","memberCountry":"([^\"]*)","creatorGender":"[^\"]*"/ },

	# Friends :
	{ :filepath=>/<span class="thumb-label"><a href="\/Profile\.jsp\?MemberId=[0-9]+" title="([^\"]*)">[^\<]*<\/a><\/span>/ },

	# Number of Friends :
	{ :string=>/<li class="first">[0-9]+ of <a href="\/FriendList\.jsp\?MemberId=[0-9]+">([^<]*)<\/a><\/li>/ },


]

end


