##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Online-Grades" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Online Grades is the leading free-software project that allows K-12+ student grades attendance information to be posted onto a dynamic web site. Online Grades is not a web-based gradebook. Instead, it accepts grade export information from several popular gradebook software programs such as Easy Grade Pro, Gradekeeper, Misty City's Grade Machine, and PGGP and places the grade information online securely. - Homepage: http://www.onlinegrades.org/"

# Google results as at 2011-03-15 #
# 100 for "Powered by Online Grades"
#  70 for "Powered by Online Grades" -dork

# Examples #
examples %w|
demo.onlinegrades.org
demo.onlinegrades.org/admin/
demo.onlinegrades.org/faculty/
demo.onlinegrades.org/parents/
cca-columbia.com/grades/
resources.wwps.org/onlinegrades/index.php
www.pggp.com/Grades/index.php
www.srsmn.org/onlinegrades/
gradebook.kusd.org
www.bushnell-pc.k12.il.us/grades/
grades.hsd401.org
www.cloud.edu/grades/
grades.nccscougar.org
www.vwsd.k12.ms.us/onlinegrades/
elem.aiias.edu/onlinegrades/
stpetersschoolet.org/grades/
www.lcapalmyra.org/og/
www.kentoncityschools.org/apps/grades/
119.93.229.141/grades/
yalla.fi5.us
www.agape-school.com/Grades/
www.jeffric.com/lst/
grades.barriaga.com/
www.sje.wednet.edu/onlinegrades/
www.sje.wednet.edu:16080/onlinegrades/
www2.runnelsstar.com/grades/
www.gracelions.com/grades/
mrs.malanga.net/grades/
grades.millvilleschool.com
grades.annunciationmsp.org:88/grades/
www.evangelchristianschool.com/onlinegrades/
www.peoriachr.info/onlinegrades/
www.liberty-patriots.org/grades/
online-ocjene.info
maysoun.nerdsinthecity.com/maygrades/
www.sttimothymesa.org/onlinegrades-3.2.5/
bayonnehs.intelinetwork.com/CheckMyGrades/parents/
|

# Matches #
matches [

# Disclaimer
{ :text=>"<small><br /><em>Disclaimer</em>:  If you handed in an assignment or took a test today, don't expect the grade to be online immediately.  Teachers only update their grade books as needed.</small><ul><li>" },

# Version Detection # Meta Keywords
{ :certainty=>75, :version=>/<meta name="keywords" content="Online Grades Version ([^\s^"]+)" \/>/ },

# Version Detection # Footer
{ :version=>/      <div class="center">[\r\n]      Online Grades Version:[\r\n]      ([^\s]+)      <\/div>/ },

# Meta Author
{ :text=>'<meta name="author" content="Online Grade Posting System -- http://www.onlinegrades.org" />' },

# HTML Comments
{ :text=>'<!-- YOU CAN SAFELY REMOVE OR CHANGE ANYTHING BETWEEN THIS SECTION OF COMENTED CODE -->' },
{ :text=>'<!-- STOP REMOVING LINES HERE IF REMOVING/CHANGING THE FOOTER -->' },

# Powered by logo
{ :regexp=>/<a href="http:\/\/www.onlinegrades.org"><img src="[^"^>]+\/images\/og.png"[^>]+alt="Powered by Online Grades"[^>]*><\/a>/ },

]

end


