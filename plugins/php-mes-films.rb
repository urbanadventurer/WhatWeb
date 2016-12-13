##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-17 # Andrew Horton
# Added website parameter and description
##
Plugin.define "PhpMesFilms" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.2"
description "Film database powered by PHP. Website used to be http://phpmesfilms.dyndns.org/"

# 21 results for "powered by PhpMesFilms" @ 2001-08-21

# Dorks #
dorks [
'"powered by PhpMesFilms"'
]



matches [

{ :text=>'		<title>PhpMesFilms - Administration</title>' },
{ :text=>'		<title>PhpMesFilms - Liste</title>' },
{ :text=>'		<title>PhpMesFilms - Fiche film</title>' },
{ :text=>'				powered by <a href="http://phpmesfilms.dyndns.org/">PhpMesFilms</a>' },

]

end

