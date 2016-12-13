##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Shadowed-Portal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "Shadowed Portal CMS- Homepage [offline] : http://www.shad0wed.com/"

# Google results as at 2011-03-14 #
# 21 for "Powered by Shadowed Portal" "These script's code is Copyright" -dork

# Dorks #
dorks [
'"Powered by Shadowed Portal" "These script\'s code is Copyright" -dork'
]



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.shad0wed.com\/"[^>]*>Shadowed Portal ([^<]+)<\/a>.<br \/>These script's code is Copyright &copy; 2003-20[\d]{2} by <a href="http:\/\/www.shadowedworks.com\/"[^>]*>Shadowed Works<\/a>.<br \/>Please be sure to read the <a href="http:\/\/www.shad0wed.com\/load.php\?mod=pages(&|&amp;)page=Terms_and_Conditions"[^>]*>Terms and Conditions<\/a> required for the use of these scripts./ },

]

end


