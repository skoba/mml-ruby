describe MML::ProgressCourse do
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
