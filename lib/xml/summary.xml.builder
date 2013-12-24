xml.mmlSm :SummaryModule do
  attributes = Hash.new
  attributes['mmlSm:start'] = serviceHistory.start if serviceHistory.start
  attributes['mmlSm:end'] = serviceHistory.end if serviceHistory.end
  xml.mmlSm :serviceHistory, attributes do
    xml.mmlSm :outPatient do
      serviceHistory.outPatient.each do |item|
        xml.mmlSm :outPatientItem do
          xml.mmlSm :date, item.date
          condition_attr = Hash.new
          condition_attr['mmlSm:first'] = item.first unless item.first.nil?
          condition_attr['mmlSm:emergency'] = item.emergency unless item.emergency.nil?
          xml.mmlSm :outPatientCondition, item.outPatientCondition, condition_attr if item.outPatientCondition
          xml.mmlSm :staffs do
            item.staffs.each do |staff|
              xml << staff.to_xml
            end
          end if item.staffs
        end
      end
    end if serviceHistory.outPatient
    xml.mmlSm :inPatient do
      serviceHistory.inPatient.each do |item|
        xml.mmlSm :inPatientItem do
          xml.mmlSm :admission do
            xml.mmlSm :date, item.admission.date
            if item.admission.admissionCondition
              admission_attr = Hash.new
              admission_attr['mmlSm:emergency'] = item.admission.emergency unless item.admission.emergency.nil?
              xml.mmlSm :admissionCondition, item.admission.admissionCondition, admission_attr
            end
            xml.mmlSm :referFrom do
              xml << item.admission.referFrom.to_xml
            end if item.admission.referFrom
          end
          xml.mmlSm :discharge do
            xml.mmlSm :date, item.discharge.date
            if item.discharge.dischargeCondition
              discharge_attr = Hash.new
              discharge_attr['mmlSm:outcome'] = item.discharge.outcome if item.discharge.outcome
              xml.mmlSm :dischargeCondition, item.discharge.dischargeCondition, discharge_attr
            end
            xml.mmlSm :referTo do
              xml << item.discharge.referTo.to_xml
            end if item.discharge.referTo
          end
          xml.mmlSm :staffs do
            item.staffs.each do |staff|
              xml << staff.to_xml
            end
          end if item.staffs
        end
      end 
    end if serviceHistory.inPatient
  end
  registeredDiagnosis.each do |diagnosis|
    xml << diagnosis.to_xml
  end if registeredDiagnosis
  if deathInfo
    death_attr = Hash.new
    death_attr['mmlSm:date'] = deathInfo.date if deathInfo.date
    death_attr['mmlSm:autopsy'] = deathInfo.autopsy unless deathInfo.autopsy.nil?
    xml.mmlSm :deathInfo, deathInfo.value, death_attr
  end
  surgeryModule.each do |surgery|
    xml << surgery.to_xml
  end if surgeryModule
  xml.mmlSm :chiefComplaints, chiefComplaints if chiefComplaints
  xml.mmlSm :patientProfile, patientProfile if patientProfile
  xml.mmlSm :history, history if history
  xml.mmlSm :physicalExam do
    xml << physicalExam.value
    physicalExam.link.each do |link|
      xml << link.to_xml
    end if physicalExam.link
  end if physicalExam
  xml.mmlSm :clinicalCourse do
    clinicalCourse.each do |record|
      record_attr = Hash.new
      record_attr['mmlSm:date'] = record.date
      xml.mmlSm :clinicalRecord, record_attr do
        xml << record.value
        record.extRef.each do |ref|
          xml << ref.to_xml
        end if record.extRef
        record.relatedDoc.each do |doc|
          doc_attr = Hash.new
          doc_attr['mmlSm:relation'] = doc.relation if doc.relation
          xml.mmlSm :relatedDoc, doc.value, doc_attr
        end if record.relatedDoc
      end
    end
  end if clinicalCourse
  xml.mmlSm :dischargeFindings do
    xml << dischargeFindings.value
    dischargeFindings.link.each do |link|
      xml << link.to_xml
    end if dischargeFindings.link
  end if dischargeFindings
  xml.mmlSm :medication do
    xml << medication.value
    medication.link.each do |link|
      xml << link.to_xml
    end if medication.link
  end if medication
  xml.mmlSm :testResults do
    testResults.each do |test|
      test_attr = Hash.new
      test_attr['mmlSm:date'] = test.date if test.date
      xml.mmlSm :testResult, test_attr do
        xml << test.value
        test.link.each do |link|
          xml << link.to_xml
        end if test.link
      end
    end
  end if testResults
  xml.mmlSm :plan do
    xml << plan.value
    plan.link.each do |link|
      xml << link.to_xml
    end if plan.link
  end if plan
  xml.mmlSm :remarks, remarks if remarks
end
