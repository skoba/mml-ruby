describe MML::Objective do
  let(:extref) {MML::ExtRef.new(href: 'snd://localhost/chest.wav')}
  let(:physical_exam_item) {MML::PhysicalExamItem.new(title: 'Chest auscultation', result: 'Respiratory sounds vesicular', interpretation: 'no rale', referenceInfo: [extref])}
  let(:test_extref) {MML::ExtRef.new(href: 'http://record.net/result')}
  let(:test_result) {MML::ValueWithLink.new(value: 'WBC 9000/microl', link: [test_extref] )}
  let(:rx_extref) { MML::ExtRef.new(href: 'http://druginfo/recipie')}
  let(:rx_record) {MML::ValueWithLink.new(value: 'Ampcilin 1200mg/day', link: [rx_extref])}
  let(:tx_extref) {MML::ExtRef.new(href: 'http://treatment/fig1')}
  let(:tx_record) {MML::ValueWithLink.new(value: 'antibiotics, p.o.', link: [tx_extref])}
  let(:objective) {MML::Objective.new(objectiveNotes: 'looks pale', physicalExam: [physical_exam_item], testResult: test_result, rxRecord: rx_record, txRecord: tx_record)}

  it 'is an instance of MML::Objective' do
    expect(objective).to be_an_instance_of MML::Objective
  end

  it 'objectiveNotes should be assigned properly' do
    expect(objective.objectiveNotes).to eq 'looks pale'
  end

  it 'physicalExam should be assigned properly' do
    expect(objective.physicalExam[0].title).to eq 'Chest auscultation'
  end

  it 'physicalExam is optional' do
    expect {objective.physicalExam = nil}.not_to raise_error
  end

  it 'testResult should be assigned properly' do
    expect(objective.testResult.value).to eq 'WBC 9000/microl'
  end

  it 'testResult is optional' do
    expect {objective.testResult = nil}.not_to raise_error
  end

  it 'rxRecord should be assigned properly' do
    expect(objective.rxRecord.link[0].href).to eq 'http://druginfo/recipie'
  end

  it 'rxRecord is optional' do
    expect {objective.rxRecord = nil}.not_to raise_error
  end

  it 'txRexord should be assigned properly' do
    expect(objective.txRecord.value).to eq 'antibiotics, p.o.'
  end

  it 'txRecord is optional' do
    expect {objective.txRecord = nil}.not_to raise_error
  end
end
