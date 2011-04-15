##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zoom-Search-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-04-11
version "0.1"
description "Zoom is a software package that creates a search engine for your website, intranet, CD, or DVD - Homepage: http://www.wrensoft.com/zoom/"

# Google results as at 2011-04-11 #
# 337 for inurl:zoom_per_page

# Dorks #
dorks [
'inurl:zoom_per_page'
]

# Examples #
examples %w|
www.usmd.edu/search/index.php
www.oil-paintings.com/searchindexer/search.php
co.silverbow.mt.us/search/index.asp
www.virtualmedicalcentre.com/search/searchadv.asp
www.hacienda.gobierno.pr/search/search.asp
apps.bond.edu.au/search-results/search-bond.asp
www.ohr.wisc.edu/search/pvl_search.asp
www.rcn.montana.edu/search/search.aspx
www.hallmann-sales.com/search.asp
www.tsra.gov.au/search-results.aspx
www.parliament.act.gov.au/search/lasearch.asp
www.legassembly.act.gov.au/search/lasearch.asp
www.clarence.nsw.gov.au/advsearch/search.asp
www.foodauthority.nsw.gov.au/search.asp
www.rouswater.nsw.gov.au/cmst/rw010/advanced_search.asp
www.rma.gov.au/zoom/search.php
www.independenceks.gov/Search-Independence-Kansas-50330.asp
www.staffordshirefire.gov.uk/SearchResults.asp
www.nmsa.gov.pg/search.php
www.beoe.gov.pk/search.asp
www.tndeaflibrary.nashville.gov/search.asp
www.wsgc.wa.gov/search/search1.asp
www.ce9.uscourts.gov/search/search.php
www.rockymountnc.gov/search.asp
da.lacounty.gov/search.asp
www.iowadot.gov/design/search.asp
rems.ed.gov/search/search.cgi
www.bsb.mt.gov/search/index.asp
www.odnetwork.org/search/searchmailman.php
www.rbwm.gov.uk/search/search.asp
www.alpharetta-ga.gov/alphasearch.php
www.mticm.gov.ls/home/search.php
www.cambsfire.gov.uk/index/search.php
inter4.loudoun.gov/search/search.asp
eynsham-pc.gov.uk/site_search.asp
epla.perak.gov.my/dewan/hansard.php
cotcorp.gov.in/search.asp
www.limpopo-dlgh.gov.za/search_engine/search.php
www.customs.gov.pg/search.php
www.armagh.gov.uk/searchzoom.php
www.icb.gov.bd/search.php
|

# Matches #
matches [

# Search powered by
{ :text=>'<center><p><small>Search powered by <a href="http://www.wrensoft.com/zoom/" target="_blank"><b>Zoom Search Engine</b></a></small></p></center>' },

# Version Detection # HTML Comment
{ :version=>/<!--Zoom Search Engine Version ([\d\.]+ \([\d]+\) [A-Z]{3})-->/ },

# Version Detection # HTML Comment
{ :version=>/<!--Zoom Search Engine Version ([\d\.]+ \([\d]+\))-->/ },

]

end


