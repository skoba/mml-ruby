describe MML::Nationality do
  let(:nationality) {MML::Nationality.new(value: 'JPN', subtype: 'USA') }

  it 'should be an instance of MMLNationality' do
    expect(nationality).to be_an_instance_of MML::Nationality
  end

  it 'value should be assigned properly' do
    expect(nationality.value).to eq 'JPN'
  end

  it 'value is mandatory' do
    expect {nationality.value = nil}.to raise_error ArgumentError
  end

  it 'subtype should be assgined properly' do
    expect(nationality.subtype).to eq 'USA'
  end
end
