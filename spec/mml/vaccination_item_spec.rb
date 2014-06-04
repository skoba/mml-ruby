describe MML::VaccinationItem do
  let(:vaccination_item) {MML::VaccinationItem.new(vaccine: 'polio', injected: true, age: 'P6M', memo: 'first administration')}

  it 'vaccination_item should be an instance of MML::VaccinationItem' do
    expect(vaccination_item).to be_an_instance_of MML::VaccinationItem
  end

  it 'vaccine should be assigned properly' do
    expect(vaccination_item.vaccine).to eq 'polio'
  end

  it 'vaccination is mandatory' do
    expect {vaccination_item.vaccine = nil}.to raise_error ArgumentError
  end
  it 'injected should be assigned properly' do
    expect(vaccination_item.injected).to be true
  end

  it 'injected is mandatory' do
    expect {vaccination_item.injected = nil}.to raise_error ArgumentError
  end

  it 'age should be assigned properly' do
    expect(vaccination_item.age).to eq 'P6M'
  end

  it 'age is optional' do
    expect {vaccination_item.age = nil}.not_to raise_error
  end

  it 'memo should be assigned properly' do
    expect(vaccination_item.memo).to eq 'first administration'
  end

  it 'memo is optional' do
    expect {vaccination_item.memo = nil}.not_to raise_error
  end
end
