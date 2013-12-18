describe MML::InpatientItem do
  let(:inpatient_item) {MML::InpatientItem.new}

  it 'is an instance of MML::InpatientItem' do
    expect(inpatient_item).to be_an_instance_of MML::InpatientItem
  end
end
