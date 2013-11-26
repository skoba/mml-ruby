describe MML::OrganizationInfo do
  let(:facility_name) {double(MML::FacilityName, value: 'MML Hospital')}
  let(:facility) {double(MML::Facility, name: [facility_name])}
  let(:address) {double(MML::Address, city: 'Kyoto-city')}
  let(:phone) {double(MML::Phone, area: '075')}
  let(:organization) {MML::OrganizationInfo.new(facility: facility, addresses: [address], phones: [phone])}

  it 'is an instance of MML::OrganizationInfo' do
    expect(organization).to be_an_instance_of MML::OrganizationInfo
  end

  it 'facility should be assigned properly' do
    expect(organization.facility.name[0].value).to eq 'MML Hospital'
  end

  it 'facility is optional' do
    expect{organization.facility = nil}.not_to raise_error
  end

  it 'addresses should be assigned properly' do
    expect(organization.addresses[0].city).to eq 'Kyoto-city'
  end

  it 'addresses are optional' do
    expect{organization.addresses = nil}.not_to raise_error
  end

  it 'phones should be assigned properly' do
    expect(organization.phones[0].area).to eq '075'
  end

  it 'phones are optional' do
    expect{organization.phones = nil}.not_to raise_error
  end
end
