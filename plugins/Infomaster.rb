##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Infomaster" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-16
version "0.1"
description "InfoMaster ePlanning software - asset management and property development application tracking and planning - Homepage: http://www.infomaster.com.au/"

# Google results as at 2011-10-16 #
# 40 for "Powered by Infomaster"
# 33 for inurl:"modules/applicationmaster/default.aspx"
# 30 for inurl:"modules/propertymaster/default.aspx"
# 29 for (inurl:"modules/applicationmaster/default.aspx"|inurl:"modules/propertymaster/default.aspx")
#  9 for intitle:"MasterView 2.0 Property Master"

# Dorks #
dorks [
'"Powered by Infomaster"',
'(inurl:"modules/applicationmaster/default.aspx"|inurl:"modules/propertymaster/default.aspx")'
]

# Examples #
examples %w|
datracker.cessnock.nsw.gov.au/modules/applicationmaster/default.aspx
hsconline.hornsby.nsw.gov.au/appenquiry/modules/applicationmaster/default.aspx?page=disclaimer
web.tcdc.govt.nz/MPPuProd/masterplan/enquirer/default.aspx
planning.nmc.tas.gov.au/modules/PropertyMaster/default.aspx
planning.mackay.qld.gov.au/masterview/Modules/PropertyMaster/default.aspx?page=login
203.34.0.76/datracking/modules/propertymaster/default.aspx?page=search
masterview.cockburn.wa.gov.au/MasterViewUI/modules/PropertyMaster/Default.aspx
apptracking.lakemac.com.au/modules/PropertyMaster/default.aspx?page=login
https://www2.bmcc.nsw.gov.au/datracking/Modules/ApplicationMaster/default.aspx?page=disclaimer
https://epwgate.waverley.nsw.gov.au/DA_Tracking/Modules/PropertyMaster/Default.aspx
|

# Matches #
matches [

# Version Detection # Title
{ :version=>/<head><title>[\s]+MasterView ([\d\.]+) Property Master[\s]+<\/title>/, :string=>"MasterView" },

# Class + Powered by
{ :regexp=>/class="ackn">[\s]*Powered by InfoMaster/ },

# StyleSheets
{ :text=>'<link href="../../MasterView.css" type="text/css" rel="stylesheet"', :string=>"MasterView" },
{ :text=>'<link href="../../App_Themes/MasterView/MPLeftNavStyle/PanelBar.MPIFMA.css" type="text/css" rel="stylesheet" />', :string=>"MasterView" },

# JavaScript
{ :text=>'<script language="javascript" src="../../common/masterView.js"></script>', :string=>"MasterView" },

# Form
{ :string=>/<form name="frm(MasterView|MasterPlan)" method="post" action="default\.aspx/ },

]

end

