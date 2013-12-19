describe MML::Discharge do
  let(:refer_to_id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '55234567')}
  let(:refer_to_name) {MML::Name.new(repCode: 'A', tableId: 'MML0025', family: 'Tanaka', given: 'Fujiko', degree: 'M.D.')}
  let(:refer_to_facility_name) {MML::FacilityName.new(repCode: 'A', tableId: 'MML0025', value: 'New Millenium Heisei Hospital')}
  let(:refer_to_facility_id) {MML::Id.new(type: 'insurance', tableId: 'MML0027', value: '32354678')}
  let(:refer_to_facility) {MML::Facility.new(id: refer_to_facility_id, name: [refer_to_facility_name])}
  let(:refer_to) {MML::PersonalizedInfo.new(id: refer_to_id, personName: [refer_to_name], facility: refer_to_facility)}
  let(:discharge) {MML::Discharge.new(date: '2013-08-31', dischargeCondition: '4 P.O.D, the patient was transferred to the chronic hospital.', outcome: 'transferChronic', referTo: refer_to)}

  it 'is an instance of MML::Discharge' do
    expect(discharge).to be_an_instance_of MML::Discharge
  end

  it 'date should be assigned properly' do
    expect(discharge.date).to eq '2013-08-31'
  end

  it 'dischargeCondition should be assigned properly' do
    expect(discharge.dischargeCondition).to eq '4 P.O.D, the patient was transferred to the chronic hospital.'
  end

  it 'outcome should be assigned properly' do
    expect(discharge.outcome).to eq 'transferChronic'
  end

  it 'referTo should be assigned properly' do
    expect(discharge.referTo.personName[0].family).to eq 'Tanaka'
  end
end
