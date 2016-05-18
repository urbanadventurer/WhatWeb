##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Magento" do
author "Andrew Horton"
version "0.1"
description "Opensource ecommerce platform written in PHP"
website "http://www.magentocommerce.com"

dorks [
"Magento is a trademark of Magento Inc. Copyright" "admin",
'intitle:"Magento Downloader" "Report All Bugs"'
]

matches [

# default logo
{:text=>'images/logo.gif" alt="Magento Commerce" /></a></h1>', :name=>'default logo alt-text'},

# version detection
{:version=>%r{<a href="http://www.magentocommerce.com/bug-tracking" id="bug_tracking_link"><strong>Report All Bugs</strong></a> \((Magento Connect Manager |Downloader )?ver. ([0-9\.]+)\)}, :offset=>1 },

# StyleSheet
{:regexp=>%r{<link rel="stylesheet" type="text/css" href="[^"]+/skin/frontend/[^"]+/css/boxes.css" media="all"}, :name=>"/skin/front/*/css/boxes.css"},

# Meta keywords
{ :name => "Meta keywords", :text=>'<meta name="keywords" content="Magento, Varien, E-commerce" />'},

# Search form
{:text=>"var searchForm = new Varien.searchForm('search_mini_form', 'search', '"},
{:text=>',mage/cookies.js" ></script>'},

# NoScript
{:regexp=>/<div id="noscript-notice" class="magento-notice">/, :name=>'JavaScript disabled warning'},
{:regexp=>%r{<p>You must have JavaScript enabled in your browser to utilize the functionality of this website.</p>}, :name=>'JavaScript disabled warning' },

# Admin interface
{:url=>'/admin',:text=>'<title>Log into Magento Admin Page</title>'},

# Copyright footer
{:name => 'Copyright footer', :string => /Magento is a trademark of Magento Inc. Copyright &copy; ([0-9]{4}) Magento Inc/ },

=begin
frontend cookie - no obvious pattern:
Set-Cookie: frontend=3d3tts5uumgt3v6klitfr15b05;	ALPHA	1.1.6
Set-Cookie: frontend=c7ec59c75e957b29f1d5e0d6cfcb3a98;	HEX	1.2.0.2
Set-Cookie: frontend=54f0e9aa64fe53d0f076ef0e328841d5;	HEX	1.2.1.2 
Set-Cookie: frontend=873sd3kemps1al4np0c6ndkac4;	ALPHA	1.3.1
Set-Cookie: frontend=dcf246795fa247992d07daa7a7ba147e; 	HEX	1.3.1.1
Set-Cookie: frontend=a9239941fea5df3bb1b75485d56cb817; 	HEX 	1.3.2.1
Set-Cookie: frontend=ec409bd20122a68f9c27fa66c358fc7d; 	HEX	1.4.0.1
Set-Cookie: frontend=s0ucd54lq2js68cp05sp6r2u92; 	ALPHA	1.4.0.1
=end

# Set-Cookie: magento=3s3piyt6bil5carswndryvwak6zqzo3x; expires=Tue, 02-Nov-2010 04:42:28 GMT; path=/; domain=www.malenasflowers.com (ver. 1.2.0.2)

{ :name=>"cookie called magento", :search=>"headers[set-cookie]", :regexp=>/^magento=[0-9a-f]+/ },
{ :name=>"cookie called frontend", :search=>"headers[set-cookie]", :regexp=>/^frontend=[0-9a-z]+/ }

]

end

