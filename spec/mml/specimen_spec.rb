describe MML::Specimen do
  let(:specimen) {MML::Specimen.new(specimenName: 'Blood', spCode: '001', spCodeId: 'LOCAL0005')}

  it 'is an instance of MML::Specimen' do
    expect(specimen).to be_an_instance_of MML::Specimen
  end

  it 'specimenName should be assigned properly' do
    expect(specimen.specimenName).to eq 'Blood'
  end

  it 'specimenName is mandatory' do
    expect {specimen.specimenName = nil}.to raise_error ArgumentError
  end
  it 'spCode should be assigned properly' do
    expect(specimen.spCode).to eq '001'
  end

  it 'spCode is mandatory' do
    expect {specimen.spCode = nil}.to raise_error ArgumentError
  end

  it 'spCodeId should be assigned properly' do
    expect(specimen.spCodeId).to eq 'LOCAL0005'
  end

  it 'spCodeId is mandatory' do
    expect {specimen.spCodeId = nil}.to raise_error ArgumentError
  end
end
