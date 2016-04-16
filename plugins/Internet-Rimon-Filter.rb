##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Internet-Rimon-Filter" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-15
version "0.1"
description "Internet Rimon (Israeli ISP) server based filtering server"
website "http://internet-rimon.com/"

# More Info:
#  http://www.jewishsexuality.com/porn-filter
#  http://wiki.answers.com/Q/How_do_you_get_around_Internet_rimon._its_a_new_Internet_filter_that_run_through_a_modem_and_not_through_the_computer_and_it_keeps_learning_what_sites_to_block

# ShodanHQ results as at 2011-05-15 #
# 11,928 for Rimon: RWC_BLOCK
#    125 for Rimon -RWC_BLOCK

# Google results as at 2011-05-15 #
# 311 for "You are not recognized in the system !!!"



# Passive #
def passive
	m=[]

	# HTTP Rimon Header
	m << { :string=>@headers["rimon"].to_s } unless @headers["rimon"].nil?

	# Return passive matches
	m
end

end

=begin
Rimon headers observed in the wild:
  Rimon: RWC_BLOCK
  Rimon: RWC_QUILTINGNETSPARK 
  Rimon: RWC_QUILTINGRIMON 
  Rimon: RWC_QUILTING
=end

