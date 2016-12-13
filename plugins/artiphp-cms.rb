##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Artiphp-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-17
version "0.1"
description "Artiphp CMS - open source CMS - Requires PHP"
website "http://www.artiphp.com/"

# Google results as at 2012-05-17 #
# 251 for "Artiphp" "2001" "est un logiciel libre" "sous licence GPL"

# Dorks #
dorks [
'"Artiphp" "2001" "est un logiciel libre" "sous licence GPL"'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!--  fin ArtiMenu horizontal -->' },
{ :text=>'<!--  Fin ArtiMenu horizontal -->' },
{ :text=>'<!-- copyright Artiphp, merci de respecter notre travail en laissant notre signature -->' },

# Version Detection # Copyright Footer
{ :version=>/<div id="copyright">\s*(<p class="copyright">)?\s*<a href="http:\/\/www\.(artiphp|artiloo)\.com"( target="_blank")?>Artiphp ([^<]+)<\/a> &copy; 2001-20[\d]{2} est un logiciel libre/, :offset=>3 },

]

end

