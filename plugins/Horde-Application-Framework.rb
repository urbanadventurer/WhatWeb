##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-31 #
# Updated version detection
##
Plugin.define "Horde-Application-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-08
version "0.2"
description "A web application framework. Projects using the framework include webmail, a wiki and groupware. (Mostly PHP) - homepage: http://www.horde.org/"

# Google results as at 2010-09-08 #
# 13 for "powered by Horde Application Framework"
# 64 for inurl:util/icon_browser.php?subdir=

# Examples #
examples %w|
netex.net.ua/horde/
netex.net.ua/horde/util/icon_browser.php?subdir=alerts
ssjh.sk/mail/imp/login.php
ssjh.sk/mail/util/icon_browser.php?subdir=weatherdotcom
theupstairsroom.com
webmail.uvm.edu/horde/
webmail.uvm.edu/horde/util/icon_browser.php?subdir=nav
www.metrum.sk/webmail/
www.eltimon.com/horde/config/conf.xml
www.eltimon.com/horde/util/icon_browser.php?subdir=emoticons
www.sanctamaria-aarschot.be/horde/util/icon_browser.php
www.infs.de/mails/imp/login.php
www.infs.de/mails/util/icon_browser.php?subdir=weatherdotcom
|

# Matches #
matches [

# Powered by text
{ :text=>'title="This site is powered by The Horde Application Framework." href="http://horde.org">' },
{ :text=>'Powered by </font><a href="http://www.horde.org/" TARGET=_blank>' },

# HTML comment
{ :text=>'<!-- IMP: Copyright 2001-2006, The Horde Project. IMP is under the GPL. -->' },
{ :text=>'<!--   Horde Project: http://horde.org/ | IMP: http://horde.org/imp/    -->' },

# Powered by image HTML
{ :text=>'/themes/graphics/horde-power1.png" alt="Powered by Horde" title="" />' },

# horde-power1.png logo
{ :md5=>'b74924c612af6030729d7ac3bd0ef803', :url=>'themes/graphics/horde-power1.png' },

# Default Javascript # Webmail login page
{ :text=>"if (typeof(_setHordeTitle) == 'undefined' && document.title && parent.frames.horde_main) parent.document.title = document.title;" },

# HTML comment # Webmail login page
{ :text=>'<!-- This file contains any "Message Of The Day" Type information -->' },

# default HTML # icon_browser.php
{ :text=>'<a href="icon_browser.php?app=chora">Version Control</a><br />' },

# default my account HTML # icon_browser.php
{ :text=>'<html><body bgcolor="#aaaaaa"><a href="icon_browser.php">Application List</a><br /><br /><h2>Icons for My Account</h2>' },

# Version Detection # /config/conf.xml XML
{ :version=>/<!-- \$Horde: horde\/config\/conf.xml,v ([\d\.]+) / },

]

end

