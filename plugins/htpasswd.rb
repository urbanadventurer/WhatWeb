##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-01-21 #
# Updated credential extraction
# Added SHA1 hashes for common admin passwords
# Renamed plugin from "Credentials" to "htpasswd"
##
# Version 0.2
# Now requires htpasswd in the URL path to reduce false positives
#
##
Plugin.define "htpasswd" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.3"
description ".htpasswd is a flat-file used to store usernames and password for basic authentication of Apache HTTP Server. This plugin attempts to retrievs credentials from .htpasswd files in user:pass format. - More info: http://en.wikipedia.org/wiki/Htpasswd"

# Google Results as at 2011-01-21 #
# 110 results for inurl:htpasswd ext:txt
# 181 results for filetype:htpasswd htpasswd
# 179 results for filetype:htpasswd inurl:htpasswd
# 35 results for htpasswd filetype:bak
# 2 results for ext:htpasswd1
# 2 results for inurl:"htpasswd" ext:bak

# Examples #
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
dai-us.com/zitopw.htpasswd
114.33.136.38/trac/mapawire-www/mapawire.htpasswd
collegesom.free.fr/jury.htpasswd
198.85.71.234/murphyms/web289/xampplite/security/webdav.htpasswd
files.ciptc.org.cn/portal/%23%23.htpasswd.bak
linguistical.com/mcart/data/htpasswd.bak
www.amitainc.com/dealers/htpasswd.bak
www.pornstarsociety.com/acpay/acp.htpasswd.bak.20021015051207
escrime59.fr/htpasswd.txt
www.dart-creations.com/images/stories/joomlatuts/secure/htpasswd.txt
x68000.q-e-d.net/~68user/net/sample/http-auth/.htpasswd
www.odont.uio.no/studier/ressurser/forelesninger/undervisning/immunologi/thalsten/.htpasswd~
www.filedropper.com/jay/.htpasswd1
www.amitainc.com/dealers/htpasswd.bak
files.ciptc.org.cn/portal/%23%23.htpasswd.bak
laboratoriomatematicas.uniandes.edu.co/financieras/matfin1/htpasswd.bak
eskola2.pp.fi/POIS_110310_.htpasswd
koti.mbnet.fi/icef1re/tnf/k.htpasswd
www.ubat-formation.fr/dossiers/old.htpasswd
seo-online.ru/%7C.htpasswd
www-geant4.kek.jp/~iwai/cvs/index.cgi/*checkout*/pcfarm/.htpasswd
xn--p5b4c.com/soft-systems/default/~.htpasswd
www.snowlock.net/original/rifts/rifts/clan.htpasswd
www.pimvullers.net/domains/vullersweb.nl/svn/svn.htpasswd
www.gimsig.ac.uk/images/gimsig%20site%20security/o.htpasswd
www.cnra.ci/fichetech/htpasswd.htpasswd
hyp3rion.free.fr/Personal_Database/trucs%20usefull/htpasswd.txt
deceder.at10.be/content/mamatijd/beveiligdepagina/htpasswd.txt
koellemedien.de/htpasswd.txt
subdomains.iberka.com/htpasswd.txt
www.systemaonline.com.br/public/teste/htpasswd.txt
daten.amoba.ch/htpasswd.txt
amd2408.am.funpic.de/htpasswd.txt
www.ksmh.be/BestuursAdmin/htpasswd.txt
www.jp-bank-seminar.jp/________.htpasswd
www.bitscape.jp/____.htpasswd
www.amitainc.com/dealers/htpasswd.bak
files.ciptc.org.cn/portal/%23%23.htpasswd.bak
|

# Passive #
# Extract credentials in user{2-255}:pass{1-80} format
# Accepts : sha1, md4, md5, plaintext
# The code is pretty ugly, but fast. Formatted for 80x24. Improvements welcomed.
def passive
m=[]

# Check if the current file is a .htpasswd file
if @base_uri.path =~ /htpasswd/i and @body =~ /^([0-9a-z\-_]{2,255}:[^\r^\n^\s^:]{1,80})[\r\n\s:]*/i

	# Loop through the results
	@body.scan(/^([0-9a-z\-_]{2,255}:[^\r^\n^\s^:]{1,80})[\r\n\s:]*/i).each do |line|
	# Compare hash to a few common passwords if the user is "admin"
	if line.to_s =~ /^admin:\$apr1\$/

		# Common passwords # SHA1
		if line.to_s == "admin:$apr1$Ev0Cp...$6R55smBmW.t.uDr01ao5Q."
			m << { :account=>"admin:admin" }
		elsif line.to_s == "admin:$apr1$XNQFp...$HCpZx9aTaQOD1vVFeGXUF1"
			m << { :account=>"admin:password" }
		elsif line.to_s == "admin:$apr1$94APp...$Vs/UEEdcnanhzIvFweeVd."
			m << { :account=>"admin:password1" }
		elsif line.to_s == "admin:$apr1$WqFQp...$xgPFU8Ao92A7eYg8J2cYx/"
			m << { :account=>"admin:Password" }
		elsif line.to_s == "admin:$apr1$3fdSp...$qq4wV9G75szLU/hJsGHYQ1"
			m << { :account=>"admin:12345" }
		elsif line.to_s == "admin:$apr1$b5XTp...$BcezBLeXvd7QT5Rlw.8Ki1"
			m << { :account=>"admin:123456" }
		elsif line.to_s == "admin:$apr1$WRMUp...$THfv/Ixp9HKpKH34dtzO3."
			m << { :account=>"admin:qwerty" }
		elsif line.to_s == "admin:$apr1$cT/Vp...$aOLWPBRTibzuNEhVpiw7V1"
			m << { :account=>"admin:abc123" }
		elsif line.to_s == "admin:$apr1$5PaVp...$gYaTwDl0yviTysvEY4REn0"
			m << { :account=>"admin:letmein" }

		# Display hash if unknown
		else
			m << { :account=>line.to_s }
		end

	# Display hash if user is not "admin"
	else
		m << { :account=>line.to_s }
	end

	end

end

m

end

end

