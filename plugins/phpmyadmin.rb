##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpMyAdmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-01 
version "0.1"
description "phpMyAdmin is a free software tool written in PHP intended to handle the administration of MySQL over the World Wide Web. - homepage:http://www.phpmyadmin.net/home_page/index.php"
examples %w|
http://demo.phpmyadmin.net/MAINT_2_11_10/
http://demo.phpmyadmin.net/MAINT_3_3_3/
http://demo.phpmyadmin.net/QA_3_3/
http://demo.phpmyadmin.net/TESTING/
http://demo.phpmyadmin.net/STABLE/
http://phpmyadmin.hosthat.com/
http://yohost.com/demo/_/3rdparty/phpMyAdmin/
http://sst8.com/
http://nsd2.planet-work.com/
http://dbmy0028.whservidor.com/
http://2012.cp.volit.com/
http://www.mars.abzone.cz/phpmyadmin/
http://www.pic7.info/
|

matches [

# About 3,490 results @ 2010-06-01
{:name=>'GHDB: +intitle:phpMyAdmin +"Language: Afrikaans" +"Welcome to phpMyAdmin"',
:certainty=>75,
:ghdb=>'+intitle:phpMyAdmin +"Language: Afrikaans" +"Welcome to phpMyAdmin"'
},

{:name=>"default title", 
:regexp=>/<title>phpMyAdmin[0-9a-zA-Z\ \.-]+<\/title>/},

{:name=>"default logo",
:text=>'<img src="./themes/original/img/logo_right.png" id="imLogo" name="imLogo" alt="phpMyAdmin" border="0" /></a>'
}

]

end

