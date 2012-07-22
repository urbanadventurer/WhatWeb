##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Lotus-Domino" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-22
version "0.1"
description "Lotus Domino - Social business application platform - Homepage: https://www-01.ibm.com/software/lotus/products/domino/"

# Google results as at 2012-07-22 #
# 833 for ext:nsf site:edu
# 780 for ext:nsf site:gov
#  81 for ext:nsf site:mil

# ShodanHQ results as at 2012-07-22 #
# 68,292 for Lotus-Domino

# Examples #
examples %w|
94.76.215.90
90.83.96.153
121.37.59.62
210.154.80.211
194.224.234.105
195.50.152.243
128.172.14.39
217.5.173.251
71.162.208.83
193.120.42.228
62.91.31.162
211.26.139.83
220.110.176.202
221.236.79.186
217.57.32.42
202.76.62.177
163.191.87.10
61.219.16.150
203.73.220.132
80.237.215.54
147.8.152.16
85.118.31.26
201.54.213.43
203.47.141.190
130.237.187.16
https://quickplace.ahf.nmci.navy.mil/quickplace/nrcnofltredlog/Main.nsf
https://perscomnd04.army.mil/milpermsgs.nsf
https://epmo2.uscg.mil/cfofmis_prod.nsf?OpenDatabase
https://gpstest.46tg.af.mil/webpub/general/bbs.nsf
https://veteranmedals.army.mil/medals.nsf
https://nctrf.natick.army.mil/nctrf/workorder.nsf
https://www.jagcnet.army.mil/laawsxxi/cds.nsf
https://webmail.tax.ny.gov/webmailredirect.nsf
https://web.itss.gsa.gov/itss/gsareg.nsf
https://gscodena07.cr.usgs.gov/QuickPlace/quickplace/.nsf?Login
https://gscamnlm02.wr.usgs.gov/names.nsf?Login
https://lanleventsext.lanl.gov/lanl/events/home.nsf
av-apps.faa.gov/din/dinportal.nsf
www.savannahga.gov/cityweb/civiccenter.nsf
www.fca.gov/apps/legalopn.nsf
yosemite.epa.gov/r10/omp.nsf
info.usitc.gov/domcfg.nsf
science.education.nih.gov/nihlabchallenge.nsf
rimssouthern.oes.ca.gov/archive/SEMS5-98.nsf
www.legis.delaware.gov/egov/portal.nsf
www.oknd.uscourts.gov/kNEWS/ksub.nsf
dpsweb.dps.louisiana.gov/omv1.nsf?OpenDatabase&Start=1&Count=1200&Expand=2
ita-web.ita.doc.gov/FTZ/OFISLogin.nsf
www.tfac.pa.gov/Internet/Bureaus/pdMotorVot.nsf
www.gema.ga.gov/ohsgemawebsh.nsf?OpenDatabase&Start=1&Count=1600&Expand=113
eelndom1.ee.doe.gov/obt/cbrreg.nsf
www.stb.dot.gov/peakletters1.nsf?OpenDatabase&Start=1&Count=300&Collapse=1
web.ita.doc.gov/ia/foreignT.nsf
www.oknd.uscourts.gov/officeoperations/archives.nsf?open
documents.dps.ny.gov/public/Common/ViewDoc.aspx?DocRefId=%7B0D025D9A-7178-4596-BF86-049C6DF28298%7D
notes.mshp.dps.mo.gov/cj35/cj35p075.nsf
www.srrb.noaa.gov/pub/data/CUCF/intercomparison_97/spectral_data/NSF_SUV/Resp/Raw/97268fr4.nsf
www.fjc.gov/fsje/home.nsf
|

# Matches #
matches [

# Extension # .nsf
{ :certainty=>25, :ghdb=>'filetype:nsf' },

# HTTP Server Header
{ :search=>"headers[server]", :version=>/^Lotus-Domino\/([^\s]+)/ },
{ :search=>"headers[server]", :regexp=>/^Lotus-Domino$/ },

# /favicon.ico
{ :certainty=>75, :url=>"/favicon.ico", :md5=>"639b61409215d770a99667b446c80ea1" },

]

end

