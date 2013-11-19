describe MML::PersonalizedInfo do
  let(:id) { MML::Id.new(type: 'facility', tableId: 'MML0024', value: '5555') }
  let(:personName) { MML::Name.new(repCode: 'A', fullname: 'Shinji KOBAYASHI') }
  let(:facility_id) { MML::Id.new(type: 'insurance', tableId: 'MML0027', value: '12345')}
  let(:facility_name) {MML::FacilityName.new(value: 'New Millenium Medical College Hospital', repCode: 'A', tableId: 'MML0025')}
  let(:facility) { MML::Facility.new(id: facility_id, name: [facility_name]) }
  let(:department_name){MML::DepartmentName.new(repCode: 'A', tableId: 'MML0025', value: 'Cardiovascular surgery')}
  let(:department) { MML::Department.new(name: [department_name])}
  let(:address) { MML::Address.new(repCode: 'A', tableId: 'MML0025', addressClass: 'business', full: '5200 Kihara, Kiyotake-cho, Miyazaki-gun, Miyazaki-prefecture', zip: '889-1692', countryCode: 'JPN') }
  let(:email) {'araki@post.medxml.net'}
  let(:phone) {MML::Phone.new(telEquipType: 'PH', area: '0985', city: '85', number: '1500')}
  let(:personalized_info) { MML::PersonalizedInfo.new(id: id, personName: [personName], facility: facility, department: department, addresses: [address], emailAddresses: [email], phones: [phone]) }

  it 'personalized info should be an instance of PersonalizedInfo' do
    expect(personalized_info).to be_an_instance_of MML::PersonalizedInfo
  end

  it 'id should be assigned properly' do
    expect(personalized_info.id.value).to eq '5555'
  end

  it 'personName should be assigned properly' do
    expect(personalized_info.personName[0].fullname).to eq 'Shinji KOBAYASHI'
  end

  it 'faciilty should be assigned properly' do
    expect(personalized_info.facility.name[0].value).to eq 'New Millenium Medical College Hospital'
  end

  it 'department should be assigned properly' do
    expect(personalized_info.department.name[0].value).to eq 'Cardiovascular surgery'
  end

  it 'addresses are properly assined' do
    expect(personalized_info.addresses[0].zip).to eq '889-1692'
  end

  it 'emailAddresses are properly assigned' do
    expect(personalized_info.emailAddresses[0]).to eq 'araki@post.medxml.net'
  end

  it 'phones are properly assigned' do
    expect(personalized_info.phones[0].area).to eq '0985'
  end

  describe "#to_xml" do
    subject { personalized_info.to_xml }

    it {should match '<mmlPsi:PersonalizedInfo>'}
    it {should match '<mmlCm:Id'}
    it {should match 'mmlCm:type="facility"'}
    it {should match '<mmlPsi:personName>'}
    it {should match '<mmlNm:Name'}
    it {should match '<mmlNm:fullname>Shinji KOBAYASHI</mmlNm:fullname>'}
    it {should match '</mmlNm:Name>'}
    it {should match '<mmlFc:Facility>'}
    it {should match '<mmlFc:name'}
    it {should match '>New Millenium Medical College Hospital</mmlFc:name>'}
    it {should match 'mmlCm:tableId="MML0027"'}
    it {should match '>12345</mmlCm:Id>'}
    it {should match '</mmlFc:Facility>'}
    it {should match '<mmlDp:Department>'}
    it {should match '>Cardiovascular surgery</mmlDp:name>'}
    it {should match '</mmlDp:Department>'}
    it {should match '<mmlPsi:addresses>'}
    it {should match '<mmlAd:full>5200 Kihara, Kiyotake-cho, Miyazaki-gun, Miyazaki-prefecture'}
    it {should match '</mmlAd:full>'}
    it {should match '</mmlPsi:addresses>'}
    it {should match '<mmlPsi:emailAddresses>'}
    it {should match '<mmlCm:email>araki@post.medxml.net</mmlCm:email>'}
    it {should match '</mmlPsi:emailAddresses>'}
    it {should match '<mmlPsi:phones>'}
    it {should match '<mmlPh:Phone'}
    it {should match 'mmlPh:telEquipType="PH">'}
    it {should match '<mmlPh:city>85</mmlPh:city>'}
    it {should match '</mmlPsi:phones>'}
    it {should match '</mmlPsi:PersonalizedInfo>'}
  end
end
