##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex
# Added version detection
# Added favicon md5 hash
# Added cookie matches
##
Plugin.define "phpMyAdmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-01 
version "0.2"
description "phpMyAdmin is a free software tool written in PHP intended to handle the administration of MySQL over the World Wide Web. - homepage:http://www.phpmyadmin.net/home_page/index.php"

# About 3,490 results for +intitle:phpMyAdmin +"Language: Afrikaans" +"Welcome to phpMyAdmin"@ 2010-06-01
# About 1868 ShodanHQ results for pma_theme=original @ 2010-10-26
examples %w|
demo.phpmyadmin.net/MAINT_2_11_11/
demo.phpmyadmin.net/MAINT_3_3_8/
demo.phpmyadmin.net/QA_3_3/
demo.phpmyadmin.net/TESTING/
demo.phpmyadmin.net/STABLE/
phpmyadmin.hosthat.com
yohost.com/demo/_/3rdparty/phpMyAdmin/
dbmy0028.whservidor.com
www.mars.abzone.cz/phpmyadmin/
www.pic7.info
89.223.109.37
122.115.32.100
193.190.66.22
88.57.182.30
208.43.32.3
200.27.93.32
88.151.101.243
98.126.210.171
216.183.235.117
194.150.224.13
|

matches [

# GHDB Match
{ :certainty=>75, :ghdb=>'+intitle:phpMyAdmin +"Language: Afrikaans" +"Welcome to phpMyAdmin"' },

# Version Detection # Default Title
{ :version=>/<title>phpMyAdmin ([^\s^<]+)[^<]*<\/title>/ },

# Version Detection # Default heading HTML
{ :version=>/<h2>Welcome to  phpMyAdmin ([^<]+)<\/h2>/ },

# Default Logo HTML
{ :text=>'<img src="./themes/original/img/logo_right.png" id="imLogo" name="imLogo" alt="phpMyAdmin" border="0" /></a>' },

# Default logo
{ :md5=>"d037ef2f629a22ddadcf438e6be7a325", :url=>"favicon.ico" },

# Login page # Default form HTML
{ :text=>'<form method="post" action="index.php" target="_parent"><input type="hidden" name="phpMyAdmin" value="' },
{ :text=>'<form method="post" action="index.php" target="_top"><input type="hidden" name="phpMyAdmin" value="' },

]

# Cookies
def passive
	m=[]

	m << {:name=>"phpMyAdmin Cookie" } if @meta["set-cookie"] =~ /phpMyAdmin=[0-9]{32}/
	m << {:name=>"pma_theme Cookie" } if @meta["set-cookie"] =~ /pma_theme=original/

	m

end

end

