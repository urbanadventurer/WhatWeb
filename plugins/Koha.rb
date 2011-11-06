##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Koha" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Koha is an open source software library automation package (ILS) - Homepage: http://koha-community.org/"

# Google results as at 2011-07-27 #
# 262 for inurl:cgi-bin/koha ext:pl
#  57 for intitle:"Log in to Koha" +Password

# Dorks #
dorks [
'intitle:"Log in to Koha" "Password"',
'inurl:cgi-bin/koha ext:pl'
]

# Examples #
examples %w|
library.software.coop
library.software.coop:8080
head.bibkat.no
head.bibkat.no:8080
staff.kohademo.esilibrary.com
opac.kohademo.esilibrary.com
catalog.bywatersolutions.com
intranet.bywatersolutions.com
library.bswa.org
l2-staff.load.bywatersolutions.com
l1-staff.load.bywatersolutions.com
koha-3.2demo-staff.osslabs.biz
koha-3.2demo-staff.osslabs.biz:8080
koha.nhusd.k12.ca.us:8080
su.maktabat-online.net:8080
alshafallah.maktabat-online.net:8080
mu.maktabat-online.net:8080
115.119.146.176:8081
ptfs-staff.demo.kohalibrary.com
scls-staff.kohalibrary.com
gcpl2-staff.sandbox.kohalibrary.com
ptfs-staff.demo.kohalibrary.com
www.koha.libsoul.com
www.afghandigitallibraries.org:4001
solr.biblibre.com
staff.kalibindia.com
intranet.nikkeibunko.com
sesiahsadminbackup.intersearch.com.au
131.175.9.53:8080
lib.bue.edu.eg:8080
kohanor33.bibkat.no:8080
opencat-staff.library.ucar.edu
library.miuegypt.edu.eg
wat.lib.tldsb.on.ca:8080
sbe.lib.tldsb.on.ca:8080
kramer.mayfirst.org:8080
librarian.opus.koha.catalystdemo.net.nz
koha.com.msu.edu:8080
kingsfund.koha-ptfs.eu:8080
koha.fhcrc.org
vieuxmontreal-intranet.koha.ccsr.qc.ca
koha.jgu.edu.in:8080
koha-pro.devinci.fr
ktmkirjasto.kuopio.fi
devel-pro.tamil.fr
koha.ffzg.hr:8080
kohastaff.halton.gov.uk
librarian.ero.govt.nz
koha.kelantanlibrary.gov.my:8000
elibrary.kelantan.gov.my
koha.nlp.gov.ph
connemara.tnopac.gov.in
thiruvannamalai.tnopac.gov.in
pudukkottai.tnopac.gov.in
vellore.tnopac.gov.in
archives1.dags.hawaii.gov:8000
library.asti.dost.gov.ph
zed.mdah.state.ms.us
dlis.gov.dm
catalog.library.strathamnh.gov
library.nal.gov.au
kohalibrary.halton.gov.uk
|

# Matches #
matches [

# Aggressive # favicon.ico
{ :md5=>"0c240ea1e838d2b398f48122924bf7a0", :url=>"/opac-tmpl/prog/en/includes/favicon.ico" },
{ :md5=>"0c240ea1e838d2b398f48122924bf7a0", :url=>"/intranet-tmpl/prog/en/includes/favicon.ico" },

# favicon.ico HTML
{ :regexp=>/<link rel="shortcut icon" href="\/(intranet|opac)-tmpl\/[^\/]+\/[a-z]{2}\/includes\/favicon\.ico" type="image\/x-icon" \/>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Koha ([^\s^"]+)" \/>/ },

# input name="koha_login_context"
{ :regexp=>/<input type="hidden" name="koha_login_context" value="(opac|intranet)" \/>/ },

# CSS
{ :text=>'<link rel="stylesheet" type="text/css" href="/intranet-tmpl/prog/en/lib/jquery/plugins/ui.tabs.css" />' },
{ :text=>'<link rel="stylesheet" type="text/css" href="/opac-tmpl/prog/en/lib/jquery/plugins/ui.tabs.css" />' },

# Admin Page
{ :text=>'<li><a href="/cgi-bin/koha/lostpassword.pl" title="Password Lost and Found">Lost your password?</a></li>' },

# Admin Page # HTML Comment
{ :certainty=>25, :text=>'<!-- login prompt time-->' },

# Admin Page # You are not logged in
{ :text=>'<div id="help"><span class="loggedin">You are not logged in | </span><a href="/cgi-bin/koha/help.pl" onclick="Help(); return false;">[ ? ]</a></div>' },

]

end

