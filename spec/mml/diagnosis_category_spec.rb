describe MML::DiagnosisCategory do
  let(:diagnosis_category) {MML::DiagnosisCategory.new(value: 'mainDiagnosis', tableId: 'MML0012')}

  it 'is an instance of DiagnosisCategory' do
    expect(diagnosis_category).to be_an_instance_of MML::DiagnosisCategory
  end

  it 'value should be assigned properly' do
    expect(diagnosis_category.value).to eq 'mainDiagnosis'
  end

  it 'value is mandatory' do
    expect{diagnosis_category.value = nil}.to raise_error ArgumentError
  end

  it 'tableId should be assigned properly' do
    expect(diagnosis_category.tableId).to eq 'MML0012'
  end

  it 'tableId is mandatory' do
    expect{diagnosis_category.tableId = nil}.to raise_error ArgumentError
  end
end
