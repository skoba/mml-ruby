describe MML::OperationElementItem do
  let(:operation_element_item) {MML::OperationElementItem.new(title: 'coronary artery bipass grafting', code: 'K552', system: 'MHLW')}

  it 'is an instance of MML::OperationElementItem' do
    expect(operation_element_item).to be_an_instance_of MML::OperationElementItem
  end

  it 'title should be assigned properly' do
    expect(operation_element_item.title).to eq 'coronary artery bipass grafting'
  end

  it 'title is mandatory' do
    expect {operation_element_item.title = nil}.to raise_error ArgumentError
  end
  
  it 'code should be assgined properly' do
    expect(operation_element_item.code).to eq 'K552'
  end

  it 'code is optional' do
    expect {operation_element_item.code = nil}.not_to raise_error
  end

  it 'system should be assigned properly' do
    expect(operation_element_item.system).to eq 'MHLW'
  end

  it 'system is optional' do
    expect {operation_element_item.system = nil}.not_to raise_error
  end
end
