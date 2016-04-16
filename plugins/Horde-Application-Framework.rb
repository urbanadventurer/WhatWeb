##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-08-04 #
# Added matches and passive cookie matches
##
# Version 0.2 # 2011-01-31 #
# Updated version detection
##
Plugin.define "Horde-Application-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-08
version "0.3"
description "A web application framework. Projects using the framework include webmail, a wiki and groupware. (Mostly PHP)"
website "http://www.horde.org/"

# ShodanHQ results as at 2011-08-04 #
# 97 for webmail4prod
# 88 for webmail_version

# Google results as at 2011-08-04 #
# 82 for "powered by Horde Application Framework"
# 101 for inurl:util/icon_browser.php?subdir=
# 49 for intitle:"WebMail 4.0 LOGIN" "E-mail address" +Password

# Dorks #
dorks [
'"powered by Horde Application Framework"',
'inurl:"util/icon_browser.php?subdir="',
'intitle:"WebMail 4.0 LOGIN" "E-mail address" "Password"'
]



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

# Version Detection # Title
{ :version=>/<title>WebMail ([\d\.]+) LOGIN<\/title>/ },

# JavaScript src="/hunter/js/enter_key_trap.js"
{ :text=>'<script language="JavaScript" type="text/javascript" src="/hunter/js/enter_key_trap.js"></script>' },

# link href="/mail/mailbox.php?mailbox=INBOX"
{ :text=>'<link href="/mail/mailbox.php?mailbox=INBOX" rel="Top" />' },

# Version Detection # /config/conf.xml XML
{ :version=>/<!-- \$Horde: horde\/config\/conf.xml,v ([\d\.]+) / },

]

# Passive #
def passive
	m=[]

	# webmail_version Cookie
	m << { :name=>"webmail_version Cookie" } if @headers["set-cookie"] =~ /webmail_version=(magnum|hunter); /

	# webmail4prod Cookie
	m << { :name=>"webmail4prod Cookie" } if @headers["set-cookie"] =~ /webmail4prod=[a-f\d]{32}; /

	# Return passive matches
	m
end
end

