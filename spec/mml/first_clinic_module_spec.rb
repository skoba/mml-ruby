describe MML::FirstClinic do
  let(:registered_diagnosis) {MML::RegisteredDiagnosis.new(diagnosis: 'gastric cancer', code: 'C169-.007', system: 'ICD10', endDate: '1989-08-25', outcome: 'died')}
  let(:family_history_item) {MML::FamilyHistoryItem.new(relation: 'motherInLaw', registeredDiagnosis: registered_diagnosis, age: 'P40Y', memo: 'scirrhous type')}
  let(:id) { MML::Id.new(value: '12345', type: 'facility', tableId: 'MML0024', checkDigit: 5, checkDigitSchema: 'MML0001') }
  let(:name) { MML::FacilityName.new(value: 'New Millenium Medical College Hospital', repCode: 'A', tableId: 'MML0025') }
  let(:facility) { MML::Facility.new(name: [name], id: id) }
  let(:birth_info) {MML::BirthInfo.new(facility: facility, deliveryWeeks: 'P38W', deliveryMethod: 'cesarean section', bodyWeight: 3370, bodyWeightUnit: 'g', bodyHeight: 50, bodyHeightUnit: 'cm', chestCircumference: 31.1, chestCircumferenceUnit: 'cm', headCircumference: 32.8, headCircumferenceUnit: 'cm', memo: 'intact')}
  let(:past_history_item) {MML::PastHistoryItem.new(timeExpression: '6 years old', eventExpression: ['appendectomy'])}
  let(:first_clinic) {MML::FirstClinic.new(familyHistory: [family_history_item], birthInfo: birth_info)}

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
end
