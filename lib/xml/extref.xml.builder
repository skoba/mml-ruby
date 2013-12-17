      attributes = { 'mmlCm:href' => href }
      attributes['mmlCm:contentType'] = contentType if contentType
      attributes['mmlCm:medicalRole'] = medicalRole if medicalRole
      attributes['mmlCm:title'] = title if title
      xml.mmlCm :extRef, attributes
