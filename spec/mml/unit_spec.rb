describe MML::Unit do
  let(:unit) {MML::Unit.new(value: '/microl', uCode: '537', uCodeId: 'LOCAL003')}

  it 'is an instance of MML::Unit' do
    expect(unit).to be_an_instance_of MML::Unit
  end

  it 'value is /microl' do
    expect(unit.value).to eq '/microl'
  end

  it 'value is mandatory' do
    expect {unit.value = nil}.to raise_error ArgumentError
  end

  it 'uCode is 537' do
    expect(unit.uCode).to eq '537'
  end

  it 'uCode is optional' do
    expect {unit.uCode = nil}.not_to raise_error
  end

  it 'uCodeId is LOCAL003' do
    expect(unit.uCodeId).to eq 'LOCAL003'
  end

  it 'uCodeId is optional' do
    expect {unit.uCodeId = nil}.not_to raise_error
  end
end
