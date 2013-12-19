describe MML::InpatientItem do
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

  it 'is an instance of MML::InpatientItem' do
    expect(inpatient_item).to be_an_instance_of MML::InpatientItem
  end

  it 'admission should be assigned properly' do
    expect(inpatient_item.admission.date).to eq '2013-12-08'
  end

  it 'admission is mandatory' do
    expect {inpatient_item.admission = nil}.to raise_error ArgumentError
  end

  it 'discharge should be assigned properly' do
    expect(inpatient_item.discharge.outcome).to eq 'transferChronic'
  end

  it 'discharge is mandatory' do
    expect {inpatient_item.discharge = nil}.to raise_error ArgumentError
  end

  it 'staffs should be assigned properly' do
    expect(inpatient_item.staffs[0].personalizedInfo.personName[0].fullname).to eq 'Kenji Araki'
  end
end
