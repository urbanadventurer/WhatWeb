##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :name and :certainty=>100
# Version 0.3
# Uses :version=>//

Plugin.define "Concrete5" do
author "Andrew Horton"
version "0.3"
description "Concrete5 is an OpenSource CMS written in PHP. Homepage: www.concrete5.org"

examples %w|
www.formcreative.com.au www.around.ch www.smallspaces.ie/ www.clinicasantamaria.com.ec/ www.olex.org/ www.certifiedrecoveryspecialist.org/ http://www.rosecityrollers.com/ davinacohen.com www.stumptownderby.com www.lti-margraten.nl/ 275hill.com/ www.bhinteriordesign.com www.lucasanderson.com www.credostb.at www.s2000carhoods.co.uk www.html2c5.com www.asha-deep.com www.mail-away.co.uk andrewembler.com cynopsis.com http://www.kodiakstarr.com/
|

matches [
{:text=>"concrete/js/jquery.js"},
{:version=>/<meta name=\"generator\" content=\"concrete5[ \-]+([0-9\.a-z]+)\"/,  :name=>"meta generator tag" } #"
]

# <meta name="generator" content="concrete5 - 5.4.0.6a1" />
# <meta name="generator" content="concrete5 - 5.4.0.5" />
# <meta name="generator" content="concrete5 - 5.4.0.5" />

# Set-Cookie: CONCRETE5=8d653f8a1afccc70f75646ab8d44420f; path=/

def passive
        m=[]        
        m << {:name=>"CONCRETE5 cookie", :certainty=>100 } if @meta["set-cookie"] =~ /CONCRETE5=/i
    
        m
end

end


