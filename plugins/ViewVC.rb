##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-19 #
# Added local file path aggressive match
##
Plugin.define "ViewVC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.2"
description "ViewVC (formerly known as ViewCVS) is a browser interface for CVS and Subversion version control repositories. It generates templatized HTML to present navigable directory, revision, and change log listings. It can display specific versions of files as well as diffs between those versions."
website "http://viewvc.tigris.org/"

# Google results as at 2011-03-19 #
# 288 for "Powered by viewvc"
# 107 for inurl:viewvc.cgi ext:cgi
#  99 for inurl:viewcvs.cgi ext:cgi



# Matches #
matches [

# Title
{ :text=>'<title>ViewVC Repository Listing</title>' },

# HTML Comment
{ :text=>'<!-- ViewVC :: http://www.viewvc.org/ -->' },
{ :text=>'<!-- ViewCVS -- http://viewcvs.sourceforge.net/' },

# Version Detection # Powered by link
{ :version=>/<td>Powered by <a href="http:\/\/viewvc.tigris.org\/">ViewVC ([^<]+)<\/a><\/td>/ },
{ :version=>/Powered by <a href="http:\/\/viewcvs.sourceforge.net\/">ViewCVS ([^<]+)<\/a><\/td>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="ViewVC ([^"]+)" \/>/ },
{ :version=>/<meta name="generator" content="ViewCVS ([^"]+)">/ },

]

# Aggressive #
def aggressive
	m=[]

	# Local File Path Detection # Find application base path
	if @base_uri.path =~ /^[^\n]*\/(viewcvs|viewvc)/i

		# Generate Random File Name
                random_fname=rand(36**6).to_s(36)

		# Detect /viewcv/ or /viewcvs/
		target_url = @base_uri.path.scan(/^([^\n]*\/viewvc\/|[^\n]*\/viewcvs\/)/i).flatten.first+"/*docroot*/"+random_fname if @base_uri.path =~ /^([^\n]*\/viewvc\/|[^\n]*\/viewcvs\/)/i

		# Detect /viewvc or /viewcvs
		target_url = @base_uri.path.scan(/^([^\n]*\/viewvc$|^[^\n]*\/viewcvs$)/i).flatten.first+"/*docroot*/"+random_fname if @base_uri.path =~ /^([^\n]*\/viewvc$|[^\n]*\/viewcvs$)/i

		# Detect /viewvc.cgi or /viewcvs.cgi
		target_url = @base_uri.path.scan(/^([^\n]*\/viewvc\.cgi|[^\n]*\/viewcvs\.cgi)/i).flatten.first+"/*docroot*/"+random_fname if @base_uri.path =~ /^([^\n]*\/viewvc\.cgi|[^\n]*\/viewcvs\.cgi)/i

		# Open application base url + "/*docroot*/" + random filename
		unless target_url.nil?

			target = URI.join(@base_uri.to_s,target_url).to_s
			status,url,ip,body,headers=open_target(target)

			# Extract local file path
			m << { :filepath=>body.scan(/\(\[Errno 2\] No such file or directory: '([^']+)#{random_fname}'\)/).flatten } if body =~ /\(\[Errno 2\] No such file or directory: '([^']+)#{random_fname}'\)/

		end

	end

	# Return aggressive matches
	m
end

end


