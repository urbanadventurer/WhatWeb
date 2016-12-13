##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BinGoPHP-News" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-29
version "0.1"
description "News administration web app"
website "http://bingophp.free.fr"

# Google results as at 2010-08-29 #
# 18 for "Script réiséar BinGo PHP" -Vulnerability @
# 15 for inurl:bnadmin.php

# Dorks #
dorks [
'inurl:bnadmin.php'
]



matches [

# Main page
{ :text=>"</b><a href='bnadmin.php' target='_blank'>Admin des news</a>'" },
{ :text=>'<a href="http://bingophp.free.fr" target="_blank"><font color="#00000" style="font-size: 8px">' },

# JavaScript
{ :text=>"onClick=\"window.open('bnarchives.php','archive','toolbar=0,location=0,directories=0,status=1,scrollbars=1,resizable=1,copyhistory=1,menuBar=0,width=400,height=500');return(false)\">Archives</A><br>" },

# Admin Page
{ :text=>'<html><head><title>BinGoPHP News - IDENTIFICATION</title></head>' },
{ :text=>'<br><input type=\'submit\' value="Acceder a l\'administration des news">' },
{ :text=>'       <td width="50%"><a href=\'http://www.bingo-php.fr.st\' target=\'_blank\'><img src=\'http://tonsitefr.multimania.com/images/468x60-1.gif\' border=\'0\' alt="Ressources gratuites pour votre site web"></a>' },

]

end

