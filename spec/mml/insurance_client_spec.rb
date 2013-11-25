describe MML::InsuranceClient do
  
  let(:name) { MML::Name.new(repCode: 'A', fullname: 'Shinji KOBAYASHI')}
  let(:address) { MML::Address.new(repCode: 'A', addressClass: 'business', tableId: 'MML0025', full: '506, Dept. 9, Kyoto Research Park (KRP), Awata-cho 91, Chudoji, Shimogyo-ku, Kyoto-city')}
  let(:phone) { MML::Phone.new(telEquipType: 'PH', area: '075', city: '874', number: '7030') }

  let(:insurance_client) {MML::InsuranceClient.new(personName: [name], addresses: [address], phones: [phone])}

  it 'is an instance of MML::InsuranceClient' do
    expect(insurance_client).to be_an_instance_of MML::InsuranceClient
  end

  it 'personName should be assigned properly' do
    expect(insurance_client.personName[0].fullname).to eq 'Shinji KOBAYASHI'
  end

  it 'personName is optional' do
    expect {insurance_client.personName = nil}.not_to raise_error
  end

  it 'addresses should be assigned properly' do
    expect(insurance_client.addresses[0].addressClass).to eq 'business'
  end

  it 'addresses is optional' do
    expect {insurance_client.addresses = nil}.not_to raise_error
  end

  it 'phones should be properly assigned' do
    expect(insurance_client.phones[0].city).to eq '874'
  end

  it 'phones is optional' do
    expect{insurance_client.phones = nil}.not_to raise_error
  end
end
