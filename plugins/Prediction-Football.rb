##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Prediction-Football" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-14
version "0.1"
description "Prediction Football is a PHP and MySQL based application that allows you to run a Prediction League on your own website."
website "http://www.predictionfootball.com/"

# Google results as at 2011-08-14 #
# 213 for "Powered by Prediction Football"

# Dorks #
dorks [
'"Powered by Prediction Football"'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- Show the different leagues -->' },
{ :text=>'<!-- Show the league ID if there is more than one. -->' },
{ :regexp=>/<!-- The display of powered by prediction football must not be removed without explicit permission\.[\s]+Unauthorized removal or modification of the powered by prediction football will require that[\s]+the associated payment is made\. -->/ },

# Version Detection # Powered by footer
{ :version=>/<small>Powered by <a target="_blank" class="VERSION" href="http:\/\/www\.predictionfootball\.com\/">[\s]+Prediction Football <\/a>([^\s^<]+)<\/small>/ },

]

end

