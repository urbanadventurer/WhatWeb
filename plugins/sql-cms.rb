##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SQL-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-04
version "0.1"
description "SQL CMS is a Multi Award Winning web based Content Management System (CMS) for Microsoft SQL Server. SQL CMS is designed to be very simple to use, it was built with the end user in mind so is perfect for developers or their clients. - Requires: .Net Framework Installed (v3.5)"
website "http://www.developerinabox.com/"

# Google results as at 2011-03-04 #
# 2 for inurl:"Login.aspx" Username Password SQLCMS



# Matches #
matches [

# Login Page # Default JavaScript + CSS
{ :text=>'<script type="text/javascript">var LoginAttempts=0;</script><link href="CSS/styles/default.css" type="text/css" rel="stylesheet" /></head>' },

# Login Page # Language Select HTML
{ :text=>'<tr><td>Language</td><td><select id="ddlLanguage" onchange="location.href=\'admin.aspx?lang=\'+SelectedValue(\'ddlLanguage\')"><option value="English" selected="selected">English</option>' },

# Login Page # Version Detection # Powered by logo alt text
{ :version=>/<a href="http:\/\/www.developerinabox.com" target="_blank"><img src="Img\/poweredby.png" style="position:absolute;right:0px;bottom:-30px;margin-top:2px;border:0px" title="SQLCMS v([\d\.]+)"\/><\/a>/ },

]

end


