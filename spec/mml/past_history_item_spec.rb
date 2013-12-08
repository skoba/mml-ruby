describe MML::PastHistoryItem do
  let(:past_history_item) {MML::PastHistoryItem.new(timeExpression: '6 years old', eventExpression: ['appendectomy'])}

  it 'is an instance of MML::PastHistoryItem' do
    expect(past_history_item).to be_an_instance_of MML::PastHistoryItem
  end

  it 'timeExpression should be assigned properly' do
    expect(past_history_item.timeExpression).to eq '6 years old'
  end

  it 'timeExpression is mandatory' do
    expect {past_history_item.timeExpression = nil}.to raise_error ArgumentError
  end

  it 'eventExpression should be assigned properly' do
    expect(past_history_item.eventExpression).to eq ['appendectomy']
  end

  it 'eventExpression is optional' do
    expect {past_history_item.eventExpression = nil}.not_to raise_error
  end
end
