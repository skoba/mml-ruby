      xml.mmlSg :SurgeryModule do
        surgeryItem.each do |sitem|
          xml.mmlSg :surgeryItem do
            attribute = Hash.new
            attribute = {'mmlSg:type' => sitem.type} if sitem.type
            xml.mmlSg :surgicalInfo, attribute do
              xml.mmlSg :date, sitem.date
              xml.mmlSg :startTime, sitem.startTime if sitem.startTime
              xml.mmlSg :duration, sitem.duration if sitem.duration
              xml.mmlSg :surgicalDepartment do
                xml << sitem.surgicalDepartment.to_xml
              end if sitem.surgicalDepartment
              xml.mmlSg :patientDepartment do
                xml << sitem.patientDepartment.to_xml
              end if sitem.patientDepartment
            end
            xml.mmlSg :surgicalDiagnosis do
              sitem.surgicalDiagnosis.each do |ditem|
                xml << ditem.to_xml
              end
            end
            xml.mmlSg :surgicalProcedure do
              sitem.surgicalProcedure.each do |pitem|
                xml.mmlSg :procedureItem do
                  attributes = Hash.new
                  attributes = {'mmlSg:code' => pitem.code} if pitem.code
                  attributes['mmlSg:system'] = pitem.system if pitem.system
                  xml.mmlSg :operation, pitem.operation, attributes if pitem.operation
                  xml.mmlSg :operationElement do
                    pitem.operationElement.each do |oitem|
                      xml.mmlSg :operationElementItem do
                        attributes = Hash.new
                        attributes = {'mmlSg:code' => oitem.code}
                        attributes['mmlSg:system'] = oitem.system
                        xml.mmlSg :title, oitem.title, attributes
                      end
                    end
                  end if pitem.operationElement
                  xml.mmlSg :procedureMemo, pitem.procedureMemo if pitem.procedureMemo
                end
              end
            end
            xml.mmlSg :surgicalStaffs do
              sitem.surgicalStaffs.each do |staff|
                attributes = Hash.new
                attributes = {'mmlSg:staffClass' => staff.staffClass} if staff.staffClass
                attributes['mmlSg:superiority'] = staff.superiority if staff.superiority
                xml.mmlSg :staff, attributes do
                  xml << staff.staffInfo.to_xml
                end
              end
            end if sitem.surgicalStaffs
            xml.mmlSg :anesthesiaProcedure do
              sitem.anesthesiaProcedure.each do |aproc|
                attributes = Hash.new
                attributes['mmlSg:code'] = aproc.code if aproc.code
                attributes['mmlSg:system'] = aproc.system if aproc.system
                xml.mmlSg :title, aproc.title, attributes
              end
            end if sitem.anesthesiaProcedure
            xml.mmlSg :anesthesiologists do
              sitem.anesthesiologists.each do |staff|
                attributes = Hash.new
                attributes['mmlSg:staffClass'] = staff.staffClass if staff.staffClass
                attributes['mmlSg:superiority'] = staff.superiority if staff.superiority
                xml.mmlSg :staff, attributes do
                  xml << staff.staffInfo.to_xml
                end
              end
            end if sitem.anesthesiologists
            xml.mmlSg :anesthesiaDuration, sitem.anesthesiaDuration if sitem.anesthesiaDuration
            xml.mmlSg :operativeNotes, sitem.operativeNotes if sitem.operativeNotes
            xml.mmlSg :referenceInfo do
              sitem.referenceInfo.each do |ref|
                xml << ref.to_xml
              end
            end if sitem.referenceInfo
            xml.mmlSg :memo, sitem.memo if sitem.memo
          end
        end
      end
