describe MML::RegisteredDiagnosis do
  let(:dx_item1) {MML::DxItem.new(name: 'carcinoid', code: 'C189.1', system: 'ICD10r')}
  let(:dx_item2) {MML::DxItem.new(name: 'colon')}
  let(:category1) {MML::DiagnosticCategory.new(value: 'mainDiagnosis', tableId: 'MML0012')}
  let(:category2) {MML::DiagnosticCategory.new(value: 'academicDiagnosis', tableId: 'MML0013')}
  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'colon carcinoid', code: 'C189', system: 'ICD10', diagnosisContents: [dx_item1, dx_item2], categories: [category1, category2], startDate: '2013-10-01', endDate: '2018-03-31', outcome: 'fullyRecovered', firstEncounterDate: '2013-04-01', relatedHealthInsurance: '0aae5960-667c-11d3-9751-00105a6792e8')}

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

  context 'diangosisContents should be assigned properly' do
    it 'the 1st DxItem name is cartinoid' do
      expect(registered_diagnosis.diagnosisContents[0].name).to eq 'carcinoid'
    end

    it 'the 2nd DxItem name is colon' do
      expect(registered_diagnosis.diagnosisContents[1].name).to eq 'colon'
    end
  end

  context 'category should be assigned properly' do
    it '1st category is mainDiagnosis' do
      expect(registered_diagnosis.categories[0].value).to eq 'mainDiagnosis'
    end

    it '2nd category tableId is MML0013' do
      expect(registered_diagnosis.categories[1].tableId).to eq 'MML0013'
    end
  end

  it 'startDate should be asigned properly' do
    expect(registered_diagnosis.startDate).to eq '2013-10-01'
  end

  it 'startDate is optional' do
    expect{registered_diagnosis.startDate = nil}.not_to raise_error
  end

  it 'endDate should be assigned properly' do
    expect(registered_diagnosis.endDate).to eq '2018-03-31'
  end

  it 'endDate is optional' do
    expect{registered_diagnosis.endDate = nil}.not_to raise_error
  end

  it 'outcome should be assigned properly' do
    expect(registered_diagnosis.outcome).to eq 'fullyRecovered'
  end

  it 'outcome is optional' do
    expect{registered_diagnosis.outcome = nil}.not_to raise_error
  end

  it 'firstEncounterDate' do
    expect(registered_diagnosis.firstEncounterDate).to eq '2013-04-01'
  end

  it 'firstEncounterDate is optional' do
    expect{registered_diagnosis.firstEncounterDate = nil}.not_to raise_error
  end

  it 'relatedHealthInsurance should be assigned properly' do
    expect(registered_diagnosis.relatedHealthInsurance).to eq '0aae5960-667c-11d3-9751-00105a6792e8'
  end

  it 'relatedHealthInsurance is optional' do
    expect{registered_diagnosis.relatedHealthInsurance=nil}.not_to raise_error
  end

  describe '#to_xml' do
    subject {registered_diagnosis.to_xml}

    it {should match '<mmlRd:RegisteredDiagnosisModule>'}
    it {should match '<mmlRd:diagnosis'}
    it {should match 'mmlRd:code="C189"'}
    it {should match 'mmlRd:system="ICD10"'}
    it {should match '>colon carcinoid</mmlRd:diagnosis>'}
    it {should match '<mmlRd:diagnosisContens>'}
    it {should match '<mmlRd:dxItem>'}
    it {should match '<mmlRd:name'}
    it {should match 'mmlRd:code="C189.1"'}
    it {should match 'mmlRd:system="ICD10r'}
    it {should match '>carcinoid</mmlRd:name>'}
    it {should match '</mmlRd:dxItem>'}
    it {should match '<mmlRd:dxItem><mmlRd:name>colon</mmlRd:name></mmlRd:dxItem>'}
    it {should match '</mmlRd:diagnosisContens>'}
    it {should match '<mmlRd:categories>'}
    it {should match '<mmlRd:category mmlRd:tableId="MML0012">mainDiagnosis</mmlRd:category>'}
    it {should match '<mmlRd:category mmlRd:tableId="MML0013">academicDiagnosis</mmlRd:category>'}
    it {should match '</mmlRd:categories>'}
    it {should match '<mmlRd:startDate>2013-10-01</mmlRd:startDate>'}
    it {should match '<mmlRd:endDate>2018-03-31</mmlRd:endDate>'}
    it {should match '<mmlRd:outcome>fullyRecovered</mmlRd:outcome>'}
    it {should match '<mmlRd:firstEncounterDate>2013-04-01</mmlRd:firstEncounterDate>'}
    it {should match '<mmlRd:relatedHealthInsurance mmlRd:uid="0aae5960-667c-11d3-9751-00105a6792e8"/>'}
    it {should match '</mmlRd:RegisteredDiagnosisModule>'}
  end
end
