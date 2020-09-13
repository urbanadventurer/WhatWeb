##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Slack-Workspace"
authors [
  'bcoles', # v0.1 - 2020-09-13
]
version "0.1"
description "A Slack workspace is made up of channels where team members can communicate and work together. When you join a workspace, you'll need to create a Slack account using your email address."
website "https://slack.com/intl/en/help/articles/212675257-Join-a-Slack-workspace"

dorks [
]

matches [
]

passive do
  return unless @target.to_s =~ %r{^https://[^\s^/]+?\.slack\.com}

  m = []

  team_name = @body.scan(%r{teamName&quot;:&quot;(.+?)&quot;}).flatten.first
  if team_name
    m << { :string=>team_name }
  end

  email_domain = @body.scan(%r{formattedEmailDomains&quot;:&quot;(.+?)&quot;}).flatten.first
  if email_domain
    m << { :string=>email_domain }
  end

  m
end

end
