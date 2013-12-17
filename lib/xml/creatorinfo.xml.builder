      xml.mmlCi :CreatorInfo do
        xml << personalizedInfo.to_xml
        creatorLicense.each do |license|
          attributes = {'mmlCi:tableId' => license.tableId} if license.tableId
          xml.mmlCi :creatorLicense, license.value, attributes
        end
      end
