describe MML::DxItem do
  let(:dx_item) {MML::DxItem.new(name: 'atrial fibrilation', code: 'I48', system: 'ICD10')}

  it 'is an instance of MML::DxItem' do
    expect(dx_item).to be_an_instance_of MML::DxItem
  end

  it 'name should be assigned properly' do
    expect(dx_item.name).to eq 'atrial fibrilation'
  end

  it 'code should be assigned properly' do
    expect(dx_item.code).to eq 'I48'
  end

  it 'system should be assigned properly' do
    expect(dx_item.system).to eq 'ICD10'
  end
end
