##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-17 # Andrew Horton
# Added website parameter and description
##
# Version 0.2
# removed :certainty=>100
##
Plugin.define "SnomPhone" do
author "Andrew Horton"
version "0.3"
description "VoIP phones and teleconferencing systems"
website "http://www.snom.com/"

# Dorks #
dorks [
'"You can enter a simple telephone number (e.g. 0114930398330) or URI like info@snom.com."'
]

# &copy; 2000-2008 <a href="http://snom.com">snom AG</a><br>
# <tr><td class="flyoutLink" colspan="2"><b><a href=http://wiki.snom.com/wiki/index.php/snom300>Manual</a>
# You can enter a simple telephone number (e.g. 0114930398330) or URI like info@snom.com.
# <td class="headerText" width="705">Welcome to Your Phone!</td>
# <tr><td class="flyoutLink" colspan="2"><b><a href=http://www.snom.com/wiki/index.php/snom360>Manual</a>

# Matches #
matches [

{:name=>"copyright snom.com", :regexp=>/&copy; 2000-20[0-9]+ <a href="http:\/\/snom.com">snom AG<\/a><br>/ },
{:name=>"link to manual1", :regexp=>/<tr><td class="flyoutLink" colspan="2"><b><a href=http:\/\/(wiki|www).snom.com/ },
{:text=>'You can enter a simple telephone number (e.g. 0114930398330) or URI like info@snom.com.' },
{:certainty=>75, :regexp=>/<td[^>]+>Welcome to Your Phone!<\/td>/ },

]

end



