##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kontaktformular" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-13
version "0.1"
description "PHP contact form"
website "http://www.radbekleidung.eu/gratis-kontaktformular.html"

# 49 results for "Script Powered by Kontaktformular" @ 2010-09-13

# Dorks #
dorks [
'"Script Powered by Kontaktformular"'
]



matches [

# HTML comment
{ :text=>'<!--Copyright darf NICHT entfernt werden!!-->' },
{ :text=>'<!-- Hinweis darf nicht entfernt werden! -->' },

# Powered by text
{ :text=>'Script Powered by <a target="_blank" href="http://www.radbekleidung.eu/gratis-kontaktformular.html">Kontaktformular</a>' },
{ :text=>'&copy; Script Powered by kontaktformular.org </span>' },

]

end

