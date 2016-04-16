##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Online-Grades" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Online Grades is the leading free-software project that allows K-12+ student grades attendance information to be posted onto a dynamic web site. Online Grades is not a web-based gradebook. Instead, it accepts grade export information from several popular gradebook software programs such as Easy Grade Pro, Gradekeeper, Misty City's Grade Machine, and PGGP and places the grade information online securely."
website "http://www.onlinegrades.org/"

# Google results as at 2011-03-15 #
# 100 for "Powered by Online Grades"
#  70 for "Powered by Online Grades" -dork

# Dorks #
dorks [
'"Powered by Online Grades" -dork'
]



# Matches #
matches [

# Disclaimer
{ :text=>"<small><br /><em>Disclaimer</em>:  If you handed in an assignment or took a test today, don't expect the grade to be online immediately.  Teachers only update their grade books as needed.</small><ul><li>" },

# Version Detection # Meta Keywords
{ :certainty=>75, :version=>/<meta name="keywords" content="Online Grades Version ([^\s^"]+)" \/>/ },

# Version Detection # Footer
{ :version=>/      <div class="center">[\r\n]      Online Grades Version:[\r\n]      ([^\s]+)      <\/div>/ },

# Meta Author
{ :text=>'<meta name="author" content="Online Grade Posting System -- http://www.onlinegrades.org" />' },

# HTML Comments
{ :text=>'<!-- YOU CAN SAFELY REMOVE OR CHANGE ANYTHING BETWEEN THIS SECTION OF COMENTED CODE -->' },
{ :text=>'<!-- STOP REMOVING LINES HERE IF REMOVING/CHANGING THE FOOTER -->' },

# Powered by logo
{ :regexp=>/<a href="http:\/\/www.onlinegrades.org"><img src="[^"^>]+\/images\/og.png"[^>]+alt="Powered by Online Grades"[^>]*><\/a>/ },

]

end


