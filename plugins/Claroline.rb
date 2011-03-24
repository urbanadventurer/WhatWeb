##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Claroline" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "Claroline is an Open Source eLearning and eWorking platform allowing teachers to build effective online courses and to manage learning and collaborative activities on the web. Translated into 35 languages, Claroline has a large worldwide community - Homepage: http://www.claroline.net/"

# Google results as at 2011-03-24 #
# 466 for "Powered by Claroline"

# Examples #
examples %w|
demo.claroline.net
lab.claroline.net
campus.claroline.net
demos.softaculous.com/Claroline/
claroline.inwicast.com/en/
claroline.city.academic.gr
89.202.197.83/t2platform/
opendoorbibleschool.com
theschoolwork.com/lms/
intranet.btcctb.org/claroline/
ict.iiu.edu.my/claroline
elearning.yu.edu.jo/online/claroline/
www.interlink.edu/claroline/uncg/
www.ksap.gov.pl/eksap/claroline/
asimov.fdn.uq.edu.au/claroline178/
www.interlink.edu/claroline/uncg/
studium.monaco.edu
www.humanidades.uni.edu.py/tics/claroline/
|

# Matches #
matches [

# Year Detection # Indicates the age of install # Powered by text
# `[^<]{1,20}` section is to detect multiple languages
{ :string=>/<div id="poweredBy">[^<]{1,20}<a href="http:\/\/www\.claroline\.net" target="_blank">Claroline<\/a> &copy; 2001 - (20[\d]{2})<\/div>/ },

# link tags
{ :certainty=>75, :text=>'<link href="http://www.claroline.net/documentation.htm" rel="Help" />' },
{ :certainty=>75, :text=>'<link href="http://www.claroline.net/credits.htm" rel="Author" />' },
{ :certainty=>75, :text=>'<link href="http://www.claroline.net" rel="Copyright" />' },

]

end


