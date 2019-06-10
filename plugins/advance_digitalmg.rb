##
Plugin.define do
name "AdvanceDigital"
authors [
  "Elias Dorneles",
  "Andrew Horton", # v0.2 # 2019-07-10 # Added website field.
]
version "0.2"
description "Identifies a news website by Advance Digital MG network"
website "https://www.advancelocal.com/"
matches [
  {
    :name => "link to user agreement that it's present in the footer",
    :regexp => /href="http:\/\/www.advance.net\/advancedigitalUserAgreementPP\/#opt_out.*Ad Choices/
  }
]
end

