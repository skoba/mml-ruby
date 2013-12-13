describe MML::SurgicalStaff do
  let(:staff_id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '00123')}
  let(:staff_name) {MML::Name.new(repCode: 'A', fullname: 'Hiroyuki Yoshihara')}
  let(:staff_info) {MML::PersonalizedInfo.new(id: staff_id, personName: [staff_name])}
  let(:staff) {MML::SurgicalStaff.new(staffClass: 'assistant', superiority: 1, staffInfo: staff_info)}

  it 'is an instance of MML::SurgicalStaff' do
    expect(staff).to be_an_instance_of MML::SurgicalStaff
  end

  it 'staffClass should be assigned properly' do
    expect(staff.staffClass).to eq 'assistant'
  end

  it 'staffClass is optional' do
    expect {staff.staffClass}.not_to raise_error
  end

  it 'superiority should be assigned properly' do
    expect(staff.superiority).to eq 1
  end

  it 'superiority is optional' do
    expect {staff.superiority = nil}.not_to raise_error
  end

  it 'staffInfo should be_assigned properly' do
    expect(staff.staffInfo.id.value).to eq '00123'
  end

  it 'staffInfo is mandatory' do
    expect {staff.staffInfo = nil}.to raise_error ArgumentError
  end
end
