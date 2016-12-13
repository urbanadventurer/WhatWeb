##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TCExam" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-14
version "0.1"
description "TCExam is a FLOSS Computer-Based Assessment system."
website "http://www.tcexam.org/"

# Google results as at 2011-07-14 #
# 307 for "TCExam ver" +Copyright "Nicola Asuni"
# 227 for "TCExam ver" +Copyright "Nicola Asuni" "Tecnick.com"

# Dorks #
dorks [
'"TCExam ver" "Copyright" "Nicola Asuni"'
]



# Matches #
matches [

# a name="topofdoc" id="topofdoc
{ :text=>'<a name="topofdoc" id="topofdoc"></a>' },

# meta name="author"
{ :text=>'<meta name="author" content="Nicola Asuni - Tecnick.com s.r.l." />' },

# HTML Comment
{ :regexp=>/<!-- TCExam \(c\) 2004-20[\d]{2} Nicola Asuni - Tecnick.com s\.r\.l\. - www\.tcexam\.com -->/ },

# HTML Comment
{ :text=>'<!-- TCExam19730104 -->' },

# login link
{ :text=>'<li><a href="tce_login.php" title="click on this link to access on this system">' },

# meta name="tcexam_level"
{ :text=>'<meta name="tcexam_level" content="0" />' },

# Version Detection # Copyright footer
{ :version=>/<span class="copyright"><a href="http:\/\/www\.tcexam\.(org|com)">TCExam<\/a> ver\. ([^\s]+) - Copyright &copy; 2004-20[\d]{2} Nicola Asuni - <a href="http:\/\/www\.tecnick\.com">Tecnick.com S\.r\.l\.<\/a><\/span>/, :offset=>1 },

]

end

