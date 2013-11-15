describe MML::Address do
  let(:address) { MML::Address.new(repCode: 'A', addressClass: 'business', tableId: 'MML0025', full: '506, Dept. 9, Kyoto Research Park (KRP), Awata-cho 91, Chudoji, Shimogyo-ku, Kyoto-city', homeNumber: '506, Dept. 9, Kyoto Research Park (KRP)', town: 'Awata-cho 91, Chudoji, Shimogyo-ku', city: 'Kyoto-city', prefecture: 'Kyoto-fu', zip: '600-8815', countryCode: 'JPN') }

  it 'should be an instance of Address' do
    expect(address).to be_an_instance_of MML::Address
  end

  it 'repCode should be properly assigned' do
    expect(address.repCode).to eq 'A'
  end

  it 'repCode is mandatory' do
    expect {address.repCode = nil}.to raise_error ArgumentError
  end

  it 'addressClass should be properly assigned' do
    expect(address.addressClass).to eq 'business'
  end

  it 'tableId should be properly assigned' do
    expect(address.tableId).to eq 'MML0025'
  end

  it 'homeNumber should be propwerly assigned' do
    expect(address.homeNumber).to eq '506, Dept. 9, Kyoto Research Park (KRP)'
  end

  it 'town should be properly assigned' do
    expect(address.town).to eq 'Awata-cho 91, Chudoji, Shimogyo-ku'
  end

  it 'city should be properly assigned' do
    expect(address.city).to eq 'Kyoto-city'
  end

  it 'prefecture should be properly assigned' do
    expect(address.prefecture).to eq 'Kyoto-fu'
  end

  it 'full address should be properly assigned' do
    expect(address.full).to eq '506, Dept. 9, Kyoto Research Park (KRP), Awata-cho 91, Chudoji, Shimogyo-ku, Kyoto-city'
  end

  it 'zip should be properly assigned' do
    expect(address.zip).to eq '600-8815'
  end

  it 'countryCode should be properly assigned' do
    expect(address.countryCode).to eq 'JPN'
  end

  context '#to_xml' do
    subject { address.to_xml }

    it {should match '<mmlAd:Address mmlAd:'}
    it {should match 'mmlAd:repCode="A"'}
    it {should match 'mmlAd:addressClass="business"'}
    it {should match 'mmlAd:tableId="MML0025"'}
    it {should match '<mmlAd:full>506, Dept. 9, Kyoto Research Park \(KRP\), Awata-cho 91, Chudoji, Shimogyo-ku, Kyoto-city</mmlAd:full>'}
    it {should match '<mmlAd:homeNumber>506, Dept. 9, Kyoto Research Park \(KRP\)</mmlAd:homeNumber>'}
    it {should match '<mmlAd:town>Awata-cho 91, Chudoji, Shimogyo-ku</mmlAd:town>'}
    it {should match '<mmlAd:city>Kyoto-city</mmlAd:city>'}
    it {should match '<mmlAd:prefecture>Kyoto-fu</mmlAd:prefecture>'}
    it {should match '<mmlAd:zip>600-8815</mmlAd:zip>'}
    it {should match '<mmlAd:countryCode>JPN</mmlAd:countryCode>'}
  end
end
