##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kandidat-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "Kandidat-CMS [Russian] - Homepage http://www.kan-studio.ru/"

# Google results as at 2011-02-24 #
# 410 for "Powered by Kandidat CMS"

# Examples #
examples %w|
sajansk.net.ru
sharypovo.net.ru
www.stroi-klassbest.ru
mramor-master.ru
verhnjajapyshma.net.ru
suhinichi.net.ru
hyuman.ru
pereslavl-zalesskij.net.ru
privolzhsk.net.ru
petuhovo.net.ru
nesterov.net.ru
tatarsk.net.ru
700rub.pp.ru
njurba.net.ru
obluche.net.ru
alapaevsk.net.ru
www.drunkrepublic.net/news/
|

# Matches #
matches [

# Version detection # Powered by footer
{ :regexp=>/Powered by[\ ]?[:]? <a href="http:\/\/www.kan-studio.ru[\/]?">Kandidat CMS<\/a>/ },

]

end


