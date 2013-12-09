describe MML::PastHistory do
  let(:past_history_item1) {MML::PastHistoryItem.new(timeExpression: '6 years old', eventExpression: ['appendectomy'])}
  let(:past_history_item2) {MML::PastHistoryItem.new(timeExpression: '5 years ago', eventExpression: ['hypertension'])}
  let(:past_history) {MML::PastHistory.new(freeNote: 'Appendectomy (6 years old), hypertension (5 years ago)', pastHistoryItem: [past_history_item1, past_history_item2])}

  it 'is an instance of MML::PastHistory' do
    expect(past_history).to be_an_instance_of MML::PastHistory
  end

  it 'freeNote shuld be assigned properly' do
    expect(past_history.freeNote).to eq 'Appendectomy (6 years old), hypertension (5 years ago)'
  end

  it 'pastHistoryItem should be assigned properly' do
    expect(past_history.pastHistoryItem.size).to eq 2
  end
end
