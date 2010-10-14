##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version: 0.2 #
# Fixed URLs to be relative
##
Plugin.define "Favicon-DB" do
author "Brendan Coles <bcoles@gmail.com>"
version "0.2"
description "This plugin detects the presence of web applications using the OWASP Favicon Database. - homepage: http://liss.owasp.org/index.php/Category:OWASP_Favicon_Database_Project"

matches [
{ :url=>"favicon.ico", :md5=>"6399cc480d494bf1fcd7d16c42b1c11b", :version=>"penguin" },
{ :url=>"favicon.ico", :md5=>"09b565a51e14b721a323f0ba44b2982a", :version=>"Google web server" },
{ :url=>"favicon.ico", :md5=>"506190fc55ceaa132f1bc305ed8472ca", :version=>"SocialText" },
{ :url=>"favicon.ico", :md5=>"2cc15cfae55e2bb2d85b57e5b5bc3371", :version=>"PHPwiki" },
{ :url=>"favicon.ico", :md5=>"389a8816c5b87685de7d8d5fec96c85b", :version=>"XOOPS cms" },
{ :url=>"favicon.ico", :md5=>"e6a9dc66179d8c9f34288b16a02f987e", :version=>"Drupal cms" },
{ :url=>"favicon.ico", :md5=>"f1876a80546b3986dbb79bad727b0374", :version=>"NetScreen WebUI" },
{ :url=>"favicon.ico", :md5=>"226ffc5e483b85ec261654fe255e60be", :version=>"Netscape 4.1" },
{ :url=>"favicon.ico", :md5=>"b25dbe60830705d98ba3aaf0568c456a", :version=>"Netscape iPlanet 6.0" },
{ :url=>"favicon.ico", :md5=>"41e2c893098b3ed9fc14b821a2e14e73", :version=>"Netscape 6.0 (AOL)" },
{ :url=>"favicon.ico", :md5=>"a28ebcac852795fe30d8e99a23d377c1", :version=>"SunOne 6.1" },
{ :url=>"favicon.ico", :md5=>"71e30c507ca3fa005e2d1322a5aa8fb2", :version=>"Apache on Redhat" },
{ :url=>"favicon.ico", :md5=>"d41d8cd98f00b204e9800998ecf8427e", :version=>"Zero byte favicon" },
{ :url=>"favicon.ico", :md5=>"dcea02a5797ce9e36f19b7590752563e", :version=>"Apache (seen on CentOS/Debian/Fedora)" },
{ :url=>"favicon.ico", :md5=>"6f767458b952d4755a795af0e4e0aa17", :version=>"Yahoo!" },
{ :url=>"favicon.ico", :md5=>"5b0e3b33aa166c88cee57f83de1d4e55", :version=>"DotNetNuke" },
{ :url=>"favicon.ico", :md5=>"7dbe9acc2ab6e64d59fa67637b1239df", :version=>"Lotus-Domino" },
{ :url=>"favicon.ico", :md5=>"fa54dbf2f61bd2e0188e47f5f578f736", :version=>"Wordpress" },
{ :url=>"favicon.ico", :md5=>"6cec5a9c106d45e458fc680f70df91b0", :version=>"Wordpress - obsolete version" },
{ :url=>"favicon.ico", :md5=>"81ed5fa6453cf406d1d82233ba355b9a", :version=>"E-zekiel" },
{ :url=>"favicon.ico", :md5=>"ecaa88f7fa0bf610a5a26cf545dcd3aa", :version=>"3-byte invalid favicon: domain sellers" },
{ :url=>"favicon.ico", :md5=>"4eb846f1286ab4e7a399c851d7d84cca", :version=>"Plone cms" },
{ :url=>"favicon.ico", :md5=>"c1201c47c81081c7f0930503cae7f71a", :version=>"vBulletin forum" },
{ :url=>"favicon.ico", :md5=>"edaaef7bbd3072a3a0c3fb3b29900bcb", :version=>"Reynolds Web Solutions (Car sales CMS)" },
{ :url=>"favicon.ico", :md5=>"d99217782f41e71bcaa8e663e6302473", :version=>"Apache on Red Hat/Fedora" },
{ :url=>"favicon.ico", :md5=>"4644f2d45601037b8423d45e13194c93", :version=>"Apache Tomcat" },
{ :url=>"favicon.ico", :md5=>"a8fe5b8ae2c445a33ac41b33ccc9a120", :version=>"Arris Touchstone Device" },
{ :url=>"favicon.ico", :md5=>"d16a0da12074dae41980a6918d33f031", :version=>"ST 605" },
{ :url=>"favicon.ico", :md5=>"befcded36aec1e59ea624582fcb3225c", :version=>"SpeedTouch" },
{ :url=>"favicon.ico", :md5=>"e4a509e78afca846cd0e6c0672797de5", :version=>"i3micro VRG" },
]

end
