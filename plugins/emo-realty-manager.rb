##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EMO-Realty-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.1"
description "EMO Realty Manager is a full PHP/MySQL content management system for property companies, real estate agents or FSBO site."
website "http://www.emophp.com/"

# Google results as at 2010-07-25 #
# 15 for "powered by EMO Realty Manager"

# Dorks #
dorks [
'"powered by EMO Realty Manager"'
]



matches [

# <td align='left'>&copy; 2010 Emophp.COM</td><td align='right'><a href='http://emophp.com/' target=_blank>Powered by Emo Realty Manager</a></td></tr></table><br></center>
# <td align='left'>Copyright © 2007 Emophp.com</td><td align='right'><a href=http://emophp.com/>Powered by EMO Realty Manager</a></td></tr></table><br>
# <td align='left'>Copyright © 2007 Emophp.com</td><td align='right'><a href=http://emophp.com/>Powered by EMO Realty Manager</a></td></tr></table><br>
# <td align='left'>Copyright © 2006 Emophp.COM</td><td class='text8' align='right'>Powered by <a href='http://emophp.com'>EMO Realty Manager</a></td></tr></table><br>

{ :regexp=>/[0-9]{4} Emophp.[com|COM]*<\/td><td[\ class='text8']* align='right'><a href=[\']*http:\/\/emophp.com[\/]*[\']*[\ target=_blank]*>Powered by [EMO|Emo]+ Realty Manager<\/a><\/td><\/tr><\/table><br>/ },

{ :regexp=>/[0-9]{4} Emophp.[com|COM]*<\/td><td[\ class='text8']* align='right'>Powered by <a href=[\']*http:\/\/emophp.com[\/]*[\']*[\ target=_blank]*>[Emo|EMO]+ Realty Manager<\/a><\/td><\/tr><\/table><br>/ },

]


end

