describe MML::Insurance do
  let(:master_id) { MML::Id.new(value: '0001', type: 'facility', repCode: 'A', tableId: 'MML0024') }
  let(:name) { MML::Name.new(repCode: 'A', fullname: 'Shinji KOBAYASHI')}
  let(:patient_info) { MML::PatientInfo.new(materId: master_id, personName: [name], birthday: '1970-04-19', sex: 'male')}
  let(:insurance) { MML::Insurance.new(countryType: 'JPN')}

  it 'should be an instance of MML::INsurance' do
    expect(insurance).to be_an_instance_of MML::Insurance
  end

  it 'country type should be assigned properly' do
    expect(insurance.countryType).to eq 'JPN'
  end
end
