##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LocazoList-Classifieds" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "Locazolist v2.02b is a text based classifieds ad system based on ASP and Microsoft SQL Server 2005. Locazolist v2 is known as the first and still only ASP based 'craigslist clone script' in the web since its development beginning in late 2005. - homepage: http://www.locazolist.com/"

# 24 results for "powered by LocazoList" -exploit @ 2010-08-14
examples %w|
thescrapmeet.com
demo.locazolist.com
www.salvageweb.com
www.ourcommonline.com/tenafly/classifieds/
|

matches [

{ :regexp=>/Powered by <a href='http:\/\/www.locazo[list]*.com[\/]*' style='font-size:10px; color:black'>Locazolist<\/a> Copyright &copy; [0-9]{4}<\/font>/ },

]

def passive
        m=[]

        if @body =~ /<br><br><br><br><font face='verdana' size='1'>Powered by LocazoList v[0-9a-z\.]+<br>Copyright [0-9]{4} <a href='http:\/\/www.locazo.com\/applications'>Locazo.com<\/a><\/font>/
                version=@body.scan(/<br><br><br><br><font face='verdana' size='1'>Powered by LocazoList v([0-9a-z\.]+)<br>Copyright [0-9]{4} <a href='http:\/\/www.locazo.com\/applications'>Locazo.com<\/a><\/font>/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /<title>LocazoList Classifieds v[0-9a-z\.]+ - powered by LocazoList [0-9a-z\.]+<\/title>/
                version=@body.scan(/<title>LocazoList Classifieds v[0-9a-z\.]+ - powered by LocazoList ([0-9a-z\.]+)<\/title>/)[0][0]
                m << {:version=>version}
        end


        m

end


end

