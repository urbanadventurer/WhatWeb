##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Credentials" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.1"
description "This plugin attempts to retrievs credentials in user:pass format."

# 104 results for inurl:htpasswd ext:txt @ 2010-10-23
# 115 results for filetype:htpasswd htpasswd @ 2010-10-23
# 32 results for htpasswd filetype:bak @ 2010-10-23
examples %w|
doro999.piranho.de/neuer%20Versuch/htpasswd.txt
cgibinpp.50webs.com/htpasswd.txt..txt
www.halsogskaun.dk/Medlemsside/htpasswd.txt
membres.multimania.fr/fefmail/htpasswd.txt
www.oishii.jp/yyguest/htpasswd.txt
daten.amoba.ch/htpasswd.txt
homepages.fh-giessen.de/~lsyn55/Privat/htpasswd.txt
eurogelys.com/admin/htpasswd.txt
www.purefishing.jp/products/elite_360/htpasswd.txt
www.findrxonline.com/amember/data.htpasswd
syracuse-dev.org/private/trac-syracuse-dev.htpasswd
liris.cnrs.fr/~jlaflaqu/Vrac/A.htpasswd
dai-us.com/zitopw.htpasswd
114.33.136.38/trac/mapawire-www/mapawire.htpasswd
collegesom.free.fr/jury.htpasswd
virtuelreseau.com/admin/%20.htpasswd
198.85.71.234/murphyms/web289/xampplite/security/webdav.htpasswd
files.ciptc.org.cn/portal/%23%23.htpasswd.bak
linguistical.com/mcart/data/htpasswd.bak
www.amitainc.com/dealers/htpasswd.bak
www.pornstarsociety.com/acpay/acp.htpasswd.bak.20021015051207
|

# Extract credentials
def passive
	m=[]

	# user{2-255}:pass{1-80} combination # sha1, md4, md5, plaintext
	if @body =~ /^([0-9a-z\-_]{2,255}:[^\r^\n^\s^:]{1,80})[\r\n\s:]*/
		accounts=@body.scan(/^([0-9a-z\-_]{2,255}:[^\r^\n^\s^:]{1,80})[\r\n\s:]*/)
		m << { :accounts=>accounts }
	end

	m

end

end

