##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated version detection
##
Plugin.define "Confluence" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.2"
description "Confluence combines powerful online authoring capabilities, deep Office integration and an extensive plugin catalog to help people work better together and share information effortlessly. - homepage: http://www.atlassian.com/software/confluence/"

# About 3,490 results for "Atlassian Confluence" +"the Enterprise Wiki" +"Intranet software for documentation and knowledge management" +"Report a bug" @ 2010-06-01
examples %w|
sandbox.onconfluence.com
artemistech.com
wiki.objectstyle.org
www.securecoding.cert.org
support.hyperic.com
docs.codehaus.org
opticks.org
wiki.list.org
www.artemissoftware.biz
docs.rice.edu
confluence.pegasus.isi.edu
www.oscommerce.info
wiki.phpbb.com
www.bobsgear.com
confluence.slac.stanford.edu
fosswiki.liip.ch
wiki.flux-cms.org
svn.oscommerce.com
wiki.csinitiative.com
wiki.fourkitchens.com
k15t.com/confluence/
mygrid.org.uk/dev/wiki/
support.process-one.net/doc/display/
|

matches [

# GHDB Match
{ :certainty=>75, :ghdb=>'"Atlassian Confluence" "the Enterprise Wiki" "Intranet software for documentation and knowledge management" "Report a bug"' },

# Powered by text
{ :text=>'<li class="noprint"><a href="http://www.atlassian.com/software/confluence" class="hover-footer-link">Atlassian Confluence</a>' },

# Version detection # Powered by text
{ :version=>/<a href="http:\/\/www.atlassian.com\/software\/confluence" class="hover-footer-link">Atlassian Confluence<\/a> ([0-9_\.]+)/, :offset=>0 },

]

end

