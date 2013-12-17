      xml.mmlRd :RegisteredDiagnosisModule do
        attributes = Hash.new
        attributes = {'mmlRd:code' => code} if code
        attributes['mmlRd:system'] = system if system
        xml.mmlRd :diagnosis, attributes, diagnosis
        xml.mmlRd :diagnosisContens do
          diagnosisContents.each do |item|
            attributes = Hash.new
            attributes = {'mmlRd:code' => item.code} if item.code
            attributes['mmlRd:system'] = item.system if item.system
            xml.mmlRd :dxItem, attributes do
              xml.mmlRd :name, item.name
            end
          end
        end if diagnosisContents
        xml.mmlRd :categories do
          categories.each do |category|
            xml.mmlRd :category, {'mmlRd:tableId' => category.tableId}, category.value
          end
        end if categories
        xml.mmlRd :startDate, startDate if startDate
        xml.mmlRd :endDate, endDate if endDate
        xml.mmlRd :outcome, outcome if outcome
        xml.mmlRd :firstEncounterDate, firstEncounterDate if firstEncounterDate
        attributes = 
        xml.mmlRd :relatedHealthInsurance, {'mmlRd:uid' => relatedHealthInsurance} if relatedHealthInsurance
      end
