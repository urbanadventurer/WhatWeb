##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "DUforum" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-02 
version "0.1"
description "forum - homepage:http://www.duware.com/"
examples %w|
http://www.bentonone.org/forum/login.asp
http://www.diegocampagna.com/sito/forum/login.asp
http://www.giuseppezollo.com/forum/login.asp
http://www.csconsulenza.it/forum/login.asp
http://www.cpbmaroc.org/Forum/login.asp
http://www.otokrab.hr/forum/login.asp
http://www.agrifieratda.com/forum/login.asp
http://www.interstart.it/forum/login.asp
http://www.telefidenza.it/forum/login.asp
http://gentedimareitaliana.com/forum/login.asp
http://www.dirc.it/forum/login.asp
http://www.bandamusicalebajardi.it/forum/login.asp
http://www.unccorigliano.org/forum/login.asp
http://www.g-c-o.com/rockroll/forum/login.asp
http://www.coruslain.it/forum/login.asp
http://www.crocebiancaimperia.org/forum/login.asp
http://www.clinique-agdal.com/forum/login.asp
|

matches [

# About 4,940 results @ 2010-06-02
{:certainty=>75, :ghdb=>'+"powered by duforum" +intitle:DUdforum' },
{:name=>"default title",  :regexp=>/<title>DUdforum[0-9a-zA-Z\ \.-]+<\/title>/},
{:name=>"default text", :text=>'<td align="right" valign="middle" class="text">Powered by <a href="http://www.duware.com" target="_blank">DUforum</a></td>'
}

]

end

