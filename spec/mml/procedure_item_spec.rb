describe MML::ProcedureItem do
  let(:procedure_item) {MML::ProcedureItem.new(operation: 'right lobectomy', code: 'K511', system: 'MHLW')}

  it 'is an instance of MML::ProcedureItem' do
    expect(procedure_item).to be_an_instance_of MML::ProcedureItem
  end

  it 'operation should be assigned properly' do
    expect(procedure_item.operation).to eq 'lobectomy'
  end

  it 'code should be assigned properly' do
    expect(procedure_item.code).to eq 'K511'
  end

  it 'system should be assigned properly' do
    expect(procedure_item.system).to eq 'MHLW'
  end
end
