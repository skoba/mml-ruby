describe MML::Summary do
  let(:out_staff_id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '00123')}
  let(:out_staff_name) {MML::Name.new(repCode: 'A', fullname: 'Hiroyuki Yoshihara')}
  let(:out_staff_personalized_info) {MML::PersonalizedInfo.new(id: id, personName: [out_staff_name])}
  let(:out_staff_creator_license) { MML::CreatorLicense.new(tableId: 'MML0026', value: 'doctor')}
  let(:out_staff_info) {MML::StaffInfo.new(personalizedInfo: out_staff_personalized_info, creatorLicense: [out_staff_creator_license])}
  let(:outpatient_item) {MML::OutpatientItem.new(date: '2013-08-25', first: true, emergency: true, outPatientCondition: '10A.M.the patient was put into the ambulance on a stretcher and driven to our hospital.', staffs: [out_staff_info])}
  let(:referer_id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '23234567')}
  let(:referer_name) {MML::Name.new(repCode: 'A', tableId: 'MML0025', family: 'Ono', given: 'Yoko', degree: 'M.D.')}
  let(:referer_facility_name) {MML::FacilityName.new(repCode: 'A', tableId: 'MML0025', value: 'New Millenium Medical College Hospital')}
  let(:referer_facility_id) {MML::Id.new(type: 'insurance', tableId: 'MML0027', value: '801.006.3')}
  let(:referer_facility) {MML::Facility.new(id: referer_facility_id, name: [referer_facility_name])}
  let(:referer) {MML::PersonalizedInfo.new(id: referer_id, personName: [referer_name], facility: referer_facility)}
  let(:admission) {MML::Admission.new(date: '2013-12-08', admissionCondition: 'Emergency admission by ambulance', emergency: true, referFrom: referer)}

  let(:refer_to_id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '55234567')}
  let(:refer_to_name) {MML::Name.new(repCode: 'A', tableId: 'MML0025', family: 'Tanaka', given: 'Fujiko', degree: 'M.D.')}
  let(:refer_to_facility_name) {MML::FacilityName.new(repCode: 'A', tableId: 'MML0025', value: 'New Millenium Heisei Hospital')}
  let(:refer_to_facility_id) {MML::Id.new(type: 'insurance', tableId: 'MML0027', value: '32354678')}
  let(:refer_to_facility) {MML::Facility.new(id: refer_to_facility_id, name: [refer_to_facility_name])}
  let(:refer_to) {MML::PersonalizedInfo.new(id: refer_to_id, personName: [refer_to_name], facility: refer_to_facility)}
  let(:discharge) {MML::Discharge.new(date: '2013-08-31', dischargeCondition: '4 P.O.D, the patient was transferred to the chronic hospital.', outcome: 'transferChronic', referTo: refer_to)}

  let(:id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '23456789')}
  let(:name) {MML::Name.new(repCode: 'A', fullname: 'Kenji Araki')}
  let(:personalized_info) {MML::PersonalizedInfo.new(id: id, personName: [name])}
  let(:creator_license) { MML::CreatorLicense.new(tableId: 'MML0026', value: 'doctor')}
  let(:staff_info) {MML::StaffInfo.new(personalizedInfo: personalized_info, creatorLicense: [creator_license])}

  let(:inpatient_item) {MML::InpatientItem.new(admission: admission, discharge: discharge, staffs: [staff_info])}

  let(:service_history) {MML::ServiceHistory.new(start: '2013-08-25', end: '2013-08-31', outPatient: [outpatient_item], inPatient: [inpatient_item])}

  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'right tibial fracture')}

  let(:death_info) {MML::DeathInfo.new(date: '2013-08-31', autopsy: true, value: 'The patient died of gastric cancer.')}

  let(:surgical_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'Lung cancer')}
  let(:procedure_item) {MML::ProcedureItem.new(operation: 'right lobectomy')}
  let(:surgery_item) {MML::SurgeryItem.new(date: '2013-12-10', surgicalDiagnosis: [surgical_diagnosis], surgicalProcedure: [procedure_item])}
  let(:surgery) {MML::Surgery.new(surgeryItem: [surgery_item])}

  let(:physicalExamRef) {MML::ExtRef.new(href: 'http://chest/auscultation')}
  let(:physicalExam) {MML::ValueWithLink.new(value: 'Heart sounds were clear', link: [physicalExamRef])}

  let(:doc_ref) {MML::ExtRef.new(href: 'img://file/angio/')}
  let(:related_doc) {MML::RelatedDoc.new(value: '11D1AC5400A0C94A814796045F768ED5', relation: 'detail')}
  let(:clinical_record) {MML::ClinicalRecord.new(value: 'Emergency coronary angiography was carried out.', date: '2013-12-20', extRef: [doc_ref], relatedDoc: [related_doc])}

  let(:discharge_ref) {MML::ExtRef.new(href: 'ext:/summary/discharge')}
  let(:discharge_findings) {MML::ValueWithLink.new(value: 'Symptoms free, no wound infection.', link: [discharge_ref])}

  let(:medication_ref) {MML::ExtRef.new(href: 'patient1234/prescription003.HL7')}
  let(:medication) {MML::ValueWithLink.new(value: 'Prescription on discharge', link: [medication_ref])}

  let(:test_ref) {MML::ExtRef.new(href: 'patient1234/prescription004.HL7')}
  let(:test_result) {MML::TestResult.new(date: '2013-12-22', value: 'Labo findings on discharge', link: [test_ref])}

  let(:plan_ref) {MML::ExtRef.new(href: 'patient1234/rehabilitationplan')}
  let(:plan) {MML::ValueWithLink.new(value: 'Rehabilitation program and wound care will continue in the chronic hospital.', link: [plan_ref])}
  let(:summary) {MML::Summary.new(serviceHistory: service_history, registeredDiagnosis: [registered_diagnosis], deathInfo: death_info, surgeryModule: [surgery], chiefComplaints: 'Severe chest pain', patientProfile: 'The patient is a 40-year-old married forester.', history: 'On a background of good health, (snip)', physicalExam: physicalExam, clinicalCourse: [clinical_record], dischargeFindings: discharge_findings, medication: medication, testResults: [test_result], plan: plan, remarks: 'Patient education: good. Appointment in outpatient department in 2 weeks.')}

  it 'is an instance of MML::Summary' do
    expect(summary).to be_an_instance_of MML::Summary
  end

  it 'serviceHistory should be assigned properly' do
    expect(summary.serviceHistory.start).to eq '2013-08-25'
  end

  it 'registeredDiagnosis should be assigned properly' do
    expect(summary.registeredDiagnosis[0].diagnosis).to eq 'right tibial fracture'
  end

  it 'registeredDiagnosis is optional' do
    expect {summary.registeredDiagnosis = nil}.not_to raise_error
  end

  it 'deathInfo should be assigned properly' do
    expect(summary.deathInfo.value).to eq 'The patient died of gastric cancer.'
  end

  it 'deathInfo is optional' do
    expect {summary.deathInfo = nil}.not_to raise_error
  end

  it 'surgeryModule should be assigned properly' do
    expect(summary.surgeryModule[0].surgeryItem[0].date).to eq '2013-12-10'
  end

  it 'surgeryModule is optional' do
    expect {summary.surgeryModule = nil}.not_to raise_error
  end

  it 'chiefComplaint should be assigned properly' do
    expect(summary.chiefComplaints).to eq 'Severe chest pain'
  end

  it 'chiefComplaints is optional' do
    expect {summary.chiefComplaints = nil}.not_to raise_error
  end

  it 'patientProfile should be assigned properly' do
    expect(summary.patientProfile).to eq 'The patient is a 40-year-old married forester.'
  end

  it 'patientProfile is optional' do
    expect {summary.patientProfile}.not_to raise_error
  end

  it 'hitory should be assigned properly' do
    expect(summary.history).to eq 'On a background of good health, (snip)'
  end

  it 'history is optional' do
    expect {summary.history = nil}.not_to raise_error
  end

  it 'physicalExam should be assigned properly' do
    expect(summary.physicalExam.value).to eq 'Heart sounds were clear'
  end

  it 'physicalExam is optional' do
    expect {summary.physicalExam = nil}.not_to raise_error
  end

  it 'clinicalCourse should be assigned properly' do
    expect(summary.clinicalCourse[0].date).to eq '2013-12-20'
  end

  it 'clinicalCourse is optional' do
    expect {summary.clinicalCourse = nil}.not_to raise_error
  end

  it 'dischargeFindings should be assigned properly' do
    expect(summary.dischargeFindings.value).to eq 'Symptoms free, no wound infection.'
  end

  it 'dischargeFindings is optional' do
    expect {summary.dischargeFindings = nil}.not_to raise_error
  end

  it 'medication should be assigned properly' do
    expect(summary.medication.value).to eq 'Prescription on discharge'
  end

  it 'medication is optional' do
    expect {summary.medication = nil}.not_to raise_error
  end

  it 'testResults should be assigned properly' do
    expect(summary.testResults[0].value).to eq 'Labo findings on discharge'
  end

  it 'plan should be assigned properly' do
    expect(summary.plan.value).to eq 'Rehabilitation program and wound care will continue in the chronic hospital.'
  end

  it 'remarks should be assigned properly' do
    expect(summary.remarks).to eq 'Patient education: good. Appointment in outpatient department in 2 weeks.'
  end

  describe '#to_xml' do
    subject {summary.to_xml}

    it {should match '<mmlSm:SummaryModule>'}
    it {should match '<mmlSm:serviceHistory'}
    it {should match 'mmlSm:start="2013-08-25"'}
    it {should match 'mmlSm:end="2013-08-31"'}
    it {should match '<mmlSm:outPatient><mmlSm:outPatientItem>'}
    it {should match '<mmlSm:date>2013-08-25</mmlSm:date>'}
    it {should match '<mmlSm:outPatientCondition'}
    it {should match 'mmlSm:first="true"'}
    it {should match 'mmlSm:emergency="true"'}
    it {should match '10A.M.the patient was put into the ambulance on a stretcher and driven to our hospital.</mmlSm:outPatientCondition>'}
    it {should match '<mmlSm:staffs><mmlSm:staffInfo>'}
    it {should match '<mmlPsi:PersonalizedInfo>'}
    it {should match '<mmlNm:fullname>Hiroyuki Yoshihara</mmlNm:fullname>'}
    it {should match '</mmlPsi:PersonalizedInfo>'}
    it {should match '<mmlCi:creatorLicense mmlCi:tableId="MML0026">doctor</mmlCi:creatorLicense></mmlSm:staffInfo></mmlSm:staffs>'}
    it {should match '</mmlSm:outPatientItem></mmlSm:outPatient>'}
    it {should match '<mmlSm:inPatient>'}
    it {should match '<mmlSm:inPatientItem>'}
    it {should match '<mmlSm:admission>'}
    it {should match '<mmlSm:date>2013-12-08</mmlSm:date>'}
    it {should match '<mmlSm:admissionCondition mmlSm:emergency="true">Emergency admission by ambulance</mmlSm:admissionCondition>'}
    it {should match '<mmlSm:referFrom><mmlPsi:PersonalizedInfo'}
    it {should match '<mmlNm:given>Yoko</mmlNm:given>'}
    it {should match '</mmlPsi:PersonalizedInfo></mmlSm:referFrom>'}
    it {should match '</mmlSm:admission><mmlSm:discharge><mmlSm:date>2013-08-31</mmlSm:date>'}
    it {should match '<mmlSm:dischargeCondition mmlSm:outcome="transferChronic">4 P.O.D, the patient was transferred to the chronic hospital.</mmlSm:dischargeCondition>'}
    it {should match '<mmlSm:referTo><mmlPsi:PersonalizedInfo>'}
    it {should match '<mmlNm:family>Tanaka</mmlNm:family>'}
    it {should match '</mmlPsi:PersonalizedInfo></mmlSm:referTo></mmlSm:discharge>'}
    it {should match '<mmlSm:staffs>'}
    it {should match '<mmlSm:staffInfo><mmlPsi:PersonalizedInfo>'}
    it {should match '<mmlNm:fullname>Kenji Araki</mmlNm:fullname>'}
    it {should match '</mmlCi:creatorLicense></mmlSm:staffInfo></mmlSm:staffs></mmlSm:inPatientItem>'}
    it {should match '</mmlSm:inPatient>'}
    it {should match '</mmlSm:serviceHistory>'}
    it {should match '<mmlRd:RegisteredDiagnosisModule>'}
    it {should match '<mmlRd:diagnosis>right tibial fracture</mmlRd:diagnosis>'}
    it {should match '</mmlRd:RegisteredDiagnosisModule>'}
    it {should match '<mmlSm:deathInfo'}
    it {should match 'mmlSm:date="2013-08-31"'}
    it {should match 'mmlSm:autopsy="true"'}
    it {should match '>The patient died of gastric cancer.</mmlSm:deathInfo>'}
    it {should match '<mmlSg:SurgeryModule>'}
    it {should match '<mmlSg:surgeryItem>'}
    it {should match '<mmlSg:operation>right lobectomy</mmlSg:operation>'}
    it {should match '</mmlSg:surgeryItem>'}
    it {should match '</mmlSg:SurgeryModule>'}
    it {should match '<mmlSm:chiefComplaints>Severe chest pain</mmlSm:chiefComplaints>'}
    it {should match '<mmlSm:patientProfile>The patient is a 40-year-old married forester.</mmlSm:patientProfile>'}
    it {should match '<mmlSm:history>On a background of good health, \(snip\)</mmlSm:history>'}
    it {should match '<mmlSm:physicalExam>Heart sounds were clear'}
    it {should match '<mmlCm:extRef mmlCm:href="http://chest/auscultation"/>'}
    it {should match '</mmlSm:physicalExam>'}
    it {should match '<mmlSm:clinicalCourse>'}
    it {should match '<mmlSm:clinicalRecord mmlSm:date="2013-12-20">Emergency coronary angiography was carried out.'}
    it {should match '<mmlCm:extRef mmlCm:href="img://file/angio/"/>'}
    it {should match '</mmlSm:clinicalRecord>'}
    it {should match '</mmlSm:clinicalCourse>'}
    it {should match '<mmlSm:dischargeFindings>Symptoms free, no wound infection.'}
    it {should match '<mmlCm:extRef mmlCm:href="ext:/summary/discharge"/>'}
    it {should match '</mmlSm:dischargeFindings>'}
    it {should match '<mmlSm:medication>Prescription on discharge'}
    it {should match '<mmlCm:extRef mmlCm:href="patient1234/prescription003.HL7"/>'}
    it {should match '</mmlSm:medication>'}
    it {should match '<mmlSm:testResults>'}
    it {should match '<mmlSm:testResult mmlSm:date="2013-12-22">Labo findings on discharge'}
    it {should match '<mmlCm:extRef mmlCm:href="patient1234/prescription004.HL7"/>'}
    it {should match '</mmlSm:testResult></mmlSm:testResults>'}
    it {should match '<mmlSm:plan>Rehabilitation program and wound care will continue in the chronic hospital.'}
    it {should match '<mmlCm:extRef mmlCm:href="patient1234/rehabilitationplan"/></mmlSm:plan>'}
    it {should match '<mmlSm:remarks>Patient education: good. Appointment in outpatient department in 2 weeks.</mmlSm:remarks>'}
    it {should match '</mmlSm:SummaryModule>'}
  end
end
