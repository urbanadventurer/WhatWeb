##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Quest-Password-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-26
version "0.1"
description "Quest Password Manager enables the end user to reset forgotten passwords securely, allowing administrators to implement stronger password policies while reducing the help desk workload."
website "http://www.quest.com/password-manager/"

# 19 for "Your browser or some settings do not meet the requirements of Password Manager."
# 21 for intitle:"Quest Password Manager" "Enter Your User Name"

# Dorks #
dorks [
"Your browser or some settings do not meet the requirements of Password Manager."
]



# Matches #
matches [

{ :text=>'<div class="text-color-error error-control" style="display:none" id="Account_NotFilled.Textbox">' },

{ :text=>'<input type="submit" class="text-color-control button button-text" value="OK" name="" id="button_Ok_control" />' },

{ :text=>'<head><link href="../../App_Themes/Default/Colors.css" type="text/css" rel="stylesheet" /><link href="../../App_Themes/Default/Controls/' },

{ :text=>'<body id="ctl00_ctl00_ctl00_ctl00_Body" class="master master-base-main master-page-home">' },

{ :text=>'<form name="aspnetForm" method="post" action="index.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="aspnetForm" enctype="multipart/form-data" autocomplate="off">' },

{ :text=>'<div id="ctl00_ctl00_ctl00_ctl00_ContentPlaceHolder_PleaseWait_content" class="progressbar"></div>' },

{ :text=>"<div id='Control_ctl00_ctl00_ctl00_ctl00_ContentPlaceHolder_ControlBrowserWarning_BrowserWarningPanel_ButtonPlaceHolder1_ButtonIgnore' class='enable hide  text-color-control button button-text'>" },

# Error Page
{ :text=>'<input type="hidden" id="GINAPageExpiration" value="1200" />' },

# /QPM/App_Themes/Default/Images/Controls/Icons/32/icon_Warning.png
{ :md5=>"11a756ae488de6e3e31c675ab921e70f", :url=>"/QPM/App_Themes/Default/Images/Controls/Icons/32/icon_Warning.png" },

# Version Detection # /QPM/User/About/index.aspx
{ :version=>/<span id="ctl00_ctl00_ctl00_ContentPlaceHolder_ContentPlaceHolder_ContentPlaceHolder_AboutControl_LabelVersion">Full version number: ([^<]+)<\/span>/ },

]

end

