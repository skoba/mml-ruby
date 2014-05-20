describe MML::NumValue do
  let(:num_value) { MML::NumValue.new(value: 6000, up: 9000, low: 3000, normal: 'WNL', out: 'N') }

  it 'is an instance of MML::NumValue' do
    expect(num_value).to be_an_instance_of MML::NumValue
  end

  it 'NumValue has a value' do
    expect(num_value.value).to eq 6000
  end

  it 'value is mandatory' do
    expect {num_value.value = nil}.to raise_error ArgumentError
  end
  it 'up is 9000' do
    expect(num_value.up).to eq 9000
  end

  it 'up is optional' do
    expect {num_value.up = nil}.not_to raise_error
  end

  it 'low is 3000' do
    expect(num_value.low).to eq 3000
  end

  it 'low is optional' do
    expect {num_value.low = nil}.not_to raise_error
  end

  it 'normal string value is WNL' do
    expect(num_value.normal).to eq 'WNL'
  end

  it 'normal string is optional' do
    expect {num_value.normal = nil}.not_to raise_error
  end

  it 'out shows flags' do
    expect(num_value.out).to eq 'N'
  end
end
