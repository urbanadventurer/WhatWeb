##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ASP.NET" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-10
version "0.1"
description "The Global.asa file is an optional file that can contain declarations of objects, variables, and methods that can be accessed by every page in an ASP application. All valid browser scripts (JavaScript, VBScript, JScript, PerlScript, etc.) can be used within Global.asa. The Global.asa file must be stored in the root directory of the ASP application, and each application can only have one Global.asa file. - http://www.w3schools.com/ASP/asp_globalasa.asp

Web.config is the main settings and configuration file for an ASP.NET web application. The file is an XML document  that defines configuration information regarding the web application. The web.config file contains information that control module loading, security configuration, session state  configuration, and application language and compilation settings. Web.config files can also contain application specific items such as database connection strings. - http://en.wikipedia.org/wiki/Web.config"

# 29 results for inurl:web.config ext:config "ConnectionString" @ 2010-09-28
# 31 results for inurl:global.asa ext:asa "ConnectionString" @ 2010-09-28
examples %w|
560889223.net:86/DuolianProject/browser/trunk/DuoLianProject/CenterServer/Website/Web.Config
dev.tyzoh.jp/trac/kotodama/browser/branches/withweb/wk/web.config
github.com/mono/mvcwrench/blob/master/web.config
owu-dnn-clb.googlecode.com/svn-history/r13/trunk/owu-dnn-clb/web.config
riscoltd.com/skf/web.config
sourceforge.jp/projects/lightcrm/svn/view/web/Web.config
svn.koolkraft.net/nblogr/trunk/NBlogr.Web/Web.config
www.cs.odu.edu/~gpd/msprojects/balak_r.0/source/Application/Web.config
www.amlsn.org/web.config
www.danielgranados.net/Trac/axon/browser/trunk/axonweb/Web.config
auclebanon.com/aucchatroom/_vti_cnf/global.asa
buyinsuranceez.com/_vti_cnf/global.asa
globalytics.com/_vti_cnf/global.asa
hep.brown.edu/users/Greg/NP/_vti_cnf/global.asa
hep.brown.edu/users/Greg/Physics3_/_vti_cnf/global.asa
home.rmci.net/mgjurenka/_vti_cnf/global.asa
members.ziggo.nl/pvp128/_vti_cnf/global.asa
mfreitas.por.ulusiada.pt/accv/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/execjobs4u.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.advancedintegratedpestmanagement.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.affordableaviation.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.altmarketing.net/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.amandaandstephen.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.amandalynne.biz/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.americanhealthcare.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.andersonroofing.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.anglenfamilyfun.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.armbrusterassoc.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.artistkatiemiller.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.ashleyca.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.asusbilla23.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.aum-online.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.barrons-company.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.believershomepage.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.betterqualitywindows.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.bluemarblecommunications.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.bnctransit.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.bradrmiller.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.brutonsglass.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.brycom.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.cal-alliance.org/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.californiaforarnold.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.cartconst.com/_vti_cnf/global.asa
mywebspace.sac.winfirst.com/cds/DOMAINS/www.chezsoiinteriors.com/_vti_cnf/global.asa
niobio.grasa.csic.es/wmoreda/webdepca/_vti_cnf/global.asa
tars.rollins.edu/development/advserv/Frontpage%20Request%20Database/myweb/_vti_cnf/global.asa
users.connecttime.net/www/jrhorton/My%20Webs/_vti_cnf/global.asa
xbiker.kilu.de/_vti_cnf/global.asa
www.scarborough.me.us/safety/police/_vti_cnf/global.asa
www.usiu.ac.ke/usiu_old/events/sac_polls/_vti_cnf/global.asa
www.kyokushinkan.af/En/_vti_cnf/global.asa
www.translator-spanish-english.com/_vti_cnf/global.asa
www.tcaa.net.au/_vti_cnf/global.asa
www.cs.uofs.edu/~tjm5/myweb3/_vti_cnf/global.asa
www.dickwaddfetish.com/ad/_vti_cnf/global.asa
www.ratiolink.de/Admin/_vti_cnf/global.asa
www.chemengr.ucsb.edu/~ceweb/psec/psec06/_vti_cnf/global.asa
www.creationfood.ca/_vti_cnf/global.asa
www.dallas.net/~tommyt/myweb4/_vti_cnf/global.asa
www.dekanatsministranten.de/juref/_vti_cnf/global.asa
www.parrocchie.it/sarzana/carmine/_vti_cnf/global.asa
www.coop-anexa.com.ar/_vti_cnf/global.asa
www.pianreginaftp.it/test_locali/smart-forum/neurosmart/_vti_cnf/global.asa
www.viajesindaltravel.com/_vti_cnf/global.asa
|

matches [

{ :text=>'vti_title:SR|Web Settings for Active Server Pages' },

# Get connection strings # global.asa
{ :version=>/connectionstring=DRIVER=([^\n]+)/, :version_regexp_offset=>0 },
{ :version=>/connectionstring=Provider=([^\n]+)/, :version_regexp_offset=>0 },

# Get connection strings # web.config
{:version=>/connectionString="([^\"]+)/, :version_regexp_offset=>0 },
{:version=>/<add key="ConnectionString" value="([^\"]+)/, :version_regexp_offset=>0 },

]

end

