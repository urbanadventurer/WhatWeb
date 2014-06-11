##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpPgAdmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-14 
version "0.1"
description "phpPgAdmin is a web-based administration tool for PostgreSQL. It is perfect for PostgreSQL DBAs, newbies and hosting services - homepage: http://phppgadmin.sourceforge.net/"

# Dorks #
dorks [
'intitle:phpPgAdmin "Welcome to phpPgAdmin"'
]



matches [

# 17 results @ 2010-06-14
{:name=>'GHDB: +intitle:phpPgAdmin "Welcome to phpPgAdmin"',
:certainty=>75,
:ghdb=>'+intitle:phpPgAdmin "Welcome to phpPgAdmin"'
},

# <h1>phpPgAdmin 4.0.1 (PHP 5.2.0-8+etch15)</h1>
# <h1>phpPgAdmin 4.2.2 (PHP 5.3.2-1ubuntu4.2)</h1>
# <h1>phpPgAdmin 4.0.1 (PHP 5.2.2)</h1>
# an aggressive plugin could get the version from intro.php
{:name=>"default h1 version", 
:certainty=>100,
:regexp=>/<h1>phpPgAdmin [0-9a-zA-Z\ \.\(\)\+-_]+<\/h1>/
},

]

def passive
        m=[]
        m << {:name=>"PPA_ID Cookie", :certainty=>100 } if @headers["set-cookie"] =~ /PPA_ID=[a-z0-9]+/
        m
end

end

