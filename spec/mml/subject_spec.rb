describe MML::Subjective do
  let(:subjective_item) {MML::SubjectiveItem.new(timeExpression: '5 years ago', eventExpression: ['headache'])}
  let(:subjective) {MML::Subjective.new(freeNotes: 'headache from 5 years ago', subjectiveItem: [subjective_item])}

  it 'is an instance of MML::Subjective' do
    expect(subjective).to be_an_instance_of MML::Subjective
  end

  it 'freeNotes should be assigned properly' do
    expect(subjective.freeNotes).to eq 'headache from 5 years ago'
  end

  it 'subjectiveItem should be assigned properly' do
    expect(subjective.subjectiveItem[0].timeExpression).to eq '5 years ago'
  end
end
