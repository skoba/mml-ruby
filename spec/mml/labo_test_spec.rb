describe MML::LaboTest do
  let(:labo_test) {MML::LaboTest.new(registId: '0002228', sampleTime: '2002-07-25T06:00:00', registTime: '2002-07-25T00:00:00', reportTime: '2002-07-25T11:15:00')}

  it 'is an instance of MML::LaboTest' do
    expect(labo_test).to be_an_instance_of MML::LaboTest
  end

  it 'registId is 0002228' do
    expect(labo_test.registId).to eq '0002228'
  end

  it 'registId is mandatory' do
    expect {labo_test.registId = nil}.to raise_error ArgumentError
  end

  it 'sampleTime is 2002-07-25T06:00:00' do
    expect(labo_test.sampleTime).to eq '2002-07-25T06:00:00'
  end

  it 'sampleTime is optional' do
    expect {labo_test.sampleTime = nil}.not_to raise_error
  end

  it 'registTime is 2002-07-25T00:00:00' do
    expect(labo_test.registTime).to eq '2002-07-25T00:00:00'
  end

  it 'registTime is mandatory' do
    expect {labo_test.registTime}.not_to raise_error
  end

  it 'reportTime is 2002-07-25T11:15:00' do
    expect(labo_test.reportTime).to eq '2002-07-25T11:15:00'
  end

  it 'reportTime is mandatory' do
    expect {labo_test.reportTime = nil}.to raise_error ArgumentError
  end
end
