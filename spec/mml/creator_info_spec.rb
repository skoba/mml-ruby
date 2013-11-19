describe MML::CreatorInfo do
  let(:person_id) { MML::Id.new(type: 'facility', tableId: 'MML00024', value: '54321')}
  let(:name) {MML::Name.new(repCode: 'A', fullname: 'Shinji KOBAYASHI')}
  let(:personalizedInfo) {MML::PersonalizedInfo.new(id: person_id, personName: [name])}
  let(:creator_license) { MML::CreatorLicense.new(tableId: 'MML0026', value: 'doctor')}
  let(:creator_info){ MML::CreatorInfo.new(personalizedInfo: personalizedInfo, creatorLicense: [creator_license]) }

  it 'personalizedInfo should be assigned properly' do
    expect(creator_info.personalizedInfo.id.value).to eq '54321'
  end

  it 'personalizedInfo is mandatory' do
    expect {creator_info.personalizedInfo = nil}.to raise_error ArgumentError
  end
  it 'should be an isntance of CreatorInfo' do
    expect(creator_info).to be_an_instance_of MML::CreatorInfo
  end

  it 'default table id is MML0026' do
    expect(creator_info.creatorLicense[0].tableId).to eq 'MML0026'
  end

  it 'creator license should be assigned properly' do
    expect(creator_info.creatorLicense[0].value).to eq 'doctor'
  end

  context 'creator license is mandatory' do
    it 'should not be nil' do
      expect {creator_info.creatorLicense = nil}.to raise_error ArgumentError
    end

    it 'should not be empty' do
      expect {creator_info.creatorLicense = []}.to raise_error ArgumentError
    end
  end
  
  describe '#to_xml' do
    subject { creator_info.to_xml }

    it {should match '<mmlCi:CreatorInfo>'}
    it {should match '<mmlPsi:PersonalizedInfo>'}
    it {should match '>Shinji KOBAYASHI</mmlNm:fullname></mmlNm:Name>'}
    it {should match '</mmlPsi:PersonalizedInfo>'}
    it {should match '<mmlCi:creatorLicense mmlCi:tableId="MML0026">'}
    it {should match '>doctor</mmlCi:creatorLicense>'}
    it {should match '</mmlCi:CreatorInfo>'}
  end
end
