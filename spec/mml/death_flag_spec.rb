describe MML::Death do
  let(:death) {MML::Death.new(flag: true, date: '2013-11-21')}

  it 'flag should be assigned properly' do
    expect(death.flag).to be true
  end

  it 'date should be assigned properly' do
    expect(death.date).to eq '2013-11-21'
  end
end
