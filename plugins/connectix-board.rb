##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-18 #
# Updated version detection
##
Plugin.define "Connectix-Boards" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.2"
description "Connectix-Boards Forum - homepage: http://www.connectix-boards.org/index.php"

# Google results as at 2010-08-22 #
# 99 for "powered by Connectix Boards" -Vulnerability

# Examples #
examples %w|
beta.connectix-boards.org/index.php
animavatars.net78.net/forums/admin.php
www.guilde.voleurs.free.fr/forum/admin.php
chimaria.free.fr/install.php
forum.connectix-boards.org
forum.sans-sursis.com
forum.zenwalk-fr.org
forum.apyka.com
lestoques.0fees.net
www.amymacdonald-france.com
forum.dreem-euromed.org
cbtraduction.pixelglobal.info
ishimaru-design.servhome.org/forum/index.php
neo.beta.free.fr/encb/index.php
forum.free-track.net/index.php
logistique.vossey.net/forum/index.php
the8day.info/Gaymodz/index.php
forum.bakoro.com/index.php
cymanager.net/index.php
blogmcw.com/forum/index.php
forum.jeudelapolitique.com/index.php
lematch.net/forum2/index.php
karmetendas.goldzoneweb.info/forum/forum.html
www.simulateur.info
www.inforisque.info/forum-inforisque/index.php
www.amicalementcarpe.com/forum/index.php
www.directwind.com/forum/forum.html
www.logistiquemod.com/forum/index.php
www.free-track.net/forum/index.php
www.bulle-immobiliere.net/index.php
www.webosoft.info/forum/forum.html
www.mi-aime-a-ou.com/forum/index.php
www.asiexpo.com/japantouch/forum/
www.inforisques.info/forum-inforisque/index.php
www.lamaisoncontainer.com/Forum2/ConnectixBoards_0.8.4/index.php
www.i974.com/forum/rss.php
www.gestion-des-risques.info/forum-inforisque/index.php
www.santesoft.fr/forums/index.php
www.adrenaline-kitesurf.com/forum/index.php
www.generation-snes.fr/Forum/index.php
www.topvisages.net/forum_new/index.php
www.prestipedia.net/forum/index.php
www.nexteam.net/forum/
www.dubai-immobilier.net/index.php
www.albasrah-forums.com/vb/showthread.php
www.levoyageur.net/forums/forum.html
www.trollcauchois.info/forum/
www.batista.be/Forum/index.php
www.tck-jump.levrai.com/forum/index.php
www.psplabs.com/forums/
www.risque-professionnel.fr/forum-inforisque/index.php
www.zeperfs.com/forum/index.php
|

# Matches #
matches [

# Install page
{ :text=>'	<title>Installation de Connectix Boards</title>' },

# Error page
{ :text=>'    <title>Connectix Boards - Fatal Error</title>' },
{ :text=>'	<title>Connectix Boards Error</title>' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.connectix-boards.org"[^>]*>Connectix Boards<\/a> ([^&]+) &copy; [0-9]{4}-[0-9]{4}/ },

]

end

