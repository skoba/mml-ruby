describe MML::VaccinationItem do
  let(:vaccination_item) {MML::VaccinationItem.new}

  it 'vaccination_item should be an instance of MML::VaccinationItem' do
    expect(vaccination_item).to be_an_instance_of MML::VaccinationItem
  end
end
