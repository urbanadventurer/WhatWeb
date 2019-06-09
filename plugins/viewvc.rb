##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ViewVC"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-18
  # v0.2 # 2011-03-19 # Added local file path aggressive match. 
  # v0.3 # 2017-12-09 # Tidied regex
]
version "0.3"
description "ViewVC (formerly known as ViewCVS) is a browser interface for CVS and Subversion version control repositories. It generates templatized HTML to present navigable directory, revision, and change log listings. It can display specific versions of files as well as diffs between those versions."
website "http://viewvc.org/"

# Google results as at 2011-03-19 #
# 288 for "Powered by viewvc"
# 107 for inurl:viewvc.cgi ext:cgi
#  99 for inurl:viewcvs.cgi ext:cgi

dorks [
'"Powered by ViewVC"'
]

# Matches #
matches [

# Title
{ :text => '<title>ViewVC Repository Listing</title>' },

# HTML Comment
{ :text => '<!-- ViewVC :: http://www.viewvc.org/ -->' },
{ :text => '<!-- ViewCVS -- http://viewcvs.sourceforge.net/' },

# Version Detection # Powered by link
{ :version => %r{Powered by <a href="http://(viewcvs.sourceforge.net|viewvc.tigris.org)/">(ViewCVS|ViewVC) ([^<]+)</a></td>}, :offset => 2 },

# Version Detection # Meta Generator
{ :version => /<meta name="generator" content="View(VC|CVS) ([^"]+)"/, :offset => 1 }

]

# Aggressive #
aggressive do
  m=[]

  random_fname = rand(36 ** 6).to_s(36)

  if @base_uri.path =~ %r{^(.*/(viewvc|viewcvs|viewvc\.cgi|viewcvs\.cgi))}i
    target_url = "#{$1}/*docroot*/" + random_fname
  end

  # Open application base url + "/*docroot*/" + random filename
  unless target_url.nil?
    target = URI.join(@base_uri.to_s, target_url).to_s
    status,url,ip,body,headers = open_target(target)

    # Extract local file path
    file_path = body.scan(/\(\[Errno 2\] No such file or directory: '([^']+)#{random_fname}'\)/).flatten.first
    unless file_path.nil?
      m << { :filepath => file_path }
    end
  end

  m
end

end
