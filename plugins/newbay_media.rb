Plugin.define do
name "NewBayMediaWebsite"
author "Elias Dorneles"
version "0.1"
description "Identifies a news website by New Bay Media"
examples %w| http://multichannel.com http://www.broadcastingcable.com |

matches [
  {
    :name => "CSS class used for the menus",
    :regexp => /nice-menu-menu-newbay-media-websites/
  }
]
end

