describe MML::RegisteredDiagnosis do
  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new}

  it 'is an instance of MML::RegisteredDiagnosis' do
    expect(registered_diagnosis).to be_an_instance_of MML::RegisteredDiagnosis
  end
end
