##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :name & :probability
# Version 0.3
# Uses :version=>//

Plugin.define "FormMail" do
author "Andrew Horton"
version "0.3"
description "Common form email script.

FormMail is a Perl script written by Matt Wright to send mail with sendmail from the cgi-gateway. Early version didn't have a referer check. New versions could be misconfigured. Spammers are known to hunt them down (by means of cgi-scanning) and abuse them for their own evil purposes if the admin forgot to check the settings.http://www.securityfocus.com/bid/3954/discussion/"



#  
  
  
  
matches [

{:text=>'This form was suplied by <A href="http://www.worldwidemart.com/scripts/formmail.shtml"' },
{:text=>'<a href="http://www.worldwidemart.com/scripts/formmail.shtml">FormMail</a>' },
{:name=>"copyright",  :certainty=>75, :regexp=>/&copy; 19[\d]+ -[\d]+ Matt Wright<BR>/ },
{:certainty=>75, :text=>'<title>FormMail ' },
{:certainty=>50, :text=>'A Free Product of <a href="http://www.worldwidemart.com/scripts/">Matt\'s Script Archive,' }, #'
{:text=>"<tr><th><font size=+2>FormMail</font></th></tr>" },
{:ghdb=>"inurl:/FormMail.pl" },
{:version=>"1.9", :regexp=>/Copyright 1995 - 2001 Matt Wright<br>[\s]+Version 1.9/ },
{:version=>/FormMail<\/a>[\s]+V([\d\.]+)/i,  :name=>"version" } 
]

end

