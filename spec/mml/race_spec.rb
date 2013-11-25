describe MML::Race do
  let(:race) { MML::Race.new(value: 'Japanese', raceCode: '2039-6', raceCodeId: 'Race & Ethnicity - CDC') }

  it 'is an instance of MML::Race' do
    expect(race).to be_an_instance_of MML::Race
  end

  it 'value should be assigned properly' do
    expect(race.value).to eq 'Japanese'
  end

  it 'raceCode should be assigned properly' do
    expect(race.raceCode).to eq '2039-6'
  end

  it 'raceCodeId should be assigned properly' do
    expect(race.raceCodeId).to eq 'Race & Ethnicity - CDC'
  end
end
