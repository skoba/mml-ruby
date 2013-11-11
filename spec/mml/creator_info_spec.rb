describe MML::CreatorInfo do
  let(:creator_license) { MML::CreatorLicense.new(tableId: 'MML0026',
                                                  value: 'doctor')}
  let(:creator_info){ MML::CreatorInfo.new(creatorLicense: [creator_license]) }

  it 'should be an isntance of CreatorInfo' do
    expect(creator_info).to be_an_instance_of MML::CreatorInfo
  end

  it 'default table id is MML0026' do
    expect(creator_info.creatorLicense[0].tableId).to eq 'MML0026'
  end

  it 'creator license should be doctor' do
    expect(creator_info.creatorLicense[0].value).to eq 'doctor'
  end
end
