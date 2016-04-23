##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cisco-IP-Phone" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-26
version "0.1"
description "This plugin identifies Cisco IP phones and extracts the internal hostname which is also the device's MAC adress prefixed with 'SEP'"
website "http://www.cisco.com/en/US/products/sw/voicesw/index.html"

# More Info #

# Cisco Unity Express #
#   - http://www.cisco.com/en/US/products/sw/voicesw/ps5520/index.html
#   - Datasheet: http://www.cisco.com/en/US/products/sw/voicesw/ps5520/products_data_sheets_list.html

# Unified IP Phone 9900 Series #
#   - http://www.cisco.com/en/US/products/ps10453/index.html
#   - Datasheet: http://www.cisco.com/en/US/products/ps10453/products_data_sheets_list.html

# Unified IP Phone 6900 Series #
#   - http://www.cisco.com/en/US/products/ps10326/index.html
#   - Datasheet: http://www.cisco.com/en/US/products/ps10326/products_data_sheets_list.html

# Google results as at 2011-01-26 #
# 43 for inurl:"NetworkConfiguration" cisco



# Matches #
matches [

# IP Phone # Model Detection
{ :model=>/<td HEIGHT="50" bgcolor="#003031"><p ALIGN=center><B><font color="#FFFFFF" size="6">[^<]{5,50}<\/FONT><\/B><p ALIGN=center><B><font color="#FFFFFF" size="4">Cisco[^\(]{0,15} IP Phone ([^\(]{4,20}) \( [^\)]{15} \)[\s]?<\/FONT><\/FONT><\/B><\/TD>/ },

# IP Phone # Hostname Detection
{ :string=>/<td HEIGHT="50" bgcolor="#003031"><p ALIGN=center><B><font color="#FFFFFF" size="6">[^<]{5,50}<\/FONT><\/B><p ALIGN=center><B><font color="#FFFFFF" size="4">Cisco[^\(]{0,15} IP Phone [^\(]{4,20} \( ([^\)]{15}) \)[\s]?<\/FONT><\/FONT><\/B><\/TD>/ },


# Unified IP Phone # CP-7961G # Model Detection
{ :model=>/<td HEIGHT="50" bgcolor="#003031"><p ALIGN=center><B><font color="#FFFFFF" size="6">[^<]{5,50}<\/FONT><\/B><p ALIGN=center><B><font color="#FFFFFF" size="4">Cisco Unified IP Phone ([^\(]{4,20}) \( [^\)]{15} \)[\s]?<\/FONT><\/FONT><\/B><\/TD>/, :version=>"Unified" },

# Unified IP Phone # CP-7961G # Hostname Detection
{ :string=>/<td HEIGHT="50" bgcolor="#003031"><p ALIGN=center><B><font color="#FFFFFF" size="6">[^<]{5,50}<\/FONT><\/B><p ALIGN=center><B><font color="#FFFFFF" size="4">Cisco Unified IP Phone [^\(]{4,20} \( ([^\)]{15}) \)[\s]?<\/FONT><\/FONT><\/B><\/TD>/, :version=>"Unified" },


# Unified Wireless IP Phone # Model Detection
{ :model=>/<title>Cisco Unified Wireless IP Phone ([^<]{4,20})<\/title><link href="\/style.css" type=text\/css rel=stylesheet><\/head>/, :version=>"Unified Wireless" },

# Unified Wireless IP Phone # Model Detection
{ :model=>/<p align=center style='text-align:center'><b><span style='font-size:13.5pt; color:white'>Cisco Unified Wireless IP Phone ([^\(]{4,20}) \( [^\)]{15} \)<\/span><\/b><\/p>/, :version=>"Unified Wireless" },

# Unified Wireless IP Phone # Hostname Detection
{ :string=>/<p align=center style='text-align:center'><b><span style='font-size:13.5pt; color:white'>Cisco Unified Wireless IP Phone [^\(]{4,20} \( ([^\)]{15}) \)<\/span><\/b><\/p>/, :version=>"Unified Wireless" },


]

end

# An aggressive plugin could grab the DNS server and other network details from /NetworkConfiguration

