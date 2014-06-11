# coding: ascii-8bit
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2 by Andrew Horton
# removed VIEWSTATE match as it matches ASP.NET, removed :probability=>100
# Version 0.3 by Andrew Horton - added version detection with EPiServer logos and more examples from http://www.episerver.com/en/Customers/

Plugin.define "EPiServer" do
author "Patrik Wallström"
version "0.2"
description "CMS from EPiServer - http://episerver.com/"



matches [
{:name=>"meta generator tag with EPiServer", :text=>"<meta name=\"GENERATOR\" content=\"EPiServer\" />"},
{:name=>"EPiServer comment", :text=>"<!-- EPiServer -->"},

{:text=>'src="/Util/javascript/episerverscriptmanager.js"'},

# version six also contains the img for version 5. could be improved by making a def passive function
{:url=>"/App_Themes/Default/Images/General/LoginBackground.gif", :md5=>"5a530899177854181da891894554478a", :version=>"4.x"},
{:url=>"/App_Themes/Default/Images/General/LoginBackground.gif", :md5=>"7dea9dcf92792b1bf2bddfe71549dd19", :version=>"5.x-6.x"},
{:url=>"/util/images/loginbackground.gif", :md5=>"5a530899177854181da891894554478a", :version=>"4.x"},
{:url=>"/util/images/loginbackground.gif", :md5=>"7dea9dcf92792b1bf2bddfe71549dd19", :version=>"5.x-6.x"},
{:url=>"/Util/images/EPiServerCMSLogo.png", :md5=>"066ab2c653211887d01e52bcc30293ba", :version=>"6.x"},
{:url=>"/util/login.aspx", :text=>"<h1>Log in to EPiServer CMS 6", :version=>"6.x"}
]


end

