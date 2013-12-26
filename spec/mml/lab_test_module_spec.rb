describe MML::LabTest do
  let(:labo_test) {MML::LabTest.new(registId: '012345', sampleTime: '2013-12-26T11:45:39', registTime: '2013-12-26T11:49:50', reportTime: '2013-12-26T12:08:00')}

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
end
