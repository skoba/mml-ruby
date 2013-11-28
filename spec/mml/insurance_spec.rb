# -*- coding: utf-8 -*-
describe MML::Insurance do
  let(:insurance_class) { MML::InsuranceClass.new(classCode: '01', tableId: 'MML0031', value: '国保') }
  let(:master_id) { MML::Id.new(value: '0001', type: 'facility', repCode: 'A', tableId: 'MML0024') }
  let(:name) { MML::Name.new(repCode: 'A', fullname: 'Shinji KOBAYASHI')}
  let(:address) { MML::Address.new(repCode: 'A', addressClass: 'business', tableId: 'MML0025', full: '506, Dept. 9, Kyoto Research Park (KRP), Awata-cho 91, Chudoji, Shimogyo-ku, Kyoto-city')}
  let(:phone) { MML::Phone.new(telEquipType: 'PH', area: '075', city: '874', number: '7030') }
  let(:client) {MML::InsuranceClient.new(personName: [name], addresses: [address], phones: [phone])}
  let(:insured_facility_id) {MML::Id.new(type: 'insurance', tableId: 'MML0027', value: '12345')}
  let(:insured_facility_name) {MML::FacilityName.new(repCode: 'A', value: '宮崎市広域連合')}
  let(:insured_facility_address) { MML::Address.new(repCode: 'A', prefecture: 'Miyazaki')}
  let(:insured_facility_phone) {MML::Phone.new(telEquipType: 'PH', full: '075-123-4567')}
  let(:insured_facility) {MML::Facility.new(id: insured_facility_id, name: [insured_facility_name])}
  let(:insured_info) {MML::OrganizationInfo.new(facility: insured_facility, addresses: [insured_facility_address], phones: [insured_facility_phone])}
  let(:work_facility_name) {MML::FacilityName.new(repCode: 'A', value: 'Miyazaki Univ.')}
  let(:work_facility_id) {MML::Id.new(type: 'business', tableId: 'MML0027', value: '56789')}
  let(:work_facility) {MML::Facility.new(id: work_facility_id, name: [work_facility_name])}
  let(:work_address) {MML::Address.new(repCode: 'A', town: 'Kiyotake-cho')}
  let(:work_phone) {MML::Phone.new(telEquipType: 'PH', area: '0985')}
  let(:work_info) {MML::OrganizationInfo.new(facility: work_facility, addresses: [work_address], phones: [work_phone])}
  let(:public_insurance_item) {MML::PublicInsuranceItem.new(priority: '1', providerName: '公費', provider: '15450034', recipient: '0009043', startDate: '1997-09-30', expiredDate: '1999-09-30', paymentRatio: 10_000, ratioType: 'fix')}
  let(:insurance) { MML::Insurance.new(countryType: 'JPN', insuranceClass: insurance_class, insuranceNumber: '8001', group: '宮市みへし', number: '421', familyClass: false, clientInfo: client, continuedDiseases: ['diabetes mellitus'], startDate: '2013-10-01', expiredDate: '2018-03-31', paymentInRatio: 0.2, paymentOutRatio: 0.3, insuredInfo: insured_info, workInfo: work_info, publicInsurance: [public_insurance_item]) }

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

  it 'clientInfo should be assigned properly' do
    expect(insurance.clientInfo.personName[0].fullname).to eq 'Shinji KOBAYASHI'
  end

  it 'clientInfo is optional' do
    expect{insurance.clientInfo = nil}.not_to raise_error
  end

  it 'continuedDiseases should be assigned properly' do
    expect(insurance.continuedDiseases[0]).to eq 'diabetes mellitus'
  end

  it 'continuedDiseases is optional' do
    expect{insurance.continuedDiseases = nil}.not_to raise_error
  end

  it 'startDate should be assigned properly' do
    expect(insurance.startDate).to eq '2013-10-01'
  end

  it 'startDate is mandatory' do
    expect{insurance.startDate = nil}.to raise_error ArgumentError
  end

  it 'expiredDate should be assigned properly' do
    expect(insurance.expiredDate).to eq '2018-03-31'
  end

  it 'expiredDate is mandatory' do
    expect{insurance.expiredDate = nil}.to raise_error ArgumentError
  end

  it 'paymentInRatio should be assigned properly' do
    expect(insurance.paymentInRatio).to eq 0.2
  end

  it 'paymentOutRatio should be assigned properly' do
    expect(insurance.paymentOutRatio).to eq 0.3
  end

  it 'insured info should be assigned properly' do
    expect(insurance.insuredInfo.facility.id.value).to eq '12345'
  end

  it 'work info should be assined properly' do
    expect(insurance.workInfo.facility.id.value).to eq '56789'
  end

  it 'public insurance item should assigned properly' do
    expect(insurance.publicInsurance[0].provider).to eq '15450034'
  end
end
