##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sendcard" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Sendcard is a multi-database (It currently supports 9 different databases!) ecards script or virtual postcard program written in PHP. Suitable for large or small sites, it is very easy to setup, and comes with an installation wizard. - Homepage: http://www.sendcard.org/"

# Google results as at 2011-03-15 #
# 255 for scscsc320
# 141 for "Powered by sendcard - an advanced PHP e-card program" -dork

# Examples #
examples %w|
www.sendcard.org/sendcard/
www.havaneser-und-landseer.de/sendcard/
www.mirakle.net/sendcard/
www.liberalgreetings.com/sendcard/
www.gardenorganic.org.uk/sendcard/index.php
www.gerardkeegan.co.uk/sendcard/index.php
www.postudios.com/sendcard/
www.vcbio.science.ru.nl/virtuallessons/landscape/ooij/e-card/
www.eulenatelier.at/sendcard/
www.linneaartline.com/public/sendcard/
www.mirakle.net/sendcard/
inside.amnestyinternational.be/sendcard/
ludoeduko.com/sendcard/
www.dagmars-bilderwelt.de/sendcard/
karppaus.info/postikonttori/
www.lesbenforen.de/webseiten/sendcard/
www.grusskarten.franzengels.ch/amrum.php
www.gaypaintings.com/ecard/
www.nothinbuttdogs.net/sendcard/Basset.php
www.bandbclub.com/sendcard/
www.ethioview.com/sendcard/
www.waechters-home.de/php-bin/sendcard/
www.norikooki.com/sendcard/
www.korttihai.fi/e-kortti/
www.mega.gr/sendcard/
www.grusskarten.sillc.net
www.pannet.pa/postal/mipueblito.php
www.tamlinh.net/sendcard/poem.php
www.psychiatriegespraech.de/grusskarten/
www.plkcastar.edu.hk/sendcard/chinewyear.php
www.saldelcloset.com/comunidad/postales/buendia001.php
|

# Matches #
matches [

# Powered by logo link
{ :regexp=>/<a href="http:\/\/(sendcard.sf.net|www.sendcard.org)\/"( title="download your own PHP e-card script")?><img src="poweredbysendcard102x47.gif"[^>]+alt="Powered by sendcard - an advanced PHP e-card program"[^>]*><\/a>/ },

# Powered by logo
{ :certainty=>25, :regexp=>/<img src="poweredbysendcard102x47.gif"[^>]+alt="Powered by sendcard - an advanced PHP e-card program">/ },

# HTML Comment
{ :text=>"<!-- The following line should allow me to search on google and find sendcard installations -->" },

# "scscsc320" string provided for Google hackers as per HTML comment:
# <!-- The following line should allow me to search on google and find sendcard installations -->
{ :text=>'<div style="display: none; color: White;">scscsc320</div>' },

]

end


