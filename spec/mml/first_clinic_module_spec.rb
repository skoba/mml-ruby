describe MML::FirstClinic do
  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'gastric cancer', code: 'C169-.007', system: 'ICD10', endDate: '1989-08-25', outcome: 'died')}
  let(:family_history_item) {MML::FamilyHistoryItem.new(relation: 'motherInLaw', registeredDiagnosis: registered_diagnosis, age: 'P40Y', memo: 'scirrhous type')}
  let(:id) { MML::Id.new(value: '12345', type: 'facility', tableId: 'MML0024', checkDigit: 5, checkDigitSchema: 'MML0001') }
  let(:name) { MML::FacilityName.new(value: 'New Millenium Medical College Hospital', repCode: 'A', tableId: 'MML0025') }
  let(:facility) { MML::Facility.new(name: [name], id: id) }
  let(:birth_info) {MML::BirthInfo.new(facility: facility, deliveryWeeks: 'P38W', deliveryMethod: 'cesarean section', bodyWeight: 3370, bodyWeightUnit: 'g', bodyHeight: 50, bodyHeightUnit: 'cm', chestCircumference: 31.1, chestCircumferenceUnit: 'cm', headCircumference: 32.8, headCircumferenceUnit: 'cm', memo: 'intact')}
  let(:vaccination_item1) {MML::VaccinationItem.new(vaccine: 'polio', injected: true, age: 'P6M', memo: 'first administration')}
  let(:vaccination_item2) {MML::VaccinationItem.new(vaccine: 'flu', injected: false, age: 'P1M', memo: 'second administration')}
  let(:past_history_item1) {MML::PastHistoryItem.new(timeExpression: '6 years old', eventExpression: ['appendectomy'])}
  let(:past_history_item2) {MML::PastHistoryItem.new(timeExpression: '5 years ago', eventExpression: ['hypertension'])}
  let(:past_history) {MML::PastHistory.new(freeNote: 'Appendectomy (6 years old), hypertension (5 years ago)', pastHistoryItem: [past_history_item1, past_history_item2])}
  let(:first_clinic) {MML::FirstClinic.new(familyHistory: [family_history_item], birthInfo: birth_info, vaccination: [vaccination_item1, vaccination_item2],pastHistory: past_history, chiefComplaints: 'fever', presentIllnessNotes: 'fever up from 2 days ago, nasal discharge from 1day ago, sore throat, today.')}

  it 'is an instance of MML::FirstClinc' do
    expect(first_clinic).to be_an_instance_of MML::FirstClinic
  end

  it 'familyHistory should be recorded properly' do
    expect(first_clinic.familyHistory[0].registeredDiagnosis.code).to eq 'C169-.007'
  end

  it 'familyHistory is optional' do
    expect {first_clinic.familyHistory = nil}.not_to raise_error
  end

  it 'birthInfo should be assigned properly' do
    expect(first_clinic.birthInfo.bodyWeight).to eq 3370
  end

  it 'birthInfo is optional' do
    expect {first_clinic.birthInfo = nil}.not_to raise_error
  end

  it 'vaccination should be assigned properly' do
    expect(first_clinic.vaccination[1].vaccine).to eq 'flu'
  end

  it 'vaccination is optional' do
    expect {first_clinic.vaccination = nil}.not_to raise_error
  end

  it 'pastHistory should be assigned properly' do
    expect(first_clinic.pastHistory.freeNote).to eq 'Appendectomy (6 years old), hypertension (5 years ago)'
  end

  it 'pastHistory is optional' do
    expect {first_clinic.pastHistory = nil}.not_to raise_error
  end

  it 'chiefComplaints should be assigned properly' do
    expect(first_clinic.chiefComplaints).to eq 'fever'
  end

  it 'chiefComplaints is optional' do
    expect {first_clinic.chiefComplaints = nil}.not_to raise_error
  end

  it 'presentIllnessNotes should be assigned properly' do
    expect(first_clinic.presentIllnessNotes).to eq 'fever up from 2 days ago, nasal discharge from 1day ago, sore throat, today.'
  end

  it 'presentIllnessNotes is optional' do
    expect {first_clinic.presentIllnessNotes = nil}.not_to raise_error
  end

  describe '#to_xml' do
    subject {first_clinic.to_xml}

    it {should match '<mmlFcl:FirstClinicModule>'}
    it {should match '<mmlFcl:familyHistory>'}
    it {should match '<mmlFcl:familyHistoryItem>'}
    it {should match '<mmlFcl:relation>motherInLaw</mmlFcl:relation>'}
    it {should match '<mmlRd:RegisteredDiagnosisModule>'}
    it {should match '>gastric cancer</mmlRd:diagnosis>'}
    it {should match '</mmlRd:RegisteredDiagnosisModule>'}
    it {should match '<mmlFcl:age>P40Y</mmlFcl:age>'}
    it {should match '<mmlFcl:memo>scirrhous type</mmlFcl:memo>'}
    it {should match '</mmlFcl:familyHistoryItem>'}
    it {should match '</mmlFcl:familyHistory>'}
    it {should match '<mmlFcl:childhood><mmlFcl:birthInfo>'}
    it {should match '<mmlFc:Facility'}
    it {should match '>New Millenium Medical College Hospital</mmlFc:name>'}
    it {should match '</mmlFc:Facility>'}
    it {should match '<mmlFcl:deliveryWeeks>P38W</mmlFcl:deliveryWeeks>'}
    it {should match '<mmlFcl:deliveryMethod>cesarean section</mmlFcl:deliveryMethod>'}
    it {should match '<mmlFcl:bodyWeight mmlFcl:unit="g">3370</mmlFcl:bodyWeight>'}
    it {should match '<mmlFcl:bodyHeight mmlFcl:unit="cm">50</mmlFcl:bodyHeight>'}
    it {should match '<mmlFcl:chestCircumference mmlFcl:unit="cm">31.1</mmlFcl:chestCircumference>'}
    it {should match '<mmlFcl:headCircumference mmlFcl:unit="cm">32.8</mmlFcl:headCircumference>'}
    it {should match '<mmlFcl:memo>intact</mmlFcl:memo>'}
    it {should match '</mmlFcl:birthInfo><mmlFcl:vaccination>'}
    it {should match '<mmlFcl:vaccinationItem><mmlFcl:vaccine>polio</mmlFcl:vaccine><mmlFcl:injected>true</mmlFcl:injected><mmlFcl:age>P6M</mmlFcl:age><mmlFcl:memo>first administration</mmlFcl:memo></mmlFcl:vaccinationItem>'}
    it {should match '<mmlFcl:vaccinationItem><mmlFcl:vaccine>flu</mmlFcl:vaccine><mmlFcl:injected>false</mmlFcl:injected><mmlFcl:age>P1M</mmlFcl:age><mmlFcl:memo>second administration</mmlFcl:memo></mmlFcl:vaccinationItem>'}
    it {should match '</mmlFcl:vaccination></mmlFcl:childhood>'}
    it {should match '<mmlFcl:pastHistory>'}
    it {should match '<mmlFcl:freeNote>Appendectomy \(6 years old\), hypertension \(5 years ago\)</mmlFcl:freeNote>'}
    it {should match '<mmlFcl:pastHistoryItem><mmlFcl:timeExpression>6 years old</mmlFcl:timeExpression><mmlFcl:eventExpression>appendectomy</mmlFcl:eventExpression>'}
    it {should match '<mmlFcl:pastHistoryItem><mmlFcl:timeExpression>5 years ago</mmlFcl:timeExpression><mmlFcl:eventExpression>hypertension</mmlFcl:eventExpression>'}
    it {should match '</mmlFcl:pastHistory>'}
    it {should match '<mmlFcl:chiefComplaints>fever</mmlFcl:chiefComplaints>'}
    it {should match '<mmlFcl:presentIllnessNotes>fever up from 2 days ago, nasal discharge from 1day ago, sore throat, today.</mmlFcl:presentIllnessNotes>'}
    it {should match '</mmlFcl:FirstClinicModule>'}
  end
end
