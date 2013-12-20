describe MML::ServiceHistory do
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

  it 'is an instance of MML::ServiceHistory' do
    expect(service_history).to be_an_instance_of MML::ServiceHistory
  end

  it 'start is assigned properly' do
    expect(service_history.start).to eq '2013-08-25'
  end

  it 'end is assigned properly' do
    expect(service_history.end).to eq '2013-08-31'
  end

  it 'outPatient should be assigned properly' do
    expect(service_history.outPatient[0].date).to eq '2013-08-25'
  end

  it 'inPatient should be assigned properly' do
    expect(service_history.inPatient[0].admission.date).to eq '2013-12-08'
  end
end
