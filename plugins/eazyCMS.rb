##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EazyCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-16
version "0.1"
description "eazyCMS offers the functionality that would, in a custom-made system, cost thousands or tens of thousands - and it's all available online through your browser CMS stands for Content Management System - it is an eazy way to interactively change the contents of your site - the titles of pages, what they contain, and the number and structure of pages that make up your site. - http://www.eazycms.com/home.php?page_id=2"

# 40 results for "powered by eazyCMS" @ 2010-08-16
examples %w|
www.eazysitebuilder.com
www.eazyweb.net
www.citycentreliving.com
www.eazyweb.com.au
www.enertrols.co.uk
www.oddpearls.com
luxury-boats.areonlinehere.com
drmarisaviegas.isonlinehere.com
70s.areonlinehere.com
hothomes.isonlinehere.com
rush.isonlinehere.com
sandwiches.areonlinehere.com
sachelle-675.isonlinehere.com
holidaymasters.areonlinehere.com
remotepa.isonlinehere.com
aghashahi.isonlinehere.com
checkout-advice.isonlinehere.com
breastsgalore.isonlinehere.com
ilovegreencheese.isonlinehere.com
hquang.isonlinehere.com
freenolog1.isonlinehere.com
freshportraitscouk.isonlinehere.com
www.auroraboreal.isonlinehere.com
m4rco.isonlinehere.com
cromtown.isonlinehere.com
nada.isonlinehere.com
testsite.isonlinehere.com
|

matches [

{ :text=>'powered by <a href="http://www.eazycms.com" target="_blank">eazyCMS</a>' },
{ :regexp=>/<a [^href]+href="http:\/\/www.eazyCMS.com[\/]*"[^>]*>powered by eazyCMS<\/a>/ },
{ :text=>'Powered by <a href="http://www.eazycms.com">eazyCMS</a>' },
{ :text=>'Powered by <a title="eazyCMS :: The eazy-to-use Content Management System, maintain your website from anywhere in the world via a web browser!" href="http://www.eazycms.com" target="eazycms">eazyCMS</a>' },

]

end

