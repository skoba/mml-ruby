describe MML::Anesthesiologist do
  let(:staff_id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '00123')}
  let(:staff_name) {MML::Name.new(repCode: 'A', fullname: 'Kenji ARAKI')}
  let(:staff_info) {MML::PersonalizedInfo.new(id: staff_id, personName: [staff_name])}
  let(:staff) {MML::Anesthesiologist.new(staffClass: 'main anesthesiologist', superiority: 1, staffInfo: staff_info)}

  it 'is an instance of MML::Anesthesiologist' do
    expect(staff).to be_an_instance_of MML::Anesthesiologist
  end

  it 'staffClass should be assigned properly' do
    expect(staff.staffClass).to eq 'main anesthesiologist'
  end

  it 'superiolity should be assigned properly' do
    expect(staff.superiority).to eq 1
  end

  it 'staffInfo should be assigned properly' do
    expect(staff.staffInfo.personName[0].fullname).to eq 'Kenji ARAKI'
  end
end
