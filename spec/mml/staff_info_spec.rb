describe MML::StaffInfo do
  let(:id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '00123')}
  let(:name) {MML::Name.new(repCode: 'A', fullname: 'Hiroyuki Yoshihara')}
  let(:personalized_info) {MML::PersonalizedInfo.new(id: id, personName: [name])}
  let(:creator_license) { MML::CreatorLicense.new(tableId: 'MML0026', value: 'doctor')}
  let(:staff_info) {MML::StaffInfo.new(personalizedInfo: personalized_info, creatorLicense: [creator_license])}

  it 'is an instance of MML::StaffInfo' do
    expect(staff_info).to be_an_instance_of MML::StaffInfo
  end

  it 'personalizedInfo should be assigned properly' do
    expect(staff_info.personalizedInfo.id.value).to eq '00123'
  end

  it 'personalizedInfo is mandatory' do
    expect {staff_info.personalizedInfo = nil}.to raise_error ArgumentError
  end

  it 'creatorLicense should be assigned properly' do
    expect(staff_info.creatorLicense[0].value).to eq 'doctor'
  end

  it 'creatorLicense is mandatory' do
    expect {staff_info.creatorLicense = nil}.to raise_error ArgumentError
  end
end
