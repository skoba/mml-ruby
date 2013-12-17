      xml.mmlPsi :PersonalizedInfo do
        xml << id.to_xml
        xml.mmlPsi :personName do
          personName.each do |n|
            xml << n.to_xml
          end
        end
        xml << facility.to_xml if facility
        xml << department.to_xml if department
        xml.mmlPsi :addresses do
          addresses.each do |address|
            xml << address.to_xml
          end
        end if addresses
        xml.mmlPsi :emailAddresses do
          emailAddresses.each do |email|
            xml.mmlCm :email, email
          end
        end if emailAddresses
        xml.mmlPsi :phones do
          phones.each do |phone|
            xml << phone.to_xml
          end
        end if phones
      end
