describe MML::PastHistory do
  let(:past_history) {MML::PastHistory.new(freeNote: 'Appendectomy (6 years old), hypertension (5 years ago)')}

  it 'is an instance of MML::PastHistory' do
    expect(past_history).to be_an_instance_of MML::PastHistory
  end

  it 'freeNote shuld be assigned properly' do
    expect(past_history.freeNote).to eq 'Appendectomy (6 years old), hypertension (5 years ago)'
  end
end
