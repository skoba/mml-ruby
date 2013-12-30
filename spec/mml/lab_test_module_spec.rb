describe MML::LabTest do
  let(:labo_test) {MML::LabTest.new(registId: '012345', sampleTime: '2013-12-26T11:45:39', registTime: '2013-12-26T11:49:50', reportTime: '2013-12-26T12:08:00', reportStatus: 'Final version', statusCode: 'final', statusCodeId: 'mmlLb0001', set: 'anemia', setCode: '0012', setCodeId: 'facility_labo', facility: 'Kyoto University hospital', facilityCode: 'insurance', facilityCodeId: 'MML0027', department: 'internal medicine', depCode: '01', depCodeId: 'MML0028', ward: '1-7F', wardCode: '017', wardCodeId: 'LOCAL001', client: 'Shinji KOBAYASHI', clientCode: '005884', clientCodeId: 'LOCAL002', laboratoryCenter: 'EHR test lab', centerCode: '0784', centerCodeId: 'LOCAL003', technician: 'Taro Kyodai', techCode: '8576', techCodeId: 'LOCAL004')}

  it 'is an instance of MML::LabTest' do
    expect(labo_test).to be_an_instance_of MML::LabTest
  end

  it 'registId should be assigned properly' do
    expect(labo_test.registId).to eq '012345'
  end

  it 'registId is mandatory' do
    expect {labo_test.registId = nil}.to raise_error ArgumentError
  end

  it 'sampleTime should be assigned properly' do
    expect(labo_test.sampleTime).to eq '2013-12-26T11:45:39'
  end

  it 'sampleTime is optional' do
    expect {labo_test.sampleTime = nil}.not_to raise_error
  end

  it 'registTime should be assigned properly' do
    expect(labo_test.registTime).to eq '2013-12-26T11:49:50'
  end

  it 'registTime is mandatory' do
    expect {labo_test.registTime = nil}.to raise_error ArgumentError
  end

  it 'reportTime should be assigned properly' do
    expect(labo_test.reportTime).to eq '2013-12-26T12:08:00'
  end

  it 'reportTime is mandatory' do
    expect {labo_test.reportTime = nil}.to raise_error ArgumentError
  end

  it 'reportStatus should be registered properly' do
    expect(labo_test.reportStatus).to eq 'Final version'
  end

  it 'reportStatus is mandatory' do
    expect {labo_test.reportStatus = nil}.to raise_error ArgumentError
  end

  it 'statusCode should be assigned properly' do
    expect(labo_test.statusCode).to eq 'final'
  end

  it 'statusCode is mandatory' do
    expect {labo_test.statusCode = nil}.to raise_error ArgumentError
  end

  it 'statusCodeId should be assigned properly' do
    expect(labo_test.statusCodeId).to eq 'mmlLb0001'
  end
  
  it 'set should be assigned properly' do
    expect(labo_test.set).to eq 'anemia'
  end

  it 'set is optional' do
    expect {labo_test.set}.not_to raise_error
  end

  it 'setCode should be assigned properly' do
    expect(labo_test.setCode).to eq '0012'
  end

  it 'setCode is optional' do
    expect {labo_test.setCode = nil}.not_to raise_error
  end

  it 'setCodeId should be assigned properly' do
    expect(labo_test.setCodeId).to eq 'facility_labo'
  end

  it 'setCodeId is optional' do
    expect {labo_test.setCodeId = nil}.not_to raise_error
  end

  it 'facility should be assigned properly' do
    expect(labo_test.facility).to eq 'Kyoto University hospital'
  end

  it 'facility is mandatory' do
    expect {labo_test.facility = nil}.to raise_error ArgumentError
  end

  it 'facilityCode should be assigned properly' do
    expect(labo_test.facilityCode).to eq 'insurance'
  end

  it 'facilityCode is mandatory' do
    expect {labo_test.facilityCode = nil}.to raise_error ArgumentError
  end

  it 'facilityCodeId should be assigned properly' do
    expect(labo_test.facilityCodeId).to eq 'MML0027'
  end

  it 'facilityCodeId is mandatory' do
    expect {labo_test.facilityCodeId = nil}.to raise_error ArgumentError
  end

  it 'department should be assigned properly' do
    expect(labo_test.department).to eq 'internal medicine'
  end

  it 'department is optional' do
    expect {labo_test.department = nil}.not_to raise_error
  end

  it 'depCode should be assigned properly' do
    expect(labo_test.depCode).to eq '01'
  end

  it 'depCode is optional' do
    expect {labo_test.depCode = nil}.not_to raise_error
  end

  it 'depCodeId should be assigned properly' do
    expect(labo_test.depCodeId).to eq 'MML0028'
  end

  it 'depCodeId is optional' do
    expect {labo_test.depCodeId = nil}.not_to raise_error
  end

  it 'ward should be assigned properly' do
    expect(labo_test.ward).to eq '1-7F'
  end

  it 'ward is optional' do
    expect {labo_test.ward = nil}.not_to raise_error
  end

  it 'wardCode should be assigned properly' do
    expect(labo_test.wardCode).to eq '017'
  end

  it 'wardCodeId should be assigned properly' do
    expect(labo_test.wardCodeId).to eq 'LOCAL001'
  end

  it 'client should be assigned properly' do
    expect(labo_test.client).to eq 'Shinji KOBAYASHI'
  end

  it 'client is optional' do
    expect {labo_test.client = nil}.not_to raise_error
  end

  it 'clientCode should be assigned properly' do
    expect(labo_test.clientCode).to eq '005884'
  end

  it 'clientCode is optional' do
    expect {labo_test.clientCode = nil}.not_to raise_error
  end

  it 'clientCodeId should be assigned properly' do
    expect(labo_test.clientCodeId).to eq 'LOCAL002'
  end

  it 'clientCodeId is optional' do
    expect {labo_test.clientCodeId = nil}.not_to raise_error
  end

  it 'laboratoryCenter should be assgined properly' do
    expect(labo_test.laboratoryCenter).to eq 'EHR test lab'
  end

  it 'laboratoryCenter is mandatory' do
    expect {labo_test.laboratoryCenter = nil}.to raise_error ArgumentError
  end

  it 'centerCode should be assigned properly' do
    expect(labo_test.centerCode).to eq '0784'
  end

  it 'centerCode is mandatory' do
    expect {labo_test.centerCode = nil}.to raise_error ArgumentError
  end

  it 'centerCodeId should be assgined properly' do
    expect(labo_test.centerCodeId).to eq 'LOCAL003'
  end

  it 'centerCodeId is mandatory' do
    expect {labo_test.centerCodeId = nil}.to raise_error ArgumentError
  end
  
  it 'technician should be assigned properly' do
    expect(labo_test.technician).to eq 'Taro Kyodai'
  end

  it 'technician is optional' do
    expect {labo_test.technician = nil}.not_to raise_error
  end

  it 'techCode should be assigned properly' do
    expect(labo_test.techCode).to eq '8576'
  end

  it 'techCode is optional' do
    expect {labo_test.techCode = nil}.not_to raise_error
  end

  it 'techCodeId should be assigned properly' do
    expect(labo_test.techCodeId).to eq 'LOCAL004'
  end

  it 'techCodeId is optional' do
    expect {labo_test.techCodeId = nil}.not_to raise_error
  end

  it 'repMemo should be assigned properly' do
    expect(labo_test.repMemo).to eq ''
  end
end
