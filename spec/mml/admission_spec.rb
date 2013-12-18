describe MML::Admission do
  let(:referer_id) {MML::Id.new(type: 'facility', tableId: 'MML0024', value: '23234567')}
  let(:referer_name) {MML::Name.new(repCode: 'A', tableId: 'MML0025', family: 'Ono', given: 'Yoko', degree: 'M.D.')}
  let(:referer_facility_name) {MML::FacilityName.new(repCode: 'A', tableId: 'MML0025', value: 'New Millenium Medical College Hospital')}
  let(:referer_facility_id) {MML::Id.new(type: 'insurance', tableId: 'MML0027', value: '801.006.3')}
  let(:referer_facility) {MML::Facility.new(id: referer_facility_id, name: [referer_facility_name])}
  let(:referer) {MML::PersonalizedInfo.new(id: referer_id, personName: [referer_name], facility: referer_facility)}
  let(:admission) {MML::Admission.new(date: '2013-12-08', admissionCondition: 'Emergency admission by ambulance', emergency: true, referFrom: referer)}

  it 'is an instance of MML::Admission' do
    expect(admission).to be_an_instance_of MML::Admission
  end

  it 'date should be assigned properly' do
    expect(admission.date).to eq '2013-12-08'
  end

  it 'date is mandatory' do
    expect {admission.date = nil}.to raise_error ArgumentError
  end

  it 'admissionCondition should be assigned properly' do
    expect(admission.admissionCondition).to eq 'Emergency admission by ambulance'
  end

  it 'admissionCondition is optional' do
    expect {admission.admissionCondition = nil}.not_to raise_error
  end
  
  it 'emergency should be assigned properly' do
    expect(admission.emergency).to be_true
  end

  it 'emergency is optional' do
    expect {admission.emergency = nil}.not_to raise_error
  end

  it 'referer should be assigned properly' do
    expect(admission.referFrom.facility.name[0].value).to eq 'New Millenium Medical College Hospital'
  end
end
