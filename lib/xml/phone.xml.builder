      attributes = {'mmlPh:telEquipType' => telEquipType} if telEquipType
      xml.mmlPh :Phone, attributes do
        xml.mmlPh :area, area if area
        xml.mmlPh :city, city if city
        xml.mmlPh :number, number if number
        xml.mmlPh :extension, extension if extension
        xml.mmlPh :full, full if full
        xml.mmlPh :country, country if country
        xml.mmlPh :memo, memo if memo
      end
