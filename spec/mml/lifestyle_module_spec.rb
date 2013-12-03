describe MML::Lifestyle do
  let(:lifestyle) {MML::Lifestyle.new(occupation: 'physician', tobacco: 'never', alcohol: 'social', other: 'no constipation')}

  it 'is an instance of MML::Lifestyle' do
    expect(lifestyle).to be_an_instance_of MML::Lifestyle
  end

  it 'occupation should be assigned properly' do
    expect(lifestyle.occupation).to eq 'physician'
  end

  it 'occupation is mandatory' do
    expect{lifestyle.occupation = nil}.to raise_error ArgumentError
  end

  it 'tobacco should be assigned properly' do
    expect(lifestyle.tobacco).to eq 'never'
  end

  it 'tobacco is mandatory' do
    expect{lifestyle.tobacco = nil}.to raise_error ArgumentError
  end

  it 'alcohol should be assigned properly' do
    expect(lifestyle.alcohol).to eq 'social'
  end

  it 'alcohol is mandatory' do
    expect{lifestyle.alcohol=nil}.to raise_error ArgumentError
  end

  it 'other should be assigned properly' do
    expect(lifestyle.other).to eq 'no constipation'
  end

  it 'other is optional' do
    expect{lifestyle.other=nil}.not_to raise_error
  end
end
