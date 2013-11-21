describe MML::PatientInfo do
  let(:patient_info) { MML::PatientInfo.new }

  it 'should be an instance of MML::PatientInfo' do
    expect(patient_info).to be_an_instance_of MML::PatientInfo
  end
end
