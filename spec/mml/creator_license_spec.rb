describe MML::CreatorLicense do
  let(:creator_license) { MML::CreatorLicense.new(tableId: 'MML0026',
                                                  value: 'doctor')}

  it "creator license should be an instance of CreatorLicense" do
    expect(creator_license).to be_an_instance_of MML::CreatorLicense
  end

  it 'table id should be MML0026' do
    expect(creator_license.tableId).to eq 'MML0026'
  end

  it 'value should be doctor' do
    expect(creator_license.value).to eq 'doctor'
  end
end
