describe MML::FamilyHistoryItem do
  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'gastric cancer', code: 'C169-.007', system: 'ICD10', endDate: '1989-08-25', outcome: 'died')}
  let(:family_history_item) {MML::FamilyHistoryItem.new(relation: 'motherInLaw', registeredDiagnosis: registered_diagnosis, age: 'P40Y', memo: 'scirrhous type')}

  it 'is an instance of MML::FamilyHistoryItem' do
    expect(family_history_item).to be_an_instance_of MML::FamilyHistoryItem
  end

  it 'relation should be assigned properly' do
    expect(family_history_item.relation).to eq 'motherInLaw'
  end

  it 'relation is mandatory' do
    expect {family_history_item.relation = nil}.to raise_error ArgumentError
  end

  it 'regsiteredDiagnosis should be assigned properly' do
    expect(family_history_item.registeredDiagnosis.diagnosis).to eq 'gastric cancer'
  end

  it 'registeredDiagnosis is mandatory' do
    expect {family_history_item.registeredDiagnosis = nil}.to raise_error ArgumentError
  end

  it 'age should be assigned properly' do
    expect(family_history_item.age).to eq 'P40Y'
  end

  it 'age is optional' do
    expect {family_history_item.age = nil}.not_to raise_error
  end

  it 'memo should be assigned properly' do
    expect(family_history_item.memo).to eq 'scirrhous type'
  end
end
