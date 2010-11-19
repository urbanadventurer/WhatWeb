Plugin.define "EscenicEngine" do
author "Nk"
version "0.1"
description "Identifies Escenic Engine CMS eg. Escenic.rb"
examples %w| vizrt.com |

# a comment block here is a good place to make notes for yourself and others

# These are the types of matches:
# :regexp        -- it's a regular expression in ruby, eg. /^foobar$/
# :text          -- case sensitive text
# :ghdb          -- Google Hack Database. u can use intitle: inurl: -
# :md5           -- MD5 hash
# :tagpattern    -- a pattern made by the html entities. fuzzy matching coming soon
# :url           -- you can combine this with other variables or use by itself
# :name          -- naming the matches is optional
# :version       -- this is used to return data
# :string        -- this is used to return data

# Matches are enclosed in {} brackets and separated by commas
matches [
{:name=>"Contains Escenic Engine image urls", :regexp=>/.*(\.ece).*(ALTERNATES|BINARY).*(w\d+)/ },
{:name=>"Contains default .ece urls", :regexp=>/.*(\.ece)/ },
{:url=>'/incoming/', :text=>'Default escenic section' }
]

end

