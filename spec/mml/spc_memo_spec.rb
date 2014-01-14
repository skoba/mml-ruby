describe MML::SpcMemo do
  let(:spcmemo) {MML::SpcMemo.new(value: 'chylous', smCodeName: 'serum status', smCode: '00060', smCodeId: 'LOCAL0006')}

  it 'is an instance of MML::SpcMemo' do
    expect(spcmemo).to be_an_instance_of MML::SpcMemo
  end

  it 'value should be assigned properly' do
    expect(spcmemo.value).to eq 'chylous'
  end

  it 'value is mandatory' do
    expect {spcmemo.value = nil}.to raise_error ArgumentError
  end

  it 'smCodeName should be assigned properly' do
    expect(spcmemo.smCodeName).to eq 'serum status'
  end

  it 'smCodeName is optional' do
    expect {spcmemo.smCodeName = nil}.not_to raise_error
  end

  it 'smCode should be assigned properly' do
    expect(spcmemo.smCode).to eq '00060'
  end

  it 'smCode is optional' do
    expect {spcmemo.smCode = nil}.not_to raise_error
  end

  it 'smCodeId should be assigned properly' do
    expect(spcmemo.smCodeId).to eq 'LOCAL0006'
  end

  it 'smCodeId is optional' do
    expect {spcmemo.smCodeId = nil}.not_to raise_error
  end
end
