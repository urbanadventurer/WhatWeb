##
Plugin.define do
name "NewBayMediaWebsite"
authors [
  "Elias Dorneles",
]
version "0.1"
description "Identifies a news website by New Bay Media"

matches [
  {
    :name => "CSS class used for the menus",
    :regexp => /nice-menu-menu-newbay-media-websites/
  }
]
end

