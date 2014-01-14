describe MML::Specimen do
  let(:specmemo) {MML::SpcMemo.new(value: 'icteric')}
  
  let(:specimen) {MML::Specimen.new(specimenName: 'Blood', spCode: '001', spCodeId: 'LOCAL0005', spcMemo: [specmemo], spcMemoF: 'before breakfast')}

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

  it 'spcMemo should be assigned properly' do
    expect(specimen.spcMemo[0].value).to eq 'icteric'
  end

  it 'spcMemo is optional' do
    expect {specimen.spcMemo = nil}.not_to raise_error
  end

  it 'spcMemoF should be assigned properly' do
    expect(specimen.spcMemoF).to eq 'before breakfast'
  end

  it 'spcMemoF is optional' do
    expect {specimen.spcMemoF = nil}.not_to raise_error
  end
end
