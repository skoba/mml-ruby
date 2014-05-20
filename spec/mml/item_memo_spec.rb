describe MML::ItemMemo do
  let(:item_memo) {MML::ItemMemo.new(value: 'coagulated', imCodeName: 'status', imCode: '003', imCodeId: 'LOCAL004')}

  it 'is an instance of MML::ItemMemo' do
    expect(item_memo).to be_an_instance_of MML::ItemMemo
  end

  it 'value is coagulated' do
    expect(item_memo.value).to eq 'coagulated'
  end

  it 'value is mandatory' do
    expect {item_memo.value = nil}.to raise_error ArgumentError
  end

  it 'imCodeName is status' do
    expect(item_memo.imCodeName).to eq 'status'
  end

  it 'imCodeName is optional' do
    expect {item_memo.imCodeName}.not_to raise_error
  end

  it 'imCode is 003' do
    expect(item_memo.imCode).to eq '003'
  end

  it 'imCode is optional' do
    expect {item_memo.imCode = nil}.not_to raise_error
  end

  it 'imCodeId is LOCAL004' do
    expect(item_memo.imCodeId).to eq 'LOCAL004'
  end

  it 'imCodeId is optional' do
    expect {item_memo.imCodeId = nil}.not_to raise_error
  end
end
