describe MML::RepMemo do
  let(:repmemo) {MML::RepMemo.new(value: 'confirmed', repCodeName: 'result code', repCode: '00123', repCodeId: 'LOCAL005')}

  it 'should be an instance of MML::RepMemo' do
    expect(repmemo).to be_an_instance_of MML::RepMemo
  end

  it 'value should be assigned properly' do
    expect(repmemo.value).to eq 'confirmed'
  end

  it 'value is mandatory' do
    expect {repmemo.value = nil}.to raise_error ArgumentError
  end

  it 'repCodeName' do
    expect(repmemo.repCodeName).to eq 'result code'
  end

  it 'repCodeName is optional' do
    expect {repmemo.repCodeName = nil}.not_to raise_error
  end

  it 'repCode should be assigned properly' do
    expect(repmemo.repCode).to eq '00123'
  end

  it 'repCode is optional' do
    expect {repmemo.repCode = nil}.not_to raise_error
  end

  it 'repCodeId should be assigned properly' do
    expect(repmemo.repCodeId).to eq 'LOCAL005'
  end

  it 'repCodeId is optional' do
    expect {repmemo.repCodeId = nil}.not_to raise_error
  end
end
