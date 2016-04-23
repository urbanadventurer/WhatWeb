##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "E-Manage-MySchool" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-25
version "0.1"
description "My School is an essential web-based school management system with an influential impact on schools' performance. It is a deliberate and comprehensive user-friendly system that offers numerous features to students, parents, teachers, and school management. It presents a well organized and effective collaboration tool between all parties."
website "http://em.com.eg/"

# Google results as at 2011-05-25 #
# 35 for "2004 E-Manage All Rights Reserved MySchool Version * E-Manage"

# Dorks #
dorks [
'"2004 E-Manage All Rights Reserved MySchool Version * E-Manage"'
]



# Matches #
matches [

# Copyrights text
{ :certainty=>25, :text=>'<TD  height=36  class=text align=center  height=100%>Copyrights ' },

# td
{ :certainty=>75, :text=>"<td style='cursor:pointer' HEIGHT=25z>&nbsp;<img id='vfolder_1' src='styles/" },

# Password field
{ :certainty=>25, :text=>"<input  type='password' name='Sub_Password' " },

# Version Detection # Copyright footer
{ :version=>/2004 E-Manage All Rights Reserved MySchool Version ([\d\.]+) <A href='http:\/\/e-manage\.org\/'>E-Manage<\/A>/ },

]

end

