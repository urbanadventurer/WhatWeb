##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PluXml" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "PluXml - PHP powered CMS [French] - homepage: http://pluxml.org/"

# 64 results for "powered by PluXml" @ 2010-10-14
examples %w|
braceletsbijoux.com/core/admin/
chopin.julien.free.fr/core/admin/
christian.helmich.free.fr/kirin/kagefx/pluxml/admin
christian.helmich.free.fr/kirin/kagefx/
demo.pluxml.org/core/admin/
design.axenis.net/core/admin/
idilles-mariage.com/core/admin/
klingmobile.com/core/admin/
pluxtest.pluxthemes.com
pluxtest.pluxthemes.com/core/admin/
www.axenis.net
www.axenis.net/core/admin/
www.giesdesign.com
www.giesdesign.com/core/admin/
www.kagefx.net
www.it-wars.com/core/admin/
www.yorkiesdelacotin.fr/core/admin/
www.zeroadteam.com/core/admin/
|

matches [

# Version detection
{ :version=>/<a href="http:\/\/pluxml.org" title="Blog ou Cms sans base de donn&eacute;es">Pluxml<\/a>[\s]+([\d\.]+)/ },

# Login page # Powered by text
{ :text=>'par <a href="http://pluxml.org">Pluxml</a></p>' },
{ :regexp=>/Powered by <a href="http:\/\/pluxml.org[\/]*">Pluxml<\/a>/i },

# Login page # Default title
{ :text=>"<title>PluXml - Page d'authentification</title>" },

# Login page # Default HTML
{ :text=>'<p class="auth_return"><a href="../../">Retour au site</a>' },

]

end

