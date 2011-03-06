##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Subrion-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.2"
description "Subrion CMS unites the functionality of articles script, auto classifieds script, realty classifieds script, and web directory script all in one package. - homepage: http://www.subrion.com/"

# Google results as at 2010-08-08 #
# 88 for "powered by Subrion CMS"

# Examples #
examples %w|
demo.subrion.com
publishing.subrion.com
autos.subrion.com
realty.subrion.com
directory.subrion.com
bedroomblunders.com/install/index.php
www.backyardconfessions.com/install/index.php
hopecdc.com/install/index.php
prayerwave.com/install/index.php
dwiabogado.com/directory/
fr.clarase.com
talktothehill.com
owensborotrucksales.com
www.storyalley.com
www.iqonsworld.com
www.datingpot.com
www.intelliresponder.com
www.triger.co.il
www.strugglingtomakeit.com
www.realgirlfriendtalk.com
www.lyrescript.com
www.afromusicians.com
www.london-reviews.com
www.westcreeknj.com
www.downlowconfessions.com
www.lconfessions.com
howtohowdo.com
www.intelliants.com
standingintheneedofprayer.com
poetryalley.com
123email.com.br
www.clarase.com
www.waterfilterdealers.com
www.webconcepts.co.il
|

# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.subrion.com">Subrion CMS</a>' },
{ :text=>'Powered by <strong><a href="http://www.subrion.com/" title="Subrion CMS" target="_blank">Subrion CMS</a>' },
{ :text=>'powered by <a href="http://www.subrion.com/" title="Site powered by Subrion CMS">Subrion CMS</a>' },

# Version Detection # Meta generator
{ :version=>/	<meta name="generator" content="Subrion CMS ([\d\.a-zA-Z]+)" \/>/ },

# Version Detection # Install Page # Default Title
{ :version=>/	<title>Subrion CMS ([\d\.a-zA-Z]+) - Web Installer<\/title>/ },

# Version Detection # Powered by text
{ :version=>/	Powered by <a href="http:\/\/www.subrion.com\/" title="Classifieds Software">Subrion CMS<\/a> Version ([\d\.a-zA-Z]+)<br \/>/ },

]

end

