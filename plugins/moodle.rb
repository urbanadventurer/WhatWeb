##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# remove :name & :certainty, updated description

Plugin.define "Moodle" do
author "Andrew Horton"
version "0.2"
description "Opensource educational software written in PHP. Homepage: www.moodle.org"
# identifying strings
# <a title="Moodle 1.9.4+ (Build: 20090415)" href="http://moodle.org/">
# <img style="width:100px;height:30px" src="pix/moodlelogo.gif" alt="moodlelogo" />

matches [
{:regexp=>/<a title="Moodle[^"]+" href="http:\/\/moodle.org\/">/},
{:name=>"moodle logo.gif", :certainty=>75, :regexp=>/<img style="width:100px;height:30px" src="[^"]+\/moodlelogo.gif" alt="moodlelogo" \/>/}
]

# Set-Cookie: MoodleSession=i5ec8g9bnm04b8000jia350n06; path=/

def passive
  m=[]
  m << {:name=>"MoodleSession Cookie" } if @meta["set-cookie"] =~ /MoodleSession=.*/
  m
end

end

