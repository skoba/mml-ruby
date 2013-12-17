      xml.mmlBc :BaseClinicModule do
        xml.mmlBc :allergy do
          allergy.each do |item|
            xml.mmlBc :allergyItem do
              xml.mmlBc :factor, item.factor
              xml.mmlBc :severity, item.severity if item.severity
              xml.mmlBc :identifiedDate, item.identifiedDate if item.identifiedDate
              xml.mmlBc :memo, item.memo if item.memo
            end
          end
        end if allergy
        xml.mmlBc :bloodtype do
          xml.mmlBc :abo, bloodtype.abo
          xml.mmlBc :rh, bloodtype.rh if bloodtype.rh
          xml.mmlBc :others do
            bloodtype.others.each do |other|
              xml.mmlBc :other do
                xml.mmlBc :typeName, other.typeName
                xml.mmlBc :typeJudgement, other.typeJudgement
                xml.mmlBc :description, other.description if other.description
              end
            end
          end if bloodtype.others
          xml.mmlBc :memo, bloodtype.memo if bloodtype.memo
        end if bloodtype
        xml.mmlBc :infection do
          infection.each do |item|
            xml.mmlBc :infectionItem do
              xml.mmlBc :factor, item.factor
              xml.mmlBc :examValue, item.examValue
              xml.mmlBc :identifiedDate, item.identifiedDate if item.identifiedDate
              xml.mmlBc :memo, item.memo if item.memo
            end
          end
        end if infection
      end
