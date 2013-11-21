describe MML::PatientInfo do
  let(:master_id) {MML::Id.new(value: '0001', type: 'facility', repCode: 'A', tableId: 'MML0024')}
  let(:patient_info) { MML::PatientInfo.new(masterId: master_id) }

  it 'should be an instance of MML::PatientInfo' do
    expect(patient_info).to be_an_instance_of MML::PatientInfo
  end

  it 'master_id should be assigned properly' do
    expect(patient_info.masterId.value).to eq '0001'
  end
end
