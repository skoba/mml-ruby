xml.mmlSm :staffInfo do
  xml << personalizedInfo.to_xml
  creatorLicense.each do |license|
    xml << license.to_xml
  end
end
