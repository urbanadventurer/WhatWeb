##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Redmine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-15
version "0.1"
description "Redmine is a flexible project management web application. Written using Ruby on Rails framework, it is cross-platform and cross-database."

# ShodanHQ results as at 2011-09-15 #
# 1,394 for _redmine_session

# Google results as at 2011-09-15 #
# 295 for "Powered by Redmine"
#  25 for inurl:"redmine/login?back_url="

# Dorks #
dorks [
'"Powered by Redmine"'
]

# Examples #
examples %w|
www.redmine.org
dev.metasploit.com/redmine/
redmine.hackthissite.org
redmine.lighttpd.net
hades.synyx.org
www.hostedredmine.com
f.etf.unsa.ba/redmine/login
akita-yurihonjo.net/redmine/login
molokozavod.org/redmine/login
85.214.128.12/redmine/login
route536.ddo.jp/redmine/login
87.252.238.93:443/redmine/login
www.ank-sia.com/redmine/login
developer.digitalstrom.org/redmine/login
svn.cinspiration.de/redmine/login
sys.iqmtel.net/redmine/login
www.krdtbk139.com/redmine/login
www.see.leeds.ac.uk/redmine/
codeblue.umich.edu
redmine.eg.bucknell.edu
netdot.uoregon.edu
theory.cm.utexas.edu/redmine/
wiesel.ece.utah.edu/redmine/
ares.lids.mit.edu/redmine/activity
hydrogeology.glg.msu.edu/redmine/
pub.lmmp.nasa.gov/redmine/
project.harrisonburgva.gov
https://cdcvs.fnal.gov/redmine/
https://nova-daq.fnal.gov/redmine/
https://visitbugs.ornl.gov
https://git.cs.unc.edu/redmine/
https://portal.lib.ohio-state.edu/redmine/
https://intern.mediacluster.de/redmine/login
https://pm.optimustest.com/redmine/login
https://portal.optimusinfo.com/redmine/login
https://globaltrackingsolutions.com/redmine/login
https://pineapple.champlain.edu/
|

# Matches #
matches [

# _redmine_session Cookie
{ :search=>"headers[set-cookie]", :regexp=>/_redmine_session=/ },

# Year Detection # Powered by link
{ :string=>/Powered by <a href="http:\/\/www\.redmine\.org\/">Redmine<\/a> &copy; 2006-(20[\d]{2}) Jean-Philippe Lang/ },

# Meta Description
{ :certainty=>25, :text=>'<meta name="description" content="Redmine" />' },

# Error Page
{ :status=>404, :text=>'<title>redMine 404 error</title>' },

]

end

