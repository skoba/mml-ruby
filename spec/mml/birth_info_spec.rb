describe MML::BirthInfo do
  let(:id) { MML::Id.new(value: '12345', type: 'facility', tableId: 'MML0024', checkDigit: 5, checkDigitSchema: 'MML0001') }
  let(:name) { MML::FacilityName.new(value: 'New Millenium Medical College Hospital', repCode: 'A', tableId: 'MML0025') }
  let(:facility) { MML::Facility.new(name: [name], id: id) }
  let(:birth_info) {MML::BirthInfo.new(facility: facility, deliveryWeeks: 'P38W', deliveryMethod: 'cesarean section', bodyWeight: 3370, bodyWeightUnit: 'g', bodyHeight: 50, bodyHeightUnit: 'cm', chestCircumference: 31.1, chestCircumferenceUnit: 'cm', headCircumference: 32.8, headCircumferenceUnit: 'cm', memo: 'intact')}

  it 'is an instance of MML::BirthInfo' do
    expect(birth_info).to be_an_instance_of MML::BirthInfo
  end

  it 'facility should be assigned properly' do
    expect(birth_info.facility.id.value).to eq '12345'
  end

  it 'facility is optional' do
    expect {birth_info.facility = nil}.not_to raise_error
  end

  it 'deliveryWeeks should be assigned properly' do
    expect(birth_info.deliveryWeeks).to eq 'P38W'
  end

  it 'deliveryWeeks is optional' do
    expect {birth_info.deliveryWeeks = nil}.not_to raise_error
  end

  it 'deliveryMethod should be assigned properly' do
    expect(birth_info.deliveryMethod).to eq 'cesarean section'
  end

  it 'deliveryMethod is optional' do
    expect {birth_info.deliveryMethod = nil}.not_to raise_error
  end

  it 'bodyWeight should be assigned properly' do
    expect(birth_info.bodyWeight).to eq 3370
  end

  it 'bodyWeight is optional' do
    expect{birth_info.bodyWeight = nil}.not_to raise_error
  end

  it 'bodyWeight unit should be assigned properly' do
    expect(birth_info.bodyWeightUnit).to eq 'g'
  end

  it 'bodyHeight should be assigned properly' do
    expect(birth_info.bodyHeight).to eq 50
  end

  it 'bodyHeight is optional' do
    expect {birth_info.bodyHeight = nil}.not_to raise_error
  end
  
  it 'bodyHeightUnit should be assigned properly' do
    expect(birth_info.bodyHeightUnit).to eq 'cm'
  end

  it 'chestCircumference should be assigned properly' do
    expect(birth_info.chestCircumference).to eq 31.1
  end

  it 'chestCircumference is optional' do
    expect {birth_info.chestCircumference = nil}.not_to raise_error
  end

  it 'chestCircumferenceUnit should be assigned properly' do
    expect(birth_info.chestCircumferenceUnit).to eq 'cm'
  end

  it 'headCircumference should be assigned properly' do
    expect(birth_info.headCircumference).to eq 32.8
  end

  it 'headCircumference is optional' do
    expect {birth_info.headCircumference = nil}.not_to raise_error
  end

  it 'headCircumferenceUnit should be assigned properly' do
    expect(birth_info.headCircumferenceUnit).to eq 'cm'
  end

  it 'memo should be assigned properly' do
    expect(birth_info.memo).to eq 'intact'
  end

  it 'memo is optional' do
    expect {birth_info.memo = nil}.not_to raise_error
  end
end
