##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "Team-Board" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.2"
description "Team Board forum [Chinese] - homepage: http://www.team5.cn/"
# Default Login: admin/123

# Google results as at 2010-07-25 #
# 215 for "team5 studio all rights reserved" site:cn

# Examples #
examples %w|
www.team5.cn
cg.sjtu.edu.cn/talk1/
bbs.gigabyte.cn
bbs.ite68.cn
smkxxy.hutc.zj.cn/wjhx/bbs/
tophr.cn/bbs/
www.02412316.cn/xys/bbs/
www.1-pin.com.cn/docc/bbs/
www.51crossstitch.cn/TEAM/
www.beilegroup.cn/bbs/
www.cmiis.cn
www.cnyzy.cn
www.cqwsgb.cn/bbs/
www.cqzh.cn/post/10.html
www.dv30.com.cn/bbs/
www.enet.org.cn
www.epalace.com.cn
www.eurekar.cn/yulan/bbs/
www.fw114.gov.cn/bbs/
www.gzjs.com.cn/bbs/
www.msjg.cn/SiteMeiShanJinGan/BBS/
www.nqwsj.gov.cn/bbs/
www.shyaoming.cn/bbs/
www.sxwlfz.cn/xlzx/bbs/Default.asp
www.szlhlib.com.cn/cgbbs/default.asp
www.teamark.cn/bbs/
www.tophr.cn/bbs/
www.watermeter.com.cn/forum/
www.wfeng.net.cn/bbs/
www.wnzsw.cn/teams/default.asp
www.xalhdpf.org.cn/bbs/
www.xinxuhui.cn/teams/default.asp
www.xlzl.com.cn/bbs/default.asp
www.xmonecard.cn/bbs/default.asp
|

# Matches #
matches [

# Meta Copyright
{ :regexp=>/<meta name="copyright" content="Copyright [0-9]{4}-[0-9]{4} - TEAM5.cn By DayMoon" \/>/ },

# Version Detection # Powered By HTML

{ :version=>/[\s]+Powered by <a target=_blank 	href=http:\/\/www.team5.cn><b>TEAM ([\d\.]+) Release<\/b><\/a> - <a href=Licence.asp><b style='color:#FF9900'>ACC<\/b><\/a> &copy; [0-9]{4} Team5 Studio All rights reserved/ },

{ :version=>/Powered by <a target=_blank[\s]+href=http:\/\/www.team5.cn><b>TEAM ([\d\.]+)<\/b><\/a>/ },

{ :version=>/[\s]+Powered by <a target="_blank" href="http:\/\/www.team5.cn"><b>TEAM ([\d\.]+) Release<\/b><\/a> - <a href="Licence.asp"><b style='color:#FF9900'>SQL<\/b><\/a> &copy; [0-9]{4} Team5 Studio All rights reserved/ },

]

end

