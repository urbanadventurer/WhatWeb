##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "PhpMesFilms"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-08-21
  "Andrew Horton", # v0.2 # 2016-04-17 # Added website parameter and description. 
]
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

