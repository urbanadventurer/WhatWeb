Plugin.define "Escenic" do
author "Erik Inge Bolsø <knan+whatweb@redpill-linpro.com>"
version "0.2"
description "Escenic is a commercial CMS popular in the Nordic region."
examples %w| escenic.com |

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
{:name=>"escenic 4.x image storage structure",
:certainty=>100,
:regexp=>/.*\/archive\/\d{5}\//},

{:name=>"escenic .ece url match",
:certainty=>75,
:regexp=>/<a .*\.ece.*<\/a>/},
]

end

