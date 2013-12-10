describe MML::ProgressCourse do
  let(:subjective_item) {MML::SubjectiveItem.new(timeExpression: '5 years ago', eventExpression: ['headache'])}
  let(:subjective) {MML::Subjective.new(freeNotes: 'headache from 5 years ago', subjectiveItem: [subjective_item])}
  let(:phys_extref) {MML::ExtRef.new(href: 'snd://localhost/chest.wav')}
  let(:physical_exam_item) {MML::PhysicalExamItem.new(title: 'Chest auscultation', result: 'Respiratory sounds vesicular', interpretation: 'no rale', referenceInfo: [phys_extref])}
  let(:test_extref) {MML::ExtRef.new(href: 'http://record.net/result')}
  let(:test_result) {MML::ValueWithLink.new(value: 'WBC 9000/microl', link: [test_extref] )}
  let(:rx_extref) { MML::ExtRef.new(href: 'http://druginfo/recipie')}
  let(:rx_record) {MML::ValueWithLink.new(value: 'Ampcilin 1200mg/day', link: [rx_extref])}
  let(:tx_extref) {MML::ExtRef.new(href: 'http://treatment/fig1')}
  let(:tx_record) {MML::ValueWithLink.new(value: 'antibiotics, p.o.', link: [tx_extref])}
  let(:objective) {MML::Objective.new(objectiveNotes: 'looks pale', physicalExam: [physical_exam_item], testResult: test_result, rxRecord: rx_record, txRecord: tx_record)}
  let(:assessmentItem) {'Acute bronchitis'}
  let(:test_ref) {MML::ExtRef.new(href: 'http://testserer/laborder')}
  let(:test_order) {MML::ValueWithLink.new(value: 'Full Blood Count', link: [test_ref])}
  let(:rx_ref) {MML::ExtRef.new(href: 'http://rxorder/injection')}
  let(:rx_order) {MML::ValueWithLink.new(value:'Rp1. Ampicilin 3.0g div', link: [rx_ref])}
  let(:tx_ref) {MML::ExtRef.new(href: 'http://txorder/care')}
  let(:tx_order) {MML::ValueWithLink.new(value: 'cooling', link: [tx_ref])}
  let(:plan) {MML::Plan.new(testOrder: test_order, rxOrder: rx_order, txOrder: tx_order, planNotes: 'Antibiotics administration')}
  let(:problem_item) {MML::ProblemItem.new(problem: 'headache', dxUid: '0012-3330-abdc', subjective: subjective, objective: objective, assessment: [assessmentItem], plan: plan)}
  let(:extref) {MML::ExtRef.new(href: 'ehr://1023.4355.922/head/value')}
  let(:progress_course) {MML::ProgressCourse.new(freeExpression: '12/10 consciousness clear', extRef: [extref])}

  it 'is an instance of MML::ProgressCourse' do
    expect(progress_course).to be_an_instance_of MML::ProgressCourse
  end

  it 'freeExpression should be assigned properly' do
    expect(progress_course.freeExpression).to eq '12/10 consciousness clear'
  end

  it 'extref should be assigned properly' do
    expect(progress_course.extRef[0].href).to eq 'ehr://1023.4355.922/head/value'
  end
  
end
