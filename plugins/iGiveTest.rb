##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iGiveTest" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-23
version "0.1"
description "iGiveTest is a comprehensive solution for creating, administering, and providing thorough analysis of tests on the Internet and Intranet. It is a quick and professional way to create and organize tests for employees, students, and people in training. - Homepage: http://igivetest.com/"

# Google results as at 2011-03-23 #
# 175 for "Powered by iGiveTest"
# 29 for "Powered by iGiveTest v1.9.7"

# Examples #
examples %w|
lawquiz.uslegal.com
try001.igivetest.net/
try073.igivetest.net/
iqtrevolution.igivetest.net
manhattangmat.igivetest.net
www.accessnursing.com/onlinetest/
www.myexamhoster.com/examdepot/
www.meritpeds.com
www.crownoilfield.com/igivetest/
centabond.com/igivetest/
www.summitbiblecollege.com/tests/
www.radphy.com/quizzes/
www.thelearningsource.net/testing/
fitnesscertification.ca/igivetest/
www.pensacolaaviator.com/tests/
kiddinduction.com
arbitro.org
meritmaternity.com
www.webtraining.com.au/igivetest/
winegard.com/dealer/igivetest/
toskcan.com
www.theperfectnonprofit.com/igivetest/
www.qbequizstriker.com.au/quiz/
www.licensingprep.com/quizzes/
www.softscience.com/igivetest-2.1.0/index.php
www.iqquiz.org
https://testing.acidirect.com
www.realtyinst.com/igivetest/
www.viewkeepers.net/content/igivetest/
www.pabstatencio.com/igivetest/
www.phoenixtaxtest.com
icpcgfns.com
servicemanagementuniversity.com
meritnjmidterm.com
aaremstesting.org
www.kian-farda.com/quiz/
www.cmetests.com/index.php
www.wvml.org/testing/
www.lpnnet.com/testcentre/
nussn.net
mortgage-u-mke.com
www.druged101.com/mod1/
www.nfptonline.com/testing/
www.brano.com.au/onlinequiz/
www.brisbanedrivingschools.com.au/onlinequiz/
www.helpingservices.org/index.php
test.uscdem.org
www.gotodcwtraining.com/testing/index.php
www.hncpe.org
jandktesting.com
naturopathic.us/test/
marata.org/wp-content/themes/thesis_18/lib/html/
kiddtraining.com
4hwildlifestewards.org/tests/
meritnjfinal.com
devtest.tibra.com
exams.european-tests.com
university.useipi.com/iGiveTest/index.php
www.mediplacements.com/testing/
meritap1.com
go2a7.com/training/
www.ipras.net/test/index.php
www.cogsd.org/quiz/index.php
nwscert.srh.noaa.gov
testing.stockellconsulting.com
courselaunch.testlaunch.net
www.examinationbrushup.com/commercial/
techmasters.sonytechcentre.com
hbrdatabase.com
www.thechristiantest.com/tests/
devtest.tibra.com
www.escolanauticamallorca.es/ipnb/
|

# Matches #
matches [

# Version Detection # Powered by link
{ :version=>/Powered by <a href="http:\/\/iGiveTest\.com" target=_blank>iGiveTest v([\d\.]+)<\/a>/ },

# Version Detection # Powered by text
{ :version=>/<tr><td colspan=[\d] align=right>Powered by iGiveTest v([\d\.]+)<\/a><\/td><\/tr>/ },

# Login Form
{ :certainty=>25, :text=>'<form action="index.php" method=post name=signinform>' },

]

end


