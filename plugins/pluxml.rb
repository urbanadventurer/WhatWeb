##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2012-05-18 #
# Added a couple of matches, google dorks and example urls
##
Plugin.define "PluXml" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.2"
description "PluXml - PHP powered CMS [French]"
website "http://pluxml.org/"

# Google results as at 2012-05-18 #
# 150 results for "powered by PluXml" @ 2010-10-14
#  72 for "par Pluxml en" "Valide xHTML"
#   5 for intitle:"PluXml - Page d'authentification" inurl:"auth.php"

# Dorks #
dorks [
'"powered by PluXml"',
'"par Pluxml en" "Valide xHTML"'
]



# Matches #
matches [

# Version detection
{ :version=>/<a href="http:\/\/pluxml.org" title="Blog ou Cms sans base de donn&eacute;es">Pluxml<\/a>[\s]+([\d\.]+)/ },

# Login page # Powered by text
{ :text=>'par <a href="http://pluxml.org">Pluxml</a></p>' },
{ :regexp=>/Powered by <a href="http:\/\/pluxml\.org/ },

# Login page # Default title
{ :text=>"<title>PluXml - Page d'authentification</title>" },

# Login page # Default HTML
{ :text=>'<p class="auth_return"><a href="../../">Retour au site</a>' },

# Footer Link
{ :text=>'G&eacute;n&eacute;r&eacute; par <a href="http://pluxml.org" title="Blog ou Cms sans base de donn&eacute;es">PluXml</a>' },

# ./admin/auth.php?p=/core/admin/ # Login Page # Footer Link
{ :text=>'G&eacute;n&eacute;r&eacute; par <a href="http://pluxml.org">PluXml</a></p>' },

]

end

