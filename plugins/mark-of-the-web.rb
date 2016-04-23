##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mark-of-the-Web" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "The MOTW is a comment added to the HTML markup for a Web page. When a user opens the Web page from their local machine, Internet Explorer references this comment to determine the security zone in which it should run the page."
website "http://msdn.microsoft.com/en-us/library/ms537628%28v=vs.85%29.aspx"

# The Mark of the Web (MOTW) is a feature of Windows Internet Explorer that enhances security by enabling Internet Explorer to force Web pages to run in the security zone of the location the page was saved from.as long as that security zone is more restrictive than the Local Machine zone.instead of the Local Machine zone. The role of the MOTW is more prominent with Microsoft Internet Explorer 6 for Windows XP Service Pack 2 (SP2) because of increased security restrictions in the Local Machine zone. When you are developing Web content, the MOTW enables you to test your active HTML documents in the security zone where you intend the pages to run. Adding the MOTW to your Web pages also enables you to fully test their compatibility with users' security settings.



# Matches #
matches [

# Extract URL
{ :string=>/<!-- saved from url=\([\d]+\)([^>]+) -->[\r\n]/ },

]

end


