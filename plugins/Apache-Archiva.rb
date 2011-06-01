##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Apache-Archiva" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.1"
description "Apache Archiva is an extensible repository management software that helps taking care of your own personal or enterprise-wide build artifact repository. It is the perfect companion for build tools such as Maven, Continuum, and ANT. - Homepage: http://archiva.apache.org/"

# Google results as at 2011-06-01 #
# 29 for intitle:"Apache Archiva" ext:action "Copyright"

# Dorks #
dorks [
'intitle:"Apache Archiva" ext:action "Copyright"'
]

# Examples #
examples %w|
archiva.yola.net/archiva/
68.64.33.185
maven2.samara.lanit.ru
archiva.squale.org/repos/
archiva.fdvs.com.ar
zinc.mathforum.org:8080/archiva/
maven-secure.jivesoftware.com/archiva/
secure.jwall.org/maven/
reppo.rrze.uni-erlangen.de:8080/archiva/
cit2.mak.ac.ug:8080/archiva/
https://collab.eastbanctech.com/archiva/
https://archiva.skdn.org/
nimbleteam.com/archiva/index.action
maven2.langhua.org/archiva/
https://maven2.everit.biz
ci.sakaiquebec.org/archiva/
metis.di.uoa.gr:808/archiva/
archiva.openaos.com/archiva/
java.lmarin.org/archiva/
|

# Matches #
matches [

# Title
{ :certainty=>25, :text=>'<title>Apache Archiva \\' },

# 404 Page
{ :text=>'No context on this server matched or handled this request.<BR>Contexts known to this server are: <ul><li><a href="/archiva">/archiva&nbsp;--->&nbsp;org.mortbay.jetty.webapp.WebAppContext' },

# Search form
{ :text=>'<form namespace="/" id="quickSearch" name="quickSearch" onsubmit="customOnsubmit_quickSearch(); return validateForm_quickSearch();" action="' },
{ :text=>'<form namespace="/" id="quickSearch" name="quickSearch" onsubmit="return validateForm_quickSearch();" action="' },

# Version Detection # Footer
{ :version=>/<div class="xleft">\s+<a target="_blank" href="http:\/\/archiva\.apache\.org\/">Apache Archiva ([\d\.]+)<\/a>\s+<\/div>\s+<div class="xright">/ },
{ :version=>/<div class="xleft">\s+Apache Archiva ([\d\.]+)\s+<\/div>\s+<div class="xright">/ },

]

end

