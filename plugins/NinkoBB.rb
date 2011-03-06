##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NinkoBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "NinkoBB - Homepage: http://ninkobb.com/"

# Google results as at 2011-02-27 #
# 55 for "Powered by NinkoBB"

# Examples #
examples %w|
ninkobb.com
demo.opensourcecms.com/ninkobb/
codeshare.comeze.com
khaledmekaoui.tk/forum/
shanegi13.com/form.php
stuentry.thu.edu.tw/guestbook/
systemsorcery.net
webhostingwetrust.org/forum/
www.shawncorson.com/community/
www.artseek.co.uk/forum/
www.noybook.com
www.clubrimes.com
venthemiux.org/commune/
hateistheonlywayout.netne.net/form.php
|

# Matches #
matches [

# Default Stylesheet
{ :regexp=>/<link href="[^"]*\/assets\/css\/ninko.css" rel="stylesheet" type="text\/css" \/>/ },

# Powered by text
{ :text=>'Powered by <a href="http://ninkobb.com">NinkoBB</a>' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/ninkobb.com\/">NinkoBB<\/a> v. ([\d\.]{1,5}) t./ },

]

end


