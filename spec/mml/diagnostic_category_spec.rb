describe MML::DiagnosticCategory do
  let(:diagnostic_category) {MML::DiagnosticCategory.new(value: 'mainDiagnosis', tableId: 'MML0012')}

  it 'is an instance of DiagnosticCategory' do
    expect(diagnostic_category).to be_an_instance_of MML::DiagnosticCategory
  end

  it 'value should be assigned properly' do
    expect(diagnostic_category.value).to eq 'mainDiagnosis'
  end

  it 'value is mandatory' do
    expect{diagnostic_category.value = nil}.to raise_error ArgumentError
  end

  it 'tableId should be assigned properly' do
    expect(diagnostic_category.tableId).to eq 'MML0012'
  end

  it 'tableId is mandatory' do
    expect{diagnostic_category.tableId = nil}.to raise_error ArgumentError
  end
end
