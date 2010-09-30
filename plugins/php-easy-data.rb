##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPEasyData" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-16
version "0.1"
description "homepage: http://www.phpeasydata.com/"

# 12 results for "powered by PHPEasyData" @ 2010-08-15
examples %w|
www.phpeasydata.com/annuaire/annuaire.php
www.marocannonce.org/admin/
www.e-profil.fr/annu/admin/
annuaire.divine-nolwenn.com
www.telparis.com/admin/
www.marocvoyage.org/admin/
www.lalgerie.net/admin/
www.ergotherapie.fr/annuaire/admin/
www.ambafrance-ma.org/cjb/fondsdoc/annuaire/admin/
|

matches [

# Admin page
{ :text=>"<div id='phpeasydata_container'  >" },
{ :text=>'  <head><title>PhpEasyData login page</title>' },

]

# Version detection using powered by footer text
def passive
        m=[]

        if @body =~ /Powered by <b><a  class='copy' href="http:\/\/www.[phpeasydata.com\/|freewebmaster\-scripts.com\/phpeasydata]+" title="Script PHP/

		if @body =~ /n main de pages dynamiques. " target="_blank" >PhpEasyData  [\d\.]+  <\/a><\/b>/
                	version=@body.scan(/n main de pages dynamiques. " target="_blank" >PhpEasyData  ([\d\.]+)  <\/a><\/b>/)[0][0]
                	m << {:version=>version}
        	end

	end

	if @body =~ /Powered by [<strong><b>]+<a  class='copy' title="Script PHP/

		if @body =~/" href="http:\/\/www.[phpeasydata.com\/|freewebmaster\-scripts.com\/phpeasydata]+[\/]*" target="_blank" >PHPEasyData   [Pro]* ([\d\.]+)<\/a>/
			version=@body.scan(/" href="http:\/\/www.[phpeasydata.com\/|freewebmaster\-scripts.com\/phpeasydata]+[\/]*" target="_blank" >PHPEasyData   [Pro]* ([\d\.]+)<\/a>/)[0][0]
			m << {:version=>version}
		end

	end

        m

end


end

