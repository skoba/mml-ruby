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
  let(:progress_course) {MML::ProgressCourse.new(freeExpression: '12/10 consciousness clear', extRef: [extref], structuredExpression: [problem_item])}

  it 'is an instance of MML::ProgressCourse' do
    expect(progress_course).to be_an_instance_of MML::ProgressCourse
  end

  it 'freeExpression should be assigned properly' do
    expect(progress_course.freeExpression).to eq '12/10 consciousness clear'
  end

  it 'extref should be assigned properly' do
    expect(progress_course.extRef[0].href).to eq 'ehr://1023.4355.922/head/value'
  end

  it 'problem_item should be assigned to stracturedExpression' do
    expect(progress_course.structuredExpression[0].problem).to eq 'headache'
  end

  describe '#to_xml' do
    subject {progress_course.to_xml}

    it {should match '<mmlPc:ProgressCourseModule>'}
    it {should match '<mmlPc:FreeExpression>12/10 consciousness clear<mmlCm:extRef mmlCm:href="ehr://1023.4355.922/head/value"/></mmlPc:FreeExpression>'}
    it {should match '<mmlPc:structuredExpression>'}
    it {should match '<mmlPc:problemItem>'}
    it {should match '<mmlPc:problem mmlPc:dxUid="0012-3330-abdc">headache</mmlPc:problem>'}
    it {should match '<mmlPc:subjective><mmlPc:freeNotes>headache from 5 years ago</mmlPc:freeNotes>'}
    it {should match '<mmlPc:subjectiveItem><mmlPc:timeExpression>5 years ago</mmlPc:timeExpression>'}
    it {should match '<mmlPc:eventExpression>headache</mmlPc:eventExpression></mmlPc:subjectiveItem></mmlPc:subjective>'}
    it {should match '<mmlPc:objective>'}
    it {should match '<mmlPc:objectiveNotes>looks pale</mmlPc:objectiveNotes>'}
    it {should match '<mmlPc:physicalExam>'}
    it {should match '<mmlPc:physicalExamItem>'}
    it {should match '<mmlPc:title>Chest auscultation</mmlPc:title>'}
    it {should match '<mmlPc:result>Respiratory sounds vesicular</mmlPc:result>'}
    it {should match '<mmlPc:referenceInfo><mmlCm:extRef mmlCm:href="snd://localhost/chest.wav"/></mmlPc:referenceInfo>'}
    it {should match '<mmlPc:interpretation>no rale</mmlPc:interpretation>'}
    it {should match '</mmlPc:physicalExamItem>'}
    it {should match '</mmlPc:physicalExam>'}
    it {should match '<mmlPc:testResult>WBC 9000/microl<mmlCm:extRef mmlCm:href="http://record.net/result"/></mmlPc:testResult>'}
    it {should match '<mmlPc:rxRecord>Ampcilin 1200mg/day<mmlCm:extRef mmlCm:href="http://druginfo/recipie"/></mmlPc:rxRecord>'}
    it {should match '<mmlPc:txRecord>antibiotics, p.o.<mmlCm:extRef mmlCm:href="http://treatment/fig1"/></mmlPc:txRecord>'}
    it {should match '</mmlPc:objective>'}
    it {should match '<mmlPc:assessment>'}
    it {should match '<mmlPc:assessmentItem>Acute bronchitis</mmlPc:assessmentItem>'}
    it {should match '</mmlPc:assessment>'}
    it {should match '<mmlPc:plan>'}
    it {should match '<mmlPc:testOrder>Full Blood Count<mmlCm:extRef mmlCm:href="http://testserer/laborder"/></mmlPc:testOrder>'}
    it {should match '<mmlPc:rxOrder>Rp1. Ampicilin 3.0g div<mmlCm:extRef mmlCm:href="http://rxorder/injection"/></mmlPc:rxOrder>'}
    it {should match '<mmlPc:txOrder>cooling<mmlCm:extRef mmlCm:href="http://txorder/care"/></mmlPc:txOrder>'}
    it {should match '<mmlPc:planNotes>Antibiotics administration</mmlPc:planNotes>'}
    it {should match '</mmlPc:plan>'}
    it {should match '</mmlPc:problemItem>'}
    it {should match '</mmlPc:structuredExpression>'}
    it {should match '</mmlPc:ProgressCourseModule>'}
  end
end
