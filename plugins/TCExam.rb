##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TCExam" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-14
version "0.1"
description "TCExam is a FLOSS Computer-Based Assessment system. - Homepage: http://www.tcexam.org/"

# Google results as at 2011-07-14 #
# 307 for "TCExam ver" +Copyright "Nicola Asuni"
# 227 for "TCExam ver" +Copyright "Nicola Asuni" "Tecnick.com"

# Dorks #
dorks [
'"TCExam ver" +Copyright "Nicola Asuni"'
]

# Examples #
examples %w|
auladejorge.es/TCExam/public/code/index.php
exam.nrcprep.com/public/code/tce_login.php
avr.tavir.hu/TCExam/public/code/index.php
quiz.sman1sumedang.com/TCExam/public/code/index.php
smartrwanda.com/students/public/code/index.php
www.howporaj.org.pl/egzamin/public/code/tce_user_registration.php
kuliah.imm.web.id/quiz/public/code/index.php
exams.suffolkremsco.com/public/code/index.php
test.sc585.spb.ru/public/code/index.php
www.dpalazzo.it/TCExam/admin/code/tce_page_info.php
www.testtakipmerkezi.tk/public/code/tce_login.php
75.101.139.145/public/code/index.php
apps.wku.edu/tcexam/public/code/tce_login.php
www.onlineonderwijs.info/onlinetesting/
https://ph150.edu.physics.uoc.gr/exams/public/code/index.php
lingayasuniversity.edu.in/Enterance_Test/public/code/tce_user_registration.php
mres.gmu.edu/TCExam/public/code/tce_user_registration.php
www.medbio.dsmu.edu.ua/TCExam/public/code/tce_user_registration.php
mres.gmu.edu/TCExam/public/code/index.php
cgi.cse.unsw.edu.au/~tcexam/TCExam/admin/code/tce_page_info.php
|

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

