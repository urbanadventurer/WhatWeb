##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Trac" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-15
version "0.1"
description "Trac is an enhanced wiki and issue tracking system for software development projects. - homepage: http://trac.edgewall.org/"
examples %w|
trac.edgewall.org/demo-0.12
trac.edgewall.org/demo-0.11
https://projects.honeynet.org/honeywall/
xcache.lighttpd.net
eaccelerator.net
code.djangoproject.com
dev.wifidog.org
plagger.org
code.reddit.com
munin-monitoring.org
firestats.cc
www.xinha.org
www.maiamailguard.com
www.cherrypy.org
byteflow.su
sourceforge.net/apps/trac/ipcop/
bitten.edgewall.org
trac.symfony-project.org
fedorahosted.org/koji/
cross-lfs.org
trac.bjourne.webfactional.com
www.ntop.org/trac/
symfonians.org
trac.enlightenment.org/e/wiki/
developer.longtailvideo.com/trac/
trac.fusebox.org
www.rpm.org
developer.pidgin.im
www.phpeclipse.com
trac.greenstone.org
dev.mobileread.com
www.licq.org
seer.isi.deterlab.net/trac/
svn.nuxeo.org
www.eresi-project.org
www.aminus.net
trac.osuosl.org/trac/replicant/
createrepo.baseurl.org
|

matches [

# About 77,000,000 results @ 2010-06-14
{:name=>'GHDB: "Powered by Trac" +intitle:Trac',
:certainty=>75,
:ghdb=>'"Powered by Trac" +intitle:Trac'
},

]

def passive
        m=[]

        m << {:name=>"trac_form_token Cookie", :probability=>100 } if @meta["set-cookie"] =~ /trac_form_token=/

	if @body =~ /Powered by <a href="[0-9a-zA-Z\.\'\/\-\+\)\(_]*"><strong>Trac [\d\.\-a-z]+<\/strong><\/a><br \/>/
                version=@body.scan(/Powered by <a href="[0-9a-zA-Z\.\'\/\-\+\)\(_]*"><strong>Trac ([\d\.\-a-z]+)<\/strong><\/a><br \/>/)[0][0]
                m << {:name=>"powered by version",:version=>version}
        end

	m

end

end

