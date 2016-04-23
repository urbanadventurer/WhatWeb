##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ionCube-Loader" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-05
version "0.1"
description "ionCube Loader handles the reading and execution of ionCube encoded PHP files at run time."
website "http://www.ioncube.com/loaders.php"
# More info: http://en.wikipedia.org/wiki/IonCube

# Google results as at 2011-06-05 #
# 147 for inurl:"loader-wizard.php" ext:php intitle:"ionCube Loader Wizard"

# Dorks #
dorks [
'inurl:"loader-wizard.php" ext:php intitle:"ionCube Loader Wizard"'
]



# Matches #
matches [

# GHDB # filename and title
{ :certainty=>75, :ghdb=>'inurl:"loader-wizard.php" filetype:php intitle:"ionCube Loader Wizard"' },

# Logo HTML
{ :text=>'<img src="?page=logo" alt="ionCube logo">' },

# Updated version link
{ :text=>'<h2>ionCube Loader Wizard</h2><p class="alert">An updated version of this Wizard script is available <a href="http://loaders.ioncube.com/">here</a>.</p>' },

# Version Detection # Already installed message
{ :version=>/<p>The ionCube Loader ([^\s]+) is already installed but it is an old version\. It is recommended that the Loader be updated to the latest version/ },
{ :version=>/<p>The ionCube Loader ([^\s]+) is already installed and encoded files should run without problems.<\/p>/ },

# Wizard Module # Version Detection # Copyright footer
{ :module=>/<div id="footer">Copyright ionCube Ltd\. 2002-20[\d]{2} \| (Loader Wizard version [^\s]+) / },

# div id="loading"
{ :text=>'<div id="loading"><script type="text/javascript">document.write(\'<p>Initialising<br>ionCube Loader Wizard<br><span id="status"></span></p>\');</script>' },

]

end

