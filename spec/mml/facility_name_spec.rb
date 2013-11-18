describe MML::FacilityName do
  let(:facility_name) { MML::FacilityName.new(value: 'New Millenium Medical College Hospital', repCode: 'A', tableId: 'MML0025') }

  it 'should be an instance of MML::FacilityName' do
    expect(facility_name).to be_an_instance_of MML::FacilityName
  end

  it 'value should be assigned porperly' do
    expect(facility_name.value).to eq 'New Millenium Medical College Hospital'
  end
  it 'repCode should be assigned properly' do
    expect(facility_name.repCode).to eq 'A'
  end

  it 'tableId should be assigned properly' do
    expect(facility_name.tableId).to eq 'MML0025'
  end
end
