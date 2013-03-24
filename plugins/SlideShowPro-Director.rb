##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SlideShowPro-Director" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-03-18
version "0.1"
description "Content management and universal slideshow publishing for desktops, Apple iOS and Android. - Homepage: http://slideshowpro.net/products/slideshowpro_director/"

# Google results as at 2013-03-18 #
# 161 for intitle:"SlideShowPro Director" "Lost Username" "Password" "Sign in" "Remember me"

# Dorks #
dorks [
'intitle:"SlideShowPro Director" "Lost Username" "Password" "Sign in" "Remember me"'
]

# Examples #
examples %w|
burn.slideshowpro.com/
www.annewhistonspirn.com/photographer/login/index.php?/
www.hokunaia.com/slideshow/director/
www.blondiesalon.com/slideshowpro/
www.jamestatumartist.com/slideshowpro/
www.tophotelhochgurgl.com/ssp_director/index.php?/
multimedia.thenational.ae/
beowulfsheehan.com/ssp_director/index.php?/
www.lucindawilliams.com/flash/ssp_director/index.php?/
www.tonynandi.co.uk/slideshowpro/
libraries.mit.edu/img/slideshows/
|

# Matches #
matches [

# /admin/ # Login Page # Version Detection
{ :version=>/<div id="simple-footer">\s+<span>SlideShowPro Director ([^<]+)<\/span>/ },

# /admin/ # Login Page
{ :text=>'</div> <!--close login-container-->	</body>' },

]

end

