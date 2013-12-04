describe MML::InfectionItem do
  let(:infection_item) {MML::InfectionItem.new(factor: 'Influenza', examValue: 'A+B-', identifiedDate: '2013-12-03', memo: 'drug resistance(-)')}

  it 'is an instance of MML::InfectionItem' do
    expect(infection_item).to be_an_instance_of MML::InfectionItem
  end

  it 'factor should be assigned properly' do
    expect(infection_item.factor).to eq 'Influenza'
  end

  it 'factor is mandatory' do
    expect {infection_item.factor = nil}.to raise_error ArgumentError
  end

  it 'examValue should be assigned properly' do
    expect(infection_item.examValue).to eq 'A+B-'
  end

  it 'examValue is mandatory' do
    expect {infection_item.examValue = nil}.to raise_error ArgumentError
  end

  it 'identifiedDate should be assigned properly' do
    expect(infection_item.identifiedDate).to eq '2013-12-03'
  end

  it 'identifiedDate is optional' do
    expect {infection_item.identifiedDate = nil}.not_to raise_error
  end

  it 'memo should be assigned properly' do
    expect(infection_item.memo).to eq 'drug resistance(-)'
  end

  it 'memo is optional' do
    expect {infection_item.memo = nil}.not_to raise_error
  end
end
