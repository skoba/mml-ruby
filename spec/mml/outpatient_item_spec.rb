describe MML::OutpatientItem do
  let(:id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '00123')}
  let(:name) {MML::Name.new(repCode: 'A', fullname: 'Hiroyuki Yoshihara')}
  let(:personalized_info) {MML::PersonalizedInfo.new(id: id, personName: [name])}
  let(:creator_license) { MML::CreatorLicense.new(tableId: 'MML0026', value: 'doctor')}
  let(:staff_info) {MML::StaffInfo.new(personalizedInfo: personalized_info, creatorLicense: [creator_license])}
  let(:outpatient_item) {MML::OutpatientItem.new(date: '2013-08-25', first: true, emergency: true, outPatientCondition: '10A.M.the patient was put into the ambulance on a stretcher and driven to our hospital.', staffs: [staff_info])}

   it 'is an instance of MML::OutpatientItem' do
    expect(outpatient_item).to be_an_instance_of MML::OutpatientItem
  end

  it 'date should be assigned properly' do
    expect(outpatient_item.date).to eq '2013-08-25'
  end

  it 'date is mandatory' do
    expect {outpatient_item.date = nil}.to raise_error ArgumentError
  end

  it 'first should be assigned properly' do
    expect(outpatient_item.first).to be_true
  end

  it 'first is optional' do
    expect {outpatient_item.first = nil}.not_to raise_error
  end

  it 'emergency should be assigned properly' do
    expect(outpatient_item.emergency).to be_true
  end

  it 'emergency is optional' do
    expect {outpatient_item.emergency = nil}.not_to raise_error
  end

  it 'outPatientCondition should be assigned properly' do
    expect(outpatient_item.outPatientCondition).to eq '10A.M.the patient was put into the ambulance on a stretcher and driven to our hospital.'
  end

  it 'staffs should be assigned properly' do
    expect(outpatient_item.staffs[0].creatorLicense[0].value).to eq 'doctor'
  end

  it 'staffs is optional' do
    expect {outpatient_item.staffs = nil}.not_to raise_error
  end
end
