Plugin.define "DemandWare eCommerce System" do
author "Claudio Salazar <csalazar at spect dot cl>"
version "0.1"
description "Digital commerce for the changing face of retail. -
  Homepage: https://www.demandware.com/"
examples %w| www.juicycouture.com |

matches [{:regexp=>/\/demandware.store\//}]

end