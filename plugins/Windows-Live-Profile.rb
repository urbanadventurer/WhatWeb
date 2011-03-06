##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Windows-Live-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "This plugin extracts a person's name, interests, birthday and friend's names from their Windows Live Profile profile - homepage: http://live.com/"

# About 3,780,000 results for inurl:"*.profile.live.com" intitle:"profile - windows live" @ 2011-01-16

# Examples #
examples %w|
cid-3368e216933b0a27.profile.live.com
cid-158948ae42ec57ae.profile.live.com
cid-9ddd81c692f10484.profile.live.com
cid-084a4e81d4216223.profile.live.com
cid-38da7048a5c10891.profile.live.com
cid-9db6e0c68d0e8c29.profile.live.com
cid-f0f1c815a414945b.profile.live.com
cid-f0264f4709834e11.profile.live.com
cid-e6fa1b5589278059.profile.live.com
cid-588cf373b44941ba.profile.live.com
cid-41c2c99e7429590d.profile.live.com
cid-6841b2f6eae3dd6b.profile.live.com
|

# Matches #
matches [

	# Name :
	{ :version=>/<span  id="ic3" class="c_ic_i"><span  class="c_ic_name" id="ic3_name" title="([^\"]*)">/, :url=>"/details" },
	{ :version=>/<div  id="ic[0-9]+"  class="c_ic c_ic_h_xl"><div class="c_ic_img_h c_ic_img_xl"><div class="c_ic_img_sub c_ic_img_xl" id="ic[0-9]+_usertilecontainer"><a  id="ic2_frame_clip" title="Picture of ([^\"]+)" class="c_ic_frame_clip c_ml" target="_top" href="/ },

	# Friends
	{ :filepath=>/<div class="L_FloatLeft frex_friend"><div  id="ic[0-9]+"  class="c_ic c_ic_v_m_t"><div class="c_ic_img_v c_ic_img_m"><div class="c_ic_img_sub c_ic_img_m" id="ic[0-9]+_usertilecontainer"><a  id="ic[0-9]+_frame_clip" title="Picture of ([^\"]*)" class="c_ic_frame_clip c_ml" target="_top" href="/ },

	# Birthday :
	{ :model=>/<div class="sn_aboutme_heading" >Birthday<\/div><div class="sn_aboutme_text sn_aboutme_textOverflow" title="">([^<]*)<\/div>/ },

	# Interests :
	{ :string=>/Interests&#58;[\W]*<\/td>[\W]*<td id="intVal" class="cd_value cd_rowElementPadding">[\W]*([^<^\r^\n]*)[\W]*<\/td>/, :url=>"/details" },

]

end


