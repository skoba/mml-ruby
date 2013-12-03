describe MML::OtherBloodType do
  let(:other_blood_type) {MML::OtherBloodType.new(typeName: 'MNS blood type', typeJudgement: 'MN', description: 'examination at 2 years ago')}

  it 'is an instance of MML::OtherBloodType' do
    expect(other_blood_type).to be_an_instance_of MML::OtherBloodType
  end

  it 'typeName should be assigned properly' do
    expect(other_blood_type.typeName).to eq 'MNS blood type'
  end

  it 'typeName is mandatory' do
    expect{other_blood_type.typeName = nil}.to raise_error ArgumentError
  end

  it 'typeJudgement should be assigned properly' do
    expect(other_blood_type.typeJudgement).to eq 'MN'
  end

  it 'typeJudgement is mandatory' do
    expect {other_blood_type.typeJudgement = nil}.to raise_error ArgumentError
  end

  it 'description should be assigned properly' do
    expect(other_blood_type.description).to eq 'examination at 2 years ago'
  end

  it 'description is optional' do
    expect {other_blood_type.description = nil}.not_to raise_error
  end
end
