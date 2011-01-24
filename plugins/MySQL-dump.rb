##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MySQL-dump" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "Extracts MySQL host, database and server version from MySQL-dump .sql files."

# 468 results for "MySQL dump" ext:sql +Host +"Table structure for table" @ 2010-10-15
examples %w|
bio16j.lbl.gov/dcs/config2.sql
bio16j.lbl.gov/dcs/eval2.sql
bio16j.lbl.gov/dcs/track2.sql
edge.dev.box.sk/download/daily/box.sql
ftp.interlegis.gov.br/interlegis/STC/tbi/sapldemo.sql
ftp.mcs.anl.gov/pub/raffenet/neosdb.sql
mirror.pscigrid.gov.ph/ebi-software/software/ensembl/avilella/data/12dros/drosophila_erecta_core_3_55_13a.sql
mirror.pscigrid.gov.ph/ebi-software/software/ensembl/avilella/data/12dros/drosophila_sechellia_core_3_55_13a.sql
mirror.pscigrid.gov.ph/ebi-software/software/ensembl/avilella/data/12dros/drosophila_pseudoobscura_core_3_55_23a.sql
mirror.pscigrid.gov.ph/ebi-software/software/textmining/pp/monitored_channel.sql
ncisvn.nci.nih.gov/svn/gss/trunk/software/gss/sql/gss_dump.sql
users.nccs.gov/~ratsadm/share/rats_dump_20090223.sql
vimssftp.lbl.gov/UnsupervisedOperons/Genomics/Database/allTables.genomics_test.sql
woce.nodc.noaa.gov/woce_v3/updates/wocedocs/bibliography/allbib/biblio_countries.sql
woce.nodc.noaa.gov/woce_v3/updates/wocedocs/bibliography/allbib/biblio_regions.sql
woce.nodc.noaa.gov/woce_v3/updates/wocedocs/bibliography/allbib/biblio.sql
www.chjhs.tyc.edu.tw/gov/school.sql
www.cochabamba.gov.bo/public/descargas/back2010.sql
www.gentoo.org/doc/en/files/genericmailsql.sql
www.sarandi.pr.gov.br/SITE_ANTIGO/bkp/sarandi.sql
www.scrailway.gov.in/enggol/LASTAWARDEDRATE.sql
|

matches [

# Version detection # mySQL dump
{ :version=>/------------------------------------------------------[\r]?\n-- Server version[\s]+([^\r^\n]+)/, :regexp_offset=>0 },

# Version detection # phpMyAdmin dump
{ :version=>/^# phpMyAdmin MySQL-Dump[\s]+# version [^\s]+[\s]+# http:\/\/www.phpmyadmin.net\/ \(download page\)[\s#]+# Host: [^\s]+[\s]+# Generation Time: [^\n]+[\s]+# Server version: ([\d\.]+)/, :regexp_offset=>0 },

]

# Extract host and database
def passive
	m=[]

	# mySQL dump
	if @body =~ /^-- MySQL dump [\d\.]+[\r]?\n--[\r]?\n-- Host: ([^\s]+)[\s]+Database:[\s]+([^\r^\n]+)/
		accounts=@body.scan(/^-- MySQL dump [\d\.]+[\r]?\n--[\r]?\n-- Host: ([^\s]+)[\s]+Database:[\s]+([^\r^\n]+)/)
		m << {:account=>accounts}
	end

	# phpMyAdmin dump
	if @body =~ /^# phpMyAdmin MySQL-Dump[\s]+# version [^\s]+[\s]+# http:\/\/www.phpmyadmin.net\/ \(download page\)[\s#]+# Host: ([^\s]+)[\s]+# Generation Time: [^\#]+# Server version:[^\#]+# PHP Version:[^\#]+# Database : `([^\`]+)`/
		accounts=@body.scan(/^# phpMyAdmin MySQL-Dump[\s]+# version [^\s]+[\s]+# http:\/\/www.phpmyadmin.net\/ \(download page\)[\s#]+# Host: ([^\s]+)[\s]+# Generation Time: [^\#]+# Server version:[^\#]+# PHP Version:[^\#]+# Database : `([^\`]+)`/)
		m << {:account=>accounts}
	end

	m
 
end

end

