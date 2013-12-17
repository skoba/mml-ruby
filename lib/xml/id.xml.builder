      attributes = {'mmlCm:type' => type, 'mmlCm:tableId' => tableId }
      attributes['mmlCm:checkDigit'] = checkDigit if checkDigit
      attributes['mmlCm:checkDigitSchema'] = checkDigitSchema if checkDigitSchema
      xml.mmlCm :Id,  value, attributes
