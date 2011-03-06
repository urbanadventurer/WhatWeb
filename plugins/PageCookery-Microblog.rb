##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PageCookery-Microblog" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "Blog [Chinese] - Homepage: http://www.pagecookery.com/"

# Google results as at 2011-03-06 #
# 384 for "Powered by PageCookery Microblog"

# Examples #
examples %w|
www.pagecookery.com/?act=view
www.myf5.cn
www.xmiy.com
liukun.name/talk/
mozun.cn/wb/
www.jackidea.com/talk/
www.windsays.com/t/
talk.kaisir.com
t.binjoo.net
t.mxlove.org
t.lvbeta.com
t.ai95.com
www.douk.tk
www.zhouhua.tk/
www.loytown.com/mblog/
sorry.im/microblog/
t.yeezi.org
microblog.dr-rider.tk
jandan.tk
tsina.tk/mblog/
www.minisix.cn/mblog/
t.snailstory.cn
www.zhuhuadong.com
www.imyxiao.com/microblog/
www.sayme.tk
|

# Matches #
matches [

# Version detection # Powered by footer
{ :version=>/Powered by <a href="http:\/\/pagecookery.com\/" target="_blank">PageCookery<\/a> Microblog ([\d\.]{1,5})/ },

]

end


