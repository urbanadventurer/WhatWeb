##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Hunt-Electronics-CCTV" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "Hunt Electronics is staffed with highly trained, experienced, and creative individuals specializing in the development and manufacturing of high performance CCTV solutions."
website "http://www.huntcctv.com/"

# Live demos: http://www.huntcctv.com/demo.asp


matches [

# Default body tag
{ :text=>'<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" OnLoad="preload_img(false, \'images/btn_login_red.gif\', \'images/btn_reset_red.gif\'); placeFocus();na_preload_img(false, \'img/login_btn2.gif\', \'img/login_btn4.gif\'); LoadSavedID();">' },

# Default javascript
{ :text=>'   //login.action = "./webviewer.php" ;' },


# HVRM Series:
# Real Time, High Quality, Digital Video Recorder, Advanced H.264, Linux Embedded, 480ips/480ips @ 720x480 (Full D1), VGA, DVD-RW, USB back up, up to 4TB HDD internal, up to 8TB External, up to 32TB, built-in RS232, RS 485, Alarm/ Relay, audio, looping, remote control. Web Support for Smartphones such as iPhone, Andriod and Blackberry.
# Software user guide: http://www.huntcctv.com/pdf/UManual/2010-UManual-ControlCenterStd.pdf

{ :text=>'                        <!--<p>If ActiveX control can\'t be loaded, please download and install Webviewer ActiveX Control.<br>&gt;&gt; <a href="./WebviewerInstaller.exe">Download Webviewer Installer v.1.0.2.4</a>-->', :version=>"HVRM-T1600L" },


# HVRM-T Series
# Real Time, High Quality, Digital Video Recorder, Advanced H.264, Linux Embedded, 120ips/480ips @ 720x480 (Full D1), VGA, DVD-RW, USB back up, up to 4TB HDD internal, built-in RS232, 485, Alarm/ Relay, audio, looping, remote control. 
# Software user guide: http://www.huntcctv.com/pdf/UManual/2010-UManual-ControlCenterStd.pdf

{ :text=>'                        <!--<p>If ActiveX control can\'t be loaded, please download and install Webviewer ActiveX Control.<br>&gt;&gt; <a href="./WebviewerInstaller.exe">Download Webviewer Installer v.1.0.2.5</a>-->', :version=>"HVRM-H1600L / HVRM-T1600M" },


# HNVS-04
# Real Time Network Video Recorder, Advanced MPEG4, Linux Embedded, HNVS-04 connects up to 16 IP (Network) Video channels and allows users to remotely monitor, playback, and record at the same time. HNVS-04 can easily connected remotely with all of Hunt IP HTP Series products such as; HTP-T2M10Z, HTP-13MG28DID.
# User guide: http://www.huntcctv.com/pdf/UManual/HNVS_04%20Installation%20User%27s%20Guide%20v1.0.pdf

{ :text=>'                        <!--<p>If ActiveX control can\'t be loaded, please download and install Webviewer ActiveX Control.<br>&gt;&gt; <a href="./WebviewerInstaller.exe">Download Webviewer Installer v.1.0.3.0</a>-->', :version=>"HNVS-04" },

]

end

