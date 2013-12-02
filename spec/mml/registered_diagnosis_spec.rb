describe MML::RegisteredDiagnosis do
  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'colon carcinoid', code: 'C189', system: 'ICD10', )}

  it 'is an instance of MML::RegisteredDiagnosis' do
    expect(registered_diagnosis).to be_an_instance_of MML::RegisteredDiagnosis
  end

  it 'diagnosis should be assigned properly' do
    expect(registered_diagnosis.diagnosis).to eq 'colon carcinoid'
  end

  it 'diagnosis is mandatory' do
    expect {registered_diagnosis.diagnosis = nil}.to raise_error ArgumentError
  end

  it 'code should be assigned properly' do
    expect(registered_diagnosis.code).to eq 'C189'
  end

  it 'code is optional' do
    expect{registered_diagnosis.code = nil}.not_to raise_error
  end

  it 'system should be assigned properly' do
    expect(registered_diagnosis.system).to eq 'ICD10'
  end

  it 'system is optional' do
    expect{registered_diagnosis.system = nil}.not_to raise_error
  end
end
