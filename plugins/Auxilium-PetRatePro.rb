##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Auxilium-PetRatePro" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-18
version "0.1"
description "Auxilium PetRatePro - Homepage: http://www.auxiliumsoftware.com/PetRatePro/"

# Google results as at 2012-09-18 #
# 29 for inurl:"index.php?cmd=10" "Pets Rating"

# Dorks #
dorks [
'inurl:"index.php?cmd=10" "Pets Rating"'
]

# Examples #
examples %w|
www.auxiliumsoftware.com/PetRatePro/index.php?cmd=10&ty=2
resellscripts.info/demos/petrating/index.php?cmd=10&ty=2
pullnext.com/demo/ready-to-go/rate-a-pet/index.php?cmd=10&ty=2
www.zampagemella.it/missmrpet/index.php?cmd=10&ty=2
petmania.recipelaunch.com/petinfo/bereavement/index.php?cmd=10&ty=1
www.website-demos.com/PetRatePro/index.php?cmd=10&ty=1
moj-zwierzak.kalkulator24.net/index.php?cmd=10&ty=2
pets.sersea.com/index.php?cmd=10&ty=2
petrate.muravey.com/index.php?cmd=10&ty=2
allcatsgotoheaven.com/index.php?cmd=10&ty=1
www.petmania.me/index.php?cmd=10&ty=2
www.cartercountymarket.com/ccm-pets/index.php?cmd=10&ty=29
|

# Matches #
matches [

# Form
{ :text=>'<form method="post" name="myform2" action="index.php?cmd=11">' },

# heading
{ :text=>'<p class="text"><b>Leader Of The Pack (Top 10 Pets)</b><br><br>' },

]

end

