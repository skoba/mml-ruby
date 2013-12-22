describe MML::TestResult do
  let(:ext_ref) {MML::ExtRef.new(href: 'patient1234/prescription004.HL7')}
  let(:test_result) {MML::TestResult.new(date: '2013-12-22', value: 'Labo findings on discharge', link: [ext_ref])}

  it 'is an instance of MML::TestResult' do
    expect(test_result).to be_an_instance_of MML::TestResult
  end

  it 'date should be assigned properly' do
    expect(test_result.date).to eq '2013-12-22'
  end

  it 'date is optional' do
    expect {test_result.date = nil}.not_to raise_error
  end

  it 'value should be assigned properly' do
    expect(test_result.value).to eq 'Labo findings on discharge'
  end

  it 'link should be assgined properly' do
    expect(test_result.link[0].href).to eq 'patient1234/prescription004.HL7'
  end
end
