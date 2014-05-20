describe MML::ItemName do
  let(:item_name) { MML::ItemName.new(value: 'WBC', itCode: '391', itCodeId: 'KRTKC', acode: '2A010', icode: '7682', scode: '018', mcode: '301', rcode: '01') }

  it 'is an instance of ItemName' do
    expect(item_name).to be_an_instance_of MML::ItemName
  end

  it 'item name is WBC' do
    expect(item_name.value).to eq 'WBC'
  end

  it 'iten name is mandatory' do
    expect {item_name.value = nil}.to raise_error ArgumentError
  end

  it 'itCode is 391' do
    expect(item_name.itCode).to eq '391'
  end

  it 'itCode is mandatory' do
    expect {item_name.itCode = nil}.to raise_error ArgumentError
  end

  it 'itCodeId is KRTKC' do
    expect(item_name.itCodeId).to eq 'KRTKC'
  end

  it 'itCodeId is mandatory' do
    expect {item_name.itCodeId = nil}.to raise_error ArgumentError
  end

  it 'Acode is 2A010' do
    expect(item_name.acode).to eq '2A010'
  end

  it 'Acode is optional' do
    expect {item_name.acode = nil}.not_to raise_error
  end

  it 'Icode is 7682' do
    expect(item_name.icode).to eq '7682'
  end

  it 'Icode is optional' do
    expect {item_name.icode = nil}.not_to raise_error
  end

  it 'Scode is 018' do
    expect(item_name.scode).to eq '018'
  end

  it 'Scode is optional' do
    expect {item_name.scode = nil}.not_to raise_error
  end

  it 'Mcode is 301' do
    expect(item_name.mcode).to eq '301'
  end

  it 'Mcode is optional' do
    expect {item_name.mcode = nil}.not_to raise_error
  end

  it 'Rcode is 01' do
    expect(item_name.rcode).to eq '01'
  end

  it 'Rcode is optional' do
    expect {item_name.rcode = nil}.not_to raise_error
  end
end
