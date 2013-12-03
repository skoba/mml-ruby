describe MML::AllergyItem do
  let(:allergy_item) {MML::AllergyItem.new(factor: 'crab', severity: 'mild', identifiedDate: 'since almost 20 years ago', memo: 'no reaction to shrimp')}

  it 'is an instance of MML::AllergyItem' do
    expect(allergy_item).to be_an_instance_of MML::AllergyItem
  end

  it 'factor should be assigned properly' do
    expect(allergy_item.factor).to eq 'crab'
  end

  it 'factor is mandatory' do
    expect {allergy_item.factor = nil}.to raise_error ArgumentError
  end

  it 'severity should be assigned properly' do
    expect(allergy_item.severity).to eq 'mild'
  end

  it 'severity is optional' do
    expect {allergy_item.severity = nil}.not_to raise_error
  end

  it 'identifiedDate should be assigned properly' do
    expect(allergy_item.identifiedDate).to eq 'since almost 20 years ago'
  end

  it 'identifiedDate is optional' do
    expect{allergy_item.identifiedDate = nil}.not_to raise_error
  end

  it 'memo should be assigned properly' do
    expect(allergy_item.memo).to eq 'no reaction to shrimp'
  end
end
