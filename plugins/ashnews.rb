##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ashnews" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.1"
description "ashnews is a simple program using PHP/MySQL that allows you to easily add a news/blog system to your site. - homepage: http://projects.ashwebstudio.com/"

# 19 results for "News powered by ashNews" -allinurl -Vulnerabilities @ 2010-08-28
examples %w|
www.onecrazyfan.com/reeze.php
axoft.com.ar/wwwroot/
www.duelunelive.net/ashnews.php
www.callac.com/Chris/blog.php
www.turismoaventura.com
|

# Version detection using powered by text
def passive
        m=[]

        if @body =~ /    <td align="center"><font face=Arial size=1>News powered by <a href=http:\/\/projects.ashwebstudio.com>ashnews v[\d\.]+<\/a><\/font><\/td>/
                version=@body.scan(/    <td align="center"><font face=Arial size=1>News powered by <a href=http:\/\/projects.ashwebstudio.com>ashnews v([\d\.]+)<\/a><\/font><\/td>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

