##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
  name "Apache-Flink"
  authors [
              "Juanan Pereira", # 2021-01-07 # v0.1
          ]
  version "0.1"
  description "Apache Flink is an open-source, unified stream-processing and batch-processing framework developed by the Apache Software Foundation"
  website "https://flink.apache.org/"

  # ShodanHQ results as at 2021-01-07 #
  # 367 for Apache Flink

  # Dorks #
  dorks [
            intitle:"Apache Flink Web Dashboard",
        ]

  # Matches #
  matches [
              # Apache Flink in title from default page
              {	:name=>"Apache Flink in title",
                 :regexp=>/<title>Apache Flink Web Dashboard<\/title>/},

              { :name=>"Flink logo", :url=>"/images/flink-logo.png"},

              { :url=>'/overview', :version=>/"flink-version":"([^"]+)"/ } ,
          ]

  aggressive do
    ##
    # get config page
    ##

    target = URI.join(@base_uri.to_s,"/config").to_s
    info = []

    begin
      status, _, _, body, _ = open_target(target)

      if status == 200
        v = body.scan(/"flink-version":"([^"]+)"/)[0]
        unless v.nil?
          info <<  {:name=>"Flink version", :certainty=>100, :version=>v}
        end
      end
    rescue

    end
    info

  end

end
