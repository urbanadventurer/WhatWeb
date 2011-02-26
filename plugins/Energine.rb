##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Energine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "Energine Content Management Framework - XML based PHP5 content management framework - homepage: http://energine.org/"

# Google results as at 2011-02-27 #
# 85 for "Powered by Energine"

# Examples #
examples %w|
demo.energine.org
www.school-221.ho.ua/en/
www.supme.net.ru/en/
www.energine-cmf.ho.ua/en/
energine.demo.openmag.biz/en/
sazz.pgk.cc
www.azs-sanki.ru/en/
kalyan48.ru/en/
www.gnevush-metal.com.ua/zabori/
silver-studio.com.ua/en/
www.techno.uz.ua/en/
eggmen.net/~andriy/ss/en/
mgree.ru
fintstudio.uz.ua
litvatravel.itprojects.lt
artkukla.com.ua/en/
mostovenko.com.ua/en/
jgt.com.ua/en/
art-kukla.colocall.com/en/
fcc.kiev.ua/en/
pravdop.com
62.149.25.162
|

# Matches #
matches [

# Default JavaScript
{ :regexp=>'<script type="text\/javascript" src="[^"]*scripts\/Energine.js"><\/script>' },

# Default Stylesheet
{ :regexp=>/<link rel="stylesheet" type="text\/css" href="[^"]*stylesheets\/energine.css" \/>/ },

# Powered by text
{ :text=>'<div id="footer"><span class="copyright">Powered by <a href="http://energine.org">Energine</a><br/>' },
{ :text=>'<span class="copyright">Powered by <a href= "http://energine.org/">Energine</a></span>' },

# Error Page # Powered by text
{ :certainty=>75, :text=>'<div id="footer">Powered by Energine.</div>' },
{ :text=>'<div id="footer">Powered by <a href="http://energine.org">Energine</a>' },

]

end


