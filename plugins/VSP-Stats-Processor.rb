##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VSP-Stats-Processor" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "vsp stats processor is a multi game log analyzer / stats generator / log parser. - Homepage: http://www.scivox.net/vsp/"

# Examples #
examples %w|
dinksclan.com/sniperstats/themes/bismarck/
et.joyrex.net/stats/themes/bismarck/
www.wolfenstein-et.net/ww2/vsp/pub/themes/bismarck/
pillclan.noghost.net/themes/bismarck/
ateam.noghost.net
www.dpclan.org/vsp/pub/themes/bismarck/
www.zvdk.nl/q3stats/
cu-clan.de/Vsp_Stats_RR/pub/themes/bismarck/
cs.uch.net/q3stat/
quake3.perm.ru
www.cipclan.com/stats/pub/themes/bismarck/
rainz.ath.cx/vsp/pub/themes/bismarck/
et.joyrex.net/stats/themes/bismarck/
et.hirntot.org/stats/themes/bismarck/
objstats.tce-massa.com/themes/bismarck/
www.gsk.netii.net/vspstats/pub/themes/bismarck/
stats.black-sheep-team.com/pub/themes/bismarck/
www.harryhomers.co.uk/et/stats/hsn/pub/themes/bismarck/
oldschoolsnipers.com/clanstats/pub/themes/bismarck/
gameserver.houkouonchi.jp/sof2_sniper/themes/bismarck/
www.mmdclan.com/server2/pub/themes/bismarck/
eskisohost.com/mohstats/pub/themes/bismarck/
war-clan.clanservers.com/PHP-Nuke/VSP/pub/themes/bismarck/
dgames.vectranet.pl/stats/et/radom/themes/bismarck/
rrmsweb.com/clanstats2/pub/themes/bismarck/
stats.god-oa.de
t-jensen.tholl.dk/stats/urban/themes/bismarck/
www.concarne.org/vsp_ra3/themes/bismarck/
www.xodusgaming.com/cod2stats/pub/themes/bismarck/
dgames.vectranet.pl/stats/urt/ctf/themes/bismarck/index.php
www.ironfaction.com/vsp2/pub/themes/bismarck/index.php
|

# Matches #
matches [

# Powered by link
{ :regexp=>/powered by <A HREF="http:\/\/www.(scivox.net|clanavl.com)\/vsp\/">vsp stats processor<\/A>/ },

# Theme: bismarck
{ :text=>'&nbsp;theme:bismarck by <A HREF="#" TITLE="myrddin8 <AT> gmail <DOT> com">myrddin</A>&nbsp;', :string=>"bismarck" },

# Title
{ :certainty=>25, :regexp=>/<TITLE>vsp \((map|award|game|player) stats\)<\/TITLE>/ },

# Misconfigured # Database Error
{ :certainty=>25, :text=>"<BODY>error: cannot establish database connection or database database_name does not exist", :string=>"Error" },

# Version Detection
{ :version=>/<A HREF="http:\/\/www.clanavl.com\/vsp\/">vsp<\/A> v([\d\.]+),/ },

]

end


