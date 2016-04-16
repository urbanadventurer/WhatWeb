##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pluck-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "Pluck is a small and simple content management system. - Requires: PHP"
website "http://www.pluck-cms.org/"

# Google results as at 2011-08-25 #
# 66 for "powered by pluck" +admin inurl:file=kop1.php

# Dorks #
dorks [
'"powered by pluck" "admin" inurl:"file=kop1.php"'
]



# Matches #
matches [

# GHDB # "powered by pluck" +admin inurl:"file=kop1.php"
{ :ghdb=>'"powered by pluck" +admin inurl:"file=kop1.php"' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="pluck ([^\s^"]+)" \/>/ },

# Powered by footer
{ :text=>'powered by <a href="http://www.pluck-cms.org">pluck</a>' },

]

end

