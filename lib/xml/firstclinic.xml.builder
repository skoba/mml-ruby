      xml.mmlFcl :FirstClinicModule do
        xml.mmlFcl :familyHistory do
          familyHistory.each do |item|
            xml.mmlFcl :familyHistoryItem do
              xml.mmlFcl :relation, item.relation
              xml << item.registeredDiagnosis.to_xml
              xml.mmlFcl :age, item.age
              xml.mmlFcl :memo, item.memo
            end
          end
        end if familyHistory
        xml.mmlFcl :childhood do
          xml.mmlFcl :birthInfo do
            xml << birthInfo.facility.to_xml if birthInfo.facility
            xml.mmlFcl :deliveryWeeks, birthInfo.deliveryWeeks if birthInfo.deliveryWeeks
            xml.mmlFcl :deliveryMethod, birthInfo.deliveryMethod if birthInfo.deliveryMethod
            xml.mmlFcl :bodyWeight, birthInfo.bodyWeight, {'mmlFcl:unit' => birthInfo.bodyWeightUnit} if birthInfo.bodyWeight
            xml.mmlFcl :bodyHeight, birthInfo.bodyHeight, {'mmlFcl:unit' => birthInfo.bodyHeightUnit} if birthInfo.bodyHeight
            xml.mmlFcl :chestCircumference, birthInfo.chestCircumference, {'mmlFcl:unit' => birthInfo.chestCircumferenceUnit} if birthInfo.chestCircumference
            xml.mmlFcl :headCircumference, birthInfo.headCircumference, {'mmlFcl:unit' => birthInfo.headCircumferenceUnit} if birthInfo.headCircumference
            xml.mmlFcl :memo, birthInfo.memo if birthInfo.memo
          end if birthInfo
          xml.mmlFcl :vaccination do
            vaccination.each do |item|
              xml.mmlFcl :vaccinationItem do
                xml.mmlFcl :vaccine, item.vaccine
                xml.mmlFcl :injected, item.injected
                xml.mmlFcl :age, item.age if item.age
                xml.mmlFcl :memo, item.memo if item.memo
              end
            end
          end if vaccination
        end if birthInfo or vaccination
        xml.mmlFcl :pastHistory do
          xml.mmlFcl :freeNote, pastHistory.freeNote if pastHistory.freeNote
          pastHistory.pastHistoryItem.each do |item|
            xml.mmlFcl :pastHistoryItem do
              xml.mmlFcl :timeExpression, item.timeExpression
              item.eventExpression.each do |event|
                xml.mmlFcl :eventExpression, event
              end if item.eventExpression
            end
          end if pastHistory.pastHistoryItem
        end if pastHistory
        xml.mmlFcl :chiefComplaints, chiefComplaints if chiefComplaints
        xml.mmlFcl :presentIllnessNotes, presentIllnessNotes if presentIllnessNotes
      end
