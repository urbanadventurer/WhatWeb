##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Web-Data-Administrator" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.1"
description "The Web Data Administrator is a utility program implemented in ASP.NET that enables you to easily manage your SQL Server data wherever you are."
website "http://www.microsoft.com/downloads/details.aspx?familyid=f0d03472-5e6c-459e-a6d8-6745a729c3c9&displaylang=en&displaylang=en"


matches [

# About 55 results @ 2010-06-01
{:name=>'GHDB: intitle:"Web Data Administrator - Login" +"Please enter your SQL Server credentials"',
:certainty=>75,
:ghdb=>'intitle:"Web Data Administrator - Login" +"Please enter your SQL Server credentials"'
},

{:name=>"default title",
:text=>'<title>Web Data Administrator - Login</title>'
},

{:name=>"default form html",
:text=>'<form name="WebForm1" method="post" action="Default.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="WebForm1">'
}

]

end

