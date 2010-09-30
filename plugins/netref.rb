##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netref" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.1"
description "homepage: http://www.netref.net/"

# 178 results for "powered by Netref" @ 2010-08-31
examples %w|
kaledonie.com
transport.annugratuit.net
www.autocross-france.net/Divers/Netref4/index.php
www.gratuit-du-net.net
www.2aazaide.com/annuaire/ajoutcat.php
www.ressources-formation.com/Psychologie.php
www.puget-passion.fr/Annuaire/
annuaires.massage-cachemirien.org
www.milouchouchou.com/milannu/
|

matches [

# Powered by text
{ :regexp=>/<a href='http:\/\/www.netref.net' class='lienp'[\ target="_Blank"]*>Powered by Netref/i },

# HTML Comment
{ :text=>'Annuaire Netref : http://www.netref.net' }

]

# Version detection using powered by text
def passive
        m=[]

        if @body =~ /<a href=[\"|\']+http:\/\/www.netref.[fr|net]+[\"|\']+ class=[\"|\']+lienp[\"|\']+[\ target="_Blank"]*>Powered by Netref ([\d\.]+) &copy; [0-9]{4}<\/a>/
                version=@body.scan(/<a href=[\"|\']+http:\/\/www.netref.[fr|net]+[\"|\']+ class=[\"|\']+lienp[\"|\']+[\ target="_Blank"]*>Powered by Netref ([\d\.]+) &copy; [0-9]{4}<\/a>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

