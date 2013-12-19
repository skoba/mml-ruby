describe MML::Summary do
  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'left tibial fracture')}
  let(:summary) {MML::Summary.new(registeredDiagnosis: registered_diagnosis)}

  it 'is an instance of MML::Summary' do
    expect(summary).to be_an_instance_of MML::Summary
  end
end
