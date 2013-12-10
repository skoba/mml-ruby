describe MML::SubjectiveItem do
  let(:subjective_item) {MML::SubjectiveItem.new(timeExpression: '5 years ago', eventExpression: ['headache'])}

  it 'is an instance of MML::SubjectiveItem' do
    expect(subjective_item).to be_an_instance_of MML::SubjectiveItem
  end

  it 'timeExpression should be assigned properly' do
    expect(subjective_item.timeExpression).to eq '5 years ago'
  end

  it 'timeExpression is mandatory' do
    expect {subjective_item.timeExpression = nil}.to raise_error ArgumentError
  end

  it 'eventExpression should be assigned properly' do
    expect(subjective_item.eventExpression).to eq ['headache']
  end

  it 'eventExpression is mandatory' do
    expect {subjective_item.timeExpression = nil}.to raise_error ArgumentError
  end
end
