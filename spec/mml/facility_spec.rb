describe MML::Facility do
  let(:id) { MML::Id.new(value: '12345', type: 'facility', tableId: 'MML0024', checkDigit: 5, checkDigitSchema: 'MML0001') }
  let(:name) { MML::FacilityName.new(value: 'New Millenium Medical College Hospital', repCode: 'A', tableId: 'MML0025') }
  let(:facility) { MML::Facility.new(name: [name], id: id) }

  it 'should be an instance of MML::Facility' do
    expect(facility).to be_an_instance_of MML::Facility
  end

  context 'name' do
    let(:facility_name) { facility.name[0] }

    it 'name should be assigned properly' do
      expect(facility_name.value).to eq 'New Millenium Medical College Hospital'
    end

    it 'repCode should be assigned properly' do
      expect(facility_name.repCode).to eq 'A'
    end

    it 'talbeId should be assigned properly' do
      expect(facility_name.tableId).to eq 'MML0025'
    end

    it 'facility name is mandatory' do
      expect{ facility.name = nil }.to raise_error ArgumentError
    end
  end

  it 'id should be properly assgined' do
    expect(facility.id.value).to eq '12345'
  end

  it 'id is not mandatory' do
    expect {facility.id = nil}.not_to raise_error
  end

  context '#to_xml' do
    subject { facility.to_xml}

    it {should match '<mmlFc:Facility>'}
    it {should match '<mmlFc:name mmlFc:'}
    it {should match 'mmlFc:repCode="A"'}
    it {should match 'mmlFc:tableId="MML0025"'}
    it {should match '<mmlCm:Id mmlCm:type="facility"'}
    it {should match 'mmlCm:tableId="MML0024"'}
    it {should match 'mmlCm:checkDigit="5"'}
    it {should match 'mmlCm:checkDigitSchema="MML0001"'}
  end
end
