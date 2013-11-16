describe MML::Phone do
  let(:phone) { MML::Phone.new(equipType: 'PH') }

  it 'should be an instance of MML::Phone' do
    expect(phone).to be_an_instance_of MML::Phone
  end

  it 'equipType should be properly assigned' do
    expect(phone.equipType).to eq 'PH'
  end
end
