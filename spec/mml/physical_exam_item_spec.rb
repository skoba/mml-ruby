describe MML::PhysicalExamItem do
  let(:extref) {MML::ExtRef.new(href: 'snd://localhost/chest.wav')}
  let(:physical_item) {MML::PhysicalExamItem.new(title: 'Chest auscultation', result: 'Respiratory sounds vesicular', interpretation: 'no rale', referenceInfo: [extref])}

  it 'is an instance of MML::PhysicalItem' do
    expect(physical_item).to be_an_instance_of MML::PhysicalExamItem
  end

  it 'title should be assigned properly' do
    expect(physical_item.title).to eq 'Chest auscultation'
  end

  it 'title is mandatory' do
    expect {physical_item.title = nil}.to raise_error ArgumentError
  end

  it 'result should be assigned properly' do
    expect(physical_item.result).to eq 'Respiratory sounds vesicular'
  end

  it 'result is mandatory' do
    expect {physical_item.result = nil}.to raise_error ArgumentError
  end

  it 'interpretation should be assigned properly' do
    expect(physical_item.interpretation).to eq 'no rale'
  end

  it 'interpretation is optional' do
    expect {physical_item.interpretation}.not_to raise_error
  end

  it 'referenceInfo should be assigned properly' do
    expect(physical_item.referenceInfo[0].href).to eq 'snd://localhost/chest.wav'
  end

  it 'referenceInfo is optional' do
    expect {physical_item.referenceInfo = nil}.not_to raise_error
  end
end
