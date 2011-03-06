##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WS_FTP-log" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "This plugin extratcs ftp servers from WS_FTP log files - As the leading developer of secure and managed file transfer solutions, Ipswitch offers WS_FTP Professional.the most secure and easy-to-use FTP client available. - homepage: http://www.ipswitchft.com/products/ws_ftp_pro/index.aspx?n=1&k_id=ipshome"

# About 16,500 results for inurl:WS_FTP ext:log @ 2010-10-15
examples %w|
exeterchessclub.org.uk/FTP/WS_FTP.LOG
hesperia.gsfc.nasa.gov/hessi/reference/drawings/HESSI%20ftp%20%2010_26_99/Grid_8/GHF/WS_FTP.LOG
planetquest.jpl.nasa.gov/search/WS_FTP.LOG
moinfo.gov.et/WS_FTP.LOG
www.3gpp.com/ftp/tsg_sa/WG5_TM/TSGS5_13/TSGS5_13bis/CM/WS_FTP.LOG
www.aao.gov.au/local/www/lib/preprints/ws_ftp.log
www.bansdoc.gov.bd/admin/library/WS_FTP.LOG
www.boe.ca.gov/annual/pdf/2000/_notes/ws_ftp.log
www.chestertown.com/gov/codehtml/WS_FTP.LOG
www.dhr.maryland.gov/county/image/WS_FTP.LOG
www.epa.gov/ttn/atw/toxsource/chronicpriorityd_files/ws_ftp.log
www.fds.org.au/greybox/WS_FTP.LOG
www.gov.ai/statistics/STAT%20ABSTRACT_files/WS_FTP.LOG
www.houstontx.gov/parking/images/WS_FTP.LOG
www.lgd.gov.bd/image/WS_FTP.LOG
www.loc.gov/z3950/agency/zig/meetings/madrid/pictures/ws_ftp.log
www.mastic.gov.my/portals/mastic/ISO9000/iso/Prosidur%20Kerja/lpk11/ws_ftp.log
www.mecon.gov.ar/basehome/galeria/galeria_2007/06/WS_FTP.LOG
www.metrobh.gov.br/v2/final/jornalinterno/resenhas/WS_FTP.LOG
www.nale.gov.et/Public%20Relation/WS_FTP.LOG
www.ncd.gov/newsroom/correspondence/ws_ftp.log
www.nln.gov.na/nis/Forms/WS_FTP.LOG
www.npc.gov.na/rprp/WS_FTP.LOG
www.orange-ct.gov/cominfo/WS_FTP.LOG
www.pevenseyparishcouncil.gov.uk/forum/Themes/babylon/images/english/WS_FTP.LOG
www-physics.lbl.gov/~gilg/XrayNov00/ws_ftp.log
www.sex-and-relationships.com/pages/LH/images/WS_FTP.LOG
|

matches [

# FTP server extraction
{ :version=>/^[0-9]+.[0-9]{2}.[0-9]{2} [0-9]{2}:[0-9]{2} [A|B]{1} [^>]*> ([^\ ]+) / },

]

end

