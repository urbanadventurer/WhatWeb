##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "QuiXplorer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-16
version "0.1"
description "QuiXplorer is a multi-user, web-based file-manager. It allows you to manage and/or share files over the internet, or an intranet. - Homepage: http://quixplorer.sourceforge.net/"

# Google results as at 2011-05-16 #
# 77 for "QuiXplorer" +Username +Password +"the QuiX project"

# Dorks #
dorks [
'"QuiXplorer" "Username" "Password" "the QuiX project"'
]

# Examples #
examples %w|
www.ausatb.atbrider.com
www.skc.jetos.com
203.59.132.133/index.php
www.dandycomputers.com/productions/index.php
minnesotahousingpartner.org/admin/index.php
https://cockpit.dubbele.com/quixplorer/
ftp.sugimura.com
www.tcx029.com/hang_on/file/
scopeindonesia.com/qix/index.php
www.steeldrafting.co.nz/client/
www.gallaherandbirch.com/quix/
webdisk.avecplus.net
www.stormict.com/crew/
docs.reelgrobman.com/index.php
up.ftscorp.net
synapsecrm.com/quix/index.php
www.sepco.com.tw/webhd/index.php
www.armans.info/articles/plugins/quixplorer/
www.thetutorsagency.co.uk/pages/resources/
www.eh-b-c.com/file_manager/
zarnochwf1.com/theo_loader/
candccontractors.com/plans/
kdharris.net/files
www.zunga.it/quixplorer/
bs-gc.net/quix/
www.gorki.it/eskuola/
julmago.com.ar
213.17.139.251
www.siemensplmsoftware.it/qxpl/index_1.php
www.williamspartnership.com/filetransfer/
www.achmonline.org/index.php
www.smederijdeknijf.be/filemanager/index.php
hiltnetwork.com/access/
sampa.if.usp.br/~eloisa/
www.valenticoaching.com/readings/
solutely.co.uk
olesouthweb.com/files/
claude.sytes.net/ftp/index.php
ei.et.tudelft.nl/publications/bestandsbeheer/index.php
bpsgroup.it/members/
koglib.becev.cz
https://dropbox.rad.msu.edu/
www.esi.es/quixplorer/
aceshare.net
|

# Matches #
matches [

# Version Detection # Default Title
{ :version=>/<title>QuiXplorer ([^\s]+) - the QuiX project<\/title>/ },

# Version Detection # Footer link
{ :version=>/<A class="title" href="http:\/\/quixplorer\.sourceforge\.net" target="_blank">QuiXplorer ([^<]+)<\/A> - <A href="http:\/\/quix\.tk" target="_blank">the QuiX project<\/A><\/SMALL>/ },

# Footer link
{ :text=>'<A class="title" href="http://quixplorer.sourceforge.net" target="_blank">QuiXplorer</A> - <A href="http://quix.tk" target="_blank">the QuiX project</A></SMALL>' },

]

end


