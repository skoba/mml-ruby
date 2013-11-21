describe MML::PatientInfo do
  let(:master_id) { MML::Id.new(value: '0001', type: 'facility', repCode: 'A', tableId: 'MML0024') }
  let(:other_id) { MML::Id.new(value: '000A', type: 'spouseId', repCode: 'A', tableId: 'MML0024') }
  let(:person_name) { MML::Name.new(repCode: 'A', fullname: 'Shinji KOBAYASHI')}
  let(:patient_info) { MML::PatientInfo.new(masterId: master_id, otherId: [other_id], personName: [person_name], birthday: '1970-04-19', sex: 'male') }

  it 'should be an instance of MML::PatientInfo' do
    expect(patient_info).to be_an_instance_of MML::PatientInfo
  end

  it 'masterId should be assigned properly' do
    expect(patient_info.masterId.value).to eq '0001'
  end

  it 'masterId is mandatory' do
    expect {patient_info.masterId = nil}.to raise_error ArgumentError
  end
  it 'otherId should be assigned properly' do
    expect(patient_info.otherId[0].value).to eq '000A'
  end

  it 'personName should be assigned properly' do
    expect(patient_info.personName[0].fullname).to eq 'Shinji KOBAYASHI'
  end

  it 'personName is mandatory' do
    expect { patient_info.personName = nil }.to raise_error ArgumentError
  end

  it 'personName should not be empty' do
    expect { patient_info.personName = [] }.to raise_error ArgumentError
  end

  it 'birthday should be assigned properly' do
    expect(patient_info.birthday).to eq '1970-04-19'
  end

  it 'birthday is mandatory' do
    expect {patient_info.birthday = nil}.to raise_error ArgumentError
  end

  it 'sex(gender) should be described' do
    expect(patient_info.sex).to eq 'male'
  end
end
