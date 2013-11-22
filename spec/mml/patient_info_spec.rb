describe MML::PatientInfo do
  let(:master_id) { MML::Id.new(value: '0001', type: 'facility', repCode: 'A', tableId: 'MML0024') }
  let(:other_id) { MML::OtherId.new(type: 'spouseId', id: MML::Id.new(value: '000A', type: 'facility', repCode: 'A', tableId: 'MML0024')) }
  let(:person_name) { MML::Name.new(repCode: 'A', fullname: 'Shinji KOBAYASHI')}
  let(:nationality) { MML::Nationality.new(value: 'JPN', subtype: 'USA') } # for rspec, not real
  let(:address) { MML::Address.new(repCode: 'A', addressClass: 'business', tableId: 'MML0025', full: '506, Dept. 9, Kyoto Research Park (KRP), Awata-cho 91, Chudoji, Shimogyo-ku, Kyoto-city')}
  let(:email) { 'skoba@mmlexample.net' }
  let(:phone) { MML::Phone.new(telEquipType: 'PH', area: '075', city: '874', number: '7030') }
  let(:death) { MML::Death.new(flag: false)}
  let(:patient_info) { MML::PatientInfo.new(masterId: master_id, otherId: [other_id], personName: [person_name], birthday: '1970-04-19', sex: 'male', nationality: nationality, marital: 'married', addresses: [address], emailAddresses: [email], phones: [phone], accountNumber: 'ABC0123', socialIdentification: 'KYO4567', death: death) }

  it 'should be an instance of MML::PatientInfo' do
    expect(patient_info).to be_an_instance_of MML::PatientInfo
  end

  it 'masterId should be assigned properly' do
    expect(patient_info.masterId.value).to eq '0001'
  end

  it 'masterId is mandatory' do
    expect {patient_info.masterId = nil}.to raise_error ArgumentError
  end
  it 'otherId should be assigned properly' do
    expect(patient_info.otherId[0].id.value).to eq '000A'
  end

  it 'personName should be assigned properly' do
    expect(patient_info.personName[0].fullname).to eq 'Shinji KOBAYASHI'
  end

  it 'personName is mandatory' do
    expect { patient_info.personName = nil }.to raise_error ArgumentError
  end

  it 'personName should not be empty' do
    expect { patient_info.personName = [] }.to raise_error ArgumentError
  end

  it 'birthday should be assigned properly' do
    expect(patient_info.birthday).to eq '1970-04-19'
  end

  it 'birthday is mandatory' do
    expect {patient_info.birthday = nil}.to raise_error ArgumentError
  end

  it 'sex(gender) should be described' do
    expect(patient_info.sex).to eq 'male'
  end

  it 'nationality should be assigned properly' do
    expect(patient_info.nationality.value).to eq 'JPN'
  end

  it 'marital should be assigned properly. not real' do
    expect(patient_info.marital).to eq 'married'
  end

  it 'address should be properly assigned' do
    expect(patient_info.addresses[0].addressClass).to eq 'business'
  end

  it 'emailAddresses should be assigned properly' do
    expect(patient_info.emailAddresses[0]).to eq 'skoba@mmlexample.net'
  end

  it 'phones should be properly assigned' do
    expect(patient_info.phones[0].city).to eq '874'
  end

  it 'accountNumber should be assigned properly' do
    expect(patient_info.accountNumber).to eq 'ABC0123'
  end

  it 'socialNumber should be assigned properly' do
    expect(patient_info.socialIdentification).to eq 'KYO4567'
  end

  it 'death flag should be assigned porperly' do
    expect(patient_info.death.flag).to be_false
  end

  context '#to_xml' do
    subject { patient_info.to_xml }

    it {should match '<mmlPi:PatientModule>'}
    it {should match '<mmlPi:uniqueInfo>'}
    it {should match '<mmlPi:masterId>'}
    it {should match '<mmlCm:Id'}
    it {should match '>0001</mmlCm:Id>'}
    it {should match '</mmlPi:masterId>'}
    it {should match '<mmlPi:otherId mmlPi:type="spouseId"'}
    it {should match '>000A</mmlCm:Id>'}
    it {should match '</mmlPi:uniqueInfo>'}
    it {should match '</mmlPi:PatientModule>'}
  end
end
