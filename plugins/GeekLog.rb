##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-10 #
# Updated version detection
##
Plugin.define "GeekLog" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-25
version "0.2"
description "Geeklog is an open source application for managing dynamic web content. It is written in PHP and supports MySQL, PostgreSQL, or MS SQL as the database backend. - homepage: http://www.geeklog.net/"

# 352 results for "powered by GeekLog" @ 2010-09-25

# Examples #
examples %w|
www.geeklog.net
news.infoshop.org
www.sangria.org.il/gl/users.php
www.battersbox.ca
www.topsight.net/index.php
news.bn.gs
www.panama-guide.com
www.webhostingsitesreviews.com
www.roadshow.ubc.ca/links/index.php
bigforex.com
www.abend.org
|

# Matches #
matches [

# Powered by text
{ :text=>'Powered By <a href="http://www.geeklog.net/">Geeklog</a>' },
{ :text=>'Powered By <a class="footer" href="http://www.geeklog.net/">GeekLog</a>' },

# HTML Comment
{ :text=>'<!--If you want the splash, uncomment the last line. If you want no splash, make sure it is commented out.-->' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.geeklog.net\/">Geeklog ([\d\.a-z]{1,10})<\/a>/ },

]

end

