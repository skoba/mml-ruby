describe MML::DeathInfo do
  let(:death_info) {MML::DeathInfo.new(date: '2013-08-31', autopsy: true, value: 'The patient died of gastric cancer.')}

  it 'is an instance of MML::DeathInfo' do
    expect(death_info).to be_an_instance_of MML::DeathInfo
  end

  it 'date should be assigned properly' do
    expect(death_info.date).to eq '2013-08-31'
  end

  it 'autopsy should be assgined properly' do
    expect(death_info.autopsy).to be true
  end

  it 'value should be assigned properly' do
    expect(death_info.value).to eq 'The patient died of gastric cancer.'
  end
end
