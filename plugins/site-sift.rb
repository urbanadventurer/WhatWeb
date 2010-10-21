##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated matches
##
Plugin.define "Site-Sift" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-29
version "0.2"
description "Site Sift Listings is a FREE directory script with many features that webmasters want including creation of static pages. Site Sift Listings can be customized to create the look and feel you want from a directory. Requirements: PHP. - homepage: http://scripts.site-sift.com/"

# 96 results for "powered by Site Sift" -exploit -"SQL Injection" @ 2010-06-29
# 148 results for inurl: "index php go addpage" @ 2010-06-29
# 68 results for inurl: "index.php?go=detail id=" @ 2010-06-29
examples %w|
scripts.site-sift.com/demo/
www.twbdir.com
www.litigationweb.com
www.atoznetauto.com
weinkatalog.info
www.businessestogo.net
www.forectory.com
www.safeemail.org/directory/
www.fishing-vacation.info
www.smindsrt.com
www.linkbuildingdir.com/link_directory/
www.herdir.com
www.dir6.com
www.fishing-charters.biz/7/USA/
www.airsoftgiant.net
www.nunti-petreceri.ro
audiodirectory.co.uk
www.dirdirdir.net
www.organicpharming.com/links/
www.pixelsshow.com
www.indianlinkexchange.com/directory/
euroinvestigator.org
directory.leadingsolutions.com
www.4mybody.com
mohyals.info/dir/
directory.azmi.info
www.bestuk.biz/ss/
www.artelinks.net
www.adultwebdirectory.org
www.bramptonlistings.info
www.directorypatch.com
www.estate-zone.com
www.webdirectorysquare.com
www.digistore.co.nz/directory/
www.ladiesofhack.com/directory/
www.allbizlistings.com
www.cranialcranialsacraltherapy.com/Cranial_Sacral_Osteopathy/
www.badcreditcreditcards.biz/creditdirectory/
www.uzbeksites.com
www.angelicdirectory.com/85/Card_games/
www.thevipdirectory.info
|

matches [

# URL patterns
{ :certainty=>25, :ghdb=>'inurl: "index.php?go=detail id="' },
{ :certainty=>25, :ghdb=>'inurl: "index php go addpage"' },

# Powered by text
{ :certainty=>25,:ghdb=>'"powered by Site Sift"' },
{ :regexp=>/<div align="center" class="copyright">powered by <A class="bottomlink" href="http:\/\/[scripts|www]+.site-sift.com[\/]*">Site Sift[^<]*<\/A><\/div>/i },

# Default HTML comments
{ :text=>'				<!-- end of header.php -->' },
{ :text=>'				<!-- begin of footer.php -->' },

]

end

