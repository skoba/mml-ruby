describe MML::Surgery do
  let(:surgery) {MML::Surgery.new}

  it 'is an instance of MML::Surgery' do
    expect(surgery).to be_an_instance_of MML::Surgery
  end

  it 'has more than 1 surgical item'
end
