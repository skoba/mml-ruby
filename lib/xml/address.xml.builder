      attributes = { 'mmlAd:repCode' => repCode }
      attributes['mmlAd:addressClass'] = addressClass
      attributes['mmlAd:tableId'] = tableId
      xml.mmlAd :Address, attributes do
        xml.mmlAd :homeNumber, homeNumber if homeNumber
        xml.mmlAd :town, town if town
        xml.mmlAd :city, city if city
        xml.mmlAd :prefecture, prefecture if prefecture
        xml.mmlAd :full, full if full
        xml.mmlAd :zip, zip if zip
        xml.mmlAd :countryCode, countryCode if countryCode
      end
