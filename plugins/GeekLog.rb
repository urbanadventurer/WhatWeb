##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GeekLog" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-25
version "0.1"
description "Geeklog is an open source application for managing dynamic web content. It is written in PHP and supports MySQL, PostgreSQL, or MS SQL as the database backend. - homepage: http://www.geeklog.net/"

# 352 results for "powered by GeekLog" @ 2010-09-25
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
www.faithingiving.com
www.serve2help.com
www.harnessu.com
www.hope2serve.com
www.faithinserving.com
www.faithtohope.com
www.abend.org
www.j-soho.or.jp
|

matches [

# Powered by text
{ :text=>'Powered By <a href="http://www.geeklog.net/">Geeklog</a>' },
{ :text=>'Powered By <a class="footer" href="http://www.geeklog.net/">GeekLog</a>' },
{ :text=>'Powered by&nbsp;<a href="http://www.geeklog.net/">Geeklog</a>' },

# HTML Comment
{ :text=>'<!--If you want the splash, uncomment the last line. If you want no splash, make sure it is commented out.-->' },

]

# Version detection
def passive
        m=[]

	# Powered by text
        if @body =~ /Powered by <a href="http:\/\/www.geeklog.net\/">Geeklog ([\d\.]+)<\/a>/
                version=@body.scan(/Powered by <a href="http:\/\/www.geeklog.net\/">Geeklog ([\d\.]+)<\/a>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

