      attributes = {'mmlHi:countryType' => countryType } if countryType
      xml.mmlHi :HealthInsuranceModule, attributes do
        attributes = {'mmlHi:ClassCode' => '01'} if insuranceClass.classCode
        attributes['mmlHi:tableId'] = insuranceClass.tableId if insuranceClass.tableId
        xml.mmlHi :insuranceClass, insuranceClass.value, attributes if insuranceClass
        xml.mmlHi :insuranceNumber, insuranceNumber
        xml.mmlHi :clientId do
          xml.mmlHi :group, group
          xml.mmlHi :number, number
        end
        xml.mmlHi :familyClass, familyClass
        xml.mmlHi :clientInfo do
          xml.mmlHi :personName do
            clientInfo.personName.each do |name|
              xml << name.to_xml
            end
          end if clientInfo.personName
          xml.mmlHi :addresses do
            clientInfo.addresses.each do |address|
              xml << address.to_xml
            end
          end if clientInfo.addresses
          xml.mmlHi :phones do
            clientInfo.phones.each do |phone|
              xml << phone.to_xml
            end
          end if clientInfo.phones
        end if clientInfo
        xml.mmlHi :continuedDiseases do
          continuedDiseases.each do |disease|
            xml.mmlHi :disease, disease
          end
        end if continuedDiseases
        xml.mmlHi :startDate, startDate
        xml.mmlHi :expiredDate, expiredDate
        xml.mmlHi :paymentInRatio, paymentInRatio if paymentInRatio
        xml.mmlHi :paymentOutRatio, paymentOutRatio if paymentOutRatio
        xml.mmlHi :insuredInfo do
          xml.mmlHi :facility do
            xml << insuredInfo.facility.to_xml if insuredInfo.facility
          end if insuredInfo.facility
          xml.mmlHi :addresses do
            insuredInfo.addresses.each do |address|
              xml << address.to_xml
            end
          end if insuredInfo.addresses
          xml.mmlHi :phones do
            insuredInfo.phones.each do |phone|
              xml << phone.to_xml
            end
          end if insuredInfo.phones
        end if insuredInfo
        xml.mmlHi :workInfo do
          xml.mmlHi :facility do
            xml << workInfo.facility.to_xml
          end if workInfo.facility
          xml.mmlHi :addresses do
            workInfo.addresses.each do |address|
              xml << address.to_xml
            end
          end if workInfo.addresses
          xml.mmlHi :phones do
            workInfo.phones.each do |phone|
              xml << phone.to_xml
            end
          end
        end if workInfo
        xml.mmlHi :publicInsurance do
          publicInsurance.each do |item|
            attribute = Hash.new
            attribute = {'mmlHi:priority' => item.priority} if item.priority
            xml.mmlHi :publicInsuranceItem, attribute do
              xml.mmlHi :providerName, item.providerName if item.providerName
              xml.mmlHi :provider, item.provider
              xml.mmlHi :recipient, item.recipient
              xml.mmlHi :startDate, item.startDate
              xml.mmlHi :expiredDate, item.expiredDate
              xml.mmlHi :paymentRatio, item.paymentRatio, {'mmlHi:ratioType' => item.ratioType} if item.paymentRatio
            end
          end
        end if publicInsurance
      end
