##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "JagoanStore-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-04
version "0.1"
description "JagoanStore CMS"
website "http://www.jagoanstore.com/"

# Google results as at 2011-09-04 #
# 57 for "Toko Online ini menggunakan JagoanStore CMS dari JagoanWeb Indonesia"



# Dorks #
dorks [
'"Toko Online ini menggunakan JagoanStore CMS dari JagoanWeb Indonesia"'
]

# Matches #
matches [

# Copyright footer
{ :text=>'CMS <a style="color:#fff;font-size:11px;" href="http://www.jagoanstore.com/" target="_blank">Toko Online</a> by <a href="http://www.jagoanstore.com/" target="_blank"><img src="http://www.jagoanstore.com/jagstorecom-lil.png" border=0 align="absmiddle" /></a></div>\');' },

# Year Detection
{ :string=>/<div class="copy">Copyright (20[\d]{2}) Toko Online ini menggunakan JagoanStore CMS dari JagoanWeb Indonesia<\/div>/ },

]

end

