attributes = Hash.new
attributes['mmlCi:tableId'] = tableId if tableId
xml.mmlCi :creatorLicense, value, attributes
