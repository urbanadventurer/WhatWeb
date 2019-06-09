##
Plugin.define do
name "AdvanceDigital"
authors [
  "Elias Dorneles",
]
version "0.1"
description "Identifies a news website by Advance Digital MG network"

matches [
  {
    :name => "link to user agreement that it's present in the footer",
    :regexp => /href="http:\/\/www.advance.net\/advancedigitalUserAgreementPP\/#opt_out.*Ad Choices/
  }
]
end

