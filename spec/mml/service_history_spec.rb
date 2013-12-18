describe MML::ServiceHistory do
  let(:service_history) {MML::ServiceHistory.new(start: '2013-08-25', end: '2013-08-31')}

  it 'is an instance of MML::ServiceHistory' do
    expect(service_history).to be_an_instance_of MML::ServiceHistory
  end

  it 'start is assigned properly' do
    expect(service_history.start).to eq '2013-08-25'
  end

  it 'end is assigned properly' do
    expect(service_history.end).to eq '2013-08-31'
  end
end
