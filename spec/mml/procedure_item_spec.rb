describe MML::ProcedureItem do
  let(:operation_element_item) {MML::OperationElementItem.new(title: 'coronary artery bipass grafting', code: 'K552', system: 'MHLW')}
  let(:procedure_item) {MML::ProcedureItem.new(operation: 'right lobectomy', code: 'K511', system: 'MHLW', operationElement: [operation_element_item], procedureMemo: 'off pump')}

  it 'is an instance of MML::ProcedureItem' do
    expect(procedure_item).to be_an_instance_of MML::ProcedureItem
  end

  it 'operation should be assigned properly' do
    expect(procedure_item.operation).to eq 'right lobectomy'
  end

  it 'code should be assigned properly' do
    expect(procedure_item.code).to eq 'K511'
  end

  it 'code is optional' do
    expect {procedure_item.code = nil}.not_to raise_error
  end

  it 'system should be assigned properly' do
    expect(procedure_item.system).to eq 'MHLW'
  end

  it 'system is optional' do
    expect {procedure_item.system = nil}.not_to raise_error
  end

  it 'operationElement should be assigned properly' do
    expect(procedure_item.operationElement[0].title).to eq 'coronary artery bipass grafting'
  end

  it 'operationElement is optional' do
    expect {procedure_item.operationElement = nil}.not_to raise_error
  end

  it 'procedureMemo should be assigned properly' do
    expect(procedure_item.procedureMemo).to eq 'off pump'
  end

  it 'procedureMemo is optional' do
    expect {procedure_item.procedureMemo = nil}.not_to raise_error
  end
end
