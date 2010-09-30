##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpinfo" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-07 
version "0.1"
description "Find instances of phpinfo()"
examples %w|
www.jtlnet.com/phpinfo.php
www.lufthavn.com
www.nskor.com
getoutofcomputertroublefree.com
open-com.com/info.php
famidev.info
www.bali-bungalows.com/info.php
www.no-debris.org
topheadsets.com/jk.php
www.ycbo.com/info.php
www.netseoul.net
thewholepie.com
juliandavid.net/ejemplos/php/info.php
lynneberg.com/mod-php/phpinfo.php
www.superhosting.com.au
www.cac.com.au/phpinfo.php
www.chainwirefm.com.au/test/php/php_info.php
confusioseco.com
linked.viper007bond.com/local_phpinfo.htm
www.weblinks.com.au
www.yow778.net
www.yourname.com.au
sedofile1.sedorz.net
|

matches [

# johnny.ihackstuff.com/ghdb/?function=summary&cat=13
# About 90,400 results @ 2010-06-07
{:name=>'intitle:"phpinfo()" +"mysql.default_password" +"Zend Scripting Language Engine"',
:certainty=>75,
:ghdb=>'intitle:"phpinfo()" +"mysql.default_password" +"Zend Scripting Language Engine"'
},

{:name=>"default title", 
:certainty=>75,
:regexp=>/<title>phpinfo\(\)<\/title>/
}

]

def passive
        m=[]

        if @body =~ /<h1 class="p">PHP Version [a-zA-Z0-9\.-_]+<\/h1>/
                        v=@body.scan(/<h1 class="p">PHP Version ([a-zA-Z0-9\.-_]+)<\/h1>/)[0].to_s
                        m << {:name=>"php version p", :version=>v }
        end
        if @body =~ /<h1>PHP Version [a-zA-Z0-9\.-_]+<\/h1>/
                        v=@body.scan(/<h1>PHP Version ([a-zA-Z0-9\.-_]+)<\/h1>/)[0].to_s
                        m << {:name=>"php version h1", :version=>v }
        end
        
m
end

end

