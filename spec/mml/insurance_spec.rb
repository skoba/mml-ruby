# -*- coding: utf-8 -*-
describe MML::Insurance do
  let(:insurance_class) { MML::InsuranceClass.new(classCode: '01', tableId: 'MML0031', value: '国保') }
  let(:master_id) { MML::Id.new(value: '0001', type: 'facility', repCode: 'A', tableId: 'MML0024') }
  let(:name) { MML::Name.new(repCode: 'A', fullname: 'Shinji KOBAYASHI')}
  let(:address) { MML::Address.new(repCode: 'A', addressClass: 'business', tableId: 'MML0025', full: '506, Dept. 9, Kyoto Research Park (KRP), Awata-cho 91, Chudoji, Shimogyo-ku, Kyoto-city')}
  let(:phone) { MML::Phone.new(telEquipType: 'PH', area: '075', city: '874', number: '7030') }
  let(:insurance) { MML::Insurance.new(countryType: 'JPN', insuranceClass: insurance_class, insuranceNumber: '8001', group: '宮市みへし', number: '421', familyClass: false, personName: [name]) }

  it 'should be an instance of MML::Insurance' do
    expect(insurance).to be_an_instance_of MML::Insurance
  end

  it 'country type should be assigned properly' do
    expect(insurance.countryType).to eq 'JPN'
  end

  it 'insuranceClass should be assigned properly' do
    expect(insurance.insuranceClass.value).to eq '国保'
  end

  it 'insuranceNumber should be assigned properly' do
    expect(insurance.insuranceNumber).to eq '8001'
  end

  it 'group should be assigned properly' do
    expect(insurance.group).to eq '宮市みへし'
  end

  it 'group is mandatory' do
    expect {insurance.group = nil}.to raise_error ArgumentError
  end

  it 'number should be assigned properly' do
    expect(insurance.number).to eq '421'
  end

  it 'family class should be assigned properly' do
    expect(insurance.familyClass).to be_false
  end

  it 'family class is mandatory' do
    expect {insurance.familyClass = nil }.to raise_error ArgumentError
  end

  it 'personName should be assigned properly' do
    expect(insurance.personName[0].fullname).to eq 'Shinji KOBAYASHI'
  end

  it 'client address should be assigned properly' do
#    expect(insurance.clientInfo.addresses[0].)
  end
end
