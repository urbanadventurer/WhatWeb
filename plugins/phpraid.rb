##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-21 #
# Updated version detection
##
Plugin.define "phpRaid" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-16
version "0.2"
description "phpRaid is a raid management tool for World of Warcraft - a MMORPG developed by Blizzard. - homepage: http://www.spiffyjr.com/"

# Google results as at 2010-06-16 #
# 32,800 for "Raid Management Provided by phpRaid"

# Examples #
examples %w|
www.trollbane.net/phpraid/
www.tenusoft.net/a5o/phpraid/
www.alesandreo.net/phpraid/
www.mydigital.nl/phpraid/
forum.iwas-wow.de/phpRaid/
www.union-sippe.de/phpraid/
www.twilighthope.org/phpraid/
www.trollbane.net/phpraid/
www.metamorphosisguild.net/raid/
www.getcoguild.com/phpraid/
trashmobs.bitay.net/phpraid/
blackrockcartel.servegame.org/raid/
nos-forum.de/phpraid/roster.php
www.scribs.de/phpraid/
www.imperium-khadgar.eu/raid/
phpraid.dementum.de
www.tyrngaardes-en.de/raid/
www.tkodalleria.com/phpRaid/
www.smokeandmirrorsguild.com/phpraid/
www.beckoningguild.com/phpraid/
www.aesirsentinels.org/phpRaid/
www.wow-ronin.be/events/
www.divinelegacy.org/raid/
zone.no-friends.net/raidzone/
teamretribution.net/forums/raid/
raids.empyrium.fr/roster.php
www.semperfi-hellfire.com/phpRaid/
www.tffguild.com/phpraid/
www.atrummortis.net/cms/phpraid/
www.odgamers.com/fallen/PHPraid/
www.die-letzten-helden.org/phpraid/roster.php
sbguild.net/phpRaid/view.php
retroverve.com/RaidEvent/
www.tikiweb.net/wow/schedule/roster.php
playerhost.net/semper_fidelis-anub_arak/raid/
www.trouphaz.com/rcccal/
wowraid.altuschillers.net
www.confined.dk/phpraider/
raid.thearistocracy.net
www.mercenariesoftheblade.org/phpRaid/
www.ellisande.org/v1/phpraid/
stern-von-kalimdor.de/svk-raid/
www.demonicreich.com/raidsignups/roster.php
relentless-scryers.com/raidsignup/
www.demolicniceta.eu/phpraid/
www.legions-guild.com/signup/
|

# Matches #
matches [

# Provided by text
{ :certainty=>75, :text=>'Raid Management Provided by phpRaid' },

# Version Detection # provided by text
{ :version=>/Raid Management Provided by <a href="http:\/\/www.spiffyjr.com\/">phpRaid<\/a> v([\d\.]+)/ },

]

end

# an aggressive plugin could check for /docs/phpRaid_install_doc.pdf

