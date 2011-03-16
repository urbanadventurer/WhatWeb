##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPCow" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "PHPCow news publishing content management system - Homepage [offline] : http://www.phpcow.com/"

# Google results as at 2011-03-16 #
# 129 for "powered by PHPCow.com"

# Examples #
examples %w|
www.babyboomer-magazine.com
guiadeflamenco.com
www.presurance.com
www.aldiyarsat.net
www.sportswarts.com/gallery/
www.myrgvsports.net
www2.efreshers.com
www.yourundergroundnews.com
www.thebusinessmail.com
www.tvnext.in
www.thegingerbreads.co.uk/news/
rotarycllt.org
www.thenooze.net
www.bravanews.com
www.servicemaster-polk-county.com
www.delhigo.com
www.freeenergy.ca
www.teis.org.tr
www.bestofmalawi.com/news/
www.northindiatimes.com/news/
www.saudionfocus.com/en/
fdphotos.net
|

# Matches #
matches [

# Powered by link
# $395 to remove the "Powered by PHPCOW" (unconfirmed)
{ :text=>'<b>Powered by</b>: <a href="http://www.phpcow.com" target="_blank" style="color: #000000">PHPCow.com</a>' },
{ :text=>'<b>Powered by</b>: <a href="http://www.phpcow.com" target="_blank" style="color: #000000" title="PHPCow news publishing script, content management system">PHPCow.com</a>' },

# Meta Description
{ :text=>'<meta name="Description" content="PHPCow news publishing content management system" />' },

# Meta Keywords
{ :text=>'<meta name="Keywords" content="phpcow, news publishing, article publishing, cms" />' },

]

end


