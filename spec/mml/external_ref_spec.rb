describe MML::ExtRef do
  let(:ext_ref) { MML::ExtRef.new(contentType: 'APPLICATION/HL72.3-HL7ER2.3', medicalRole: 'prescription', title: 'Prescription on discharge', href: 'patient1234/prescription831.HL7' )}

  it 'should be an instance of MML::ExtRef' do
    expect(ext_ref).to be_an_instance_of MML::ExtRef
  end

  it 'content type should be APPLICATION/HL72.3-HL7ER2.3' do
    expect(ext_ref.contentType).to eq 'APPLICATION/HL72.3-HL7ER2.3'
  end

  it 'medical role should be prescription' do
    expect(ext_ref.medicalRole).to eq 'prescription'
  end

  it 'title should be Prescription on discharge' do
    expect(ext_ref.title).to eq 'Prescription on discharge'
  end

  it 'href should be patient1234/prescription831.HL7' do
    expect(ext_ref.href).to eq 'patient1234/prescription831.HL7'
  end

  it 'href is mandatory' do
    expect {ext_ref.href=nil}.to raise_error ArgumentError
  end

  context '#to_xml' do
    subject { ext_ref.to_xml }

    it { should match '<mmlCm:extRef'}
    it { should match 'mmlCm:contentType="APPLICATION/HL72.3-HL7ER2.3"'}
    it { should match 'mmlCm:medicalRole="prescription"'}
    it { should match 'mmlCm:title="Prescription on discharge"'}
    it { should match 'mmlCm:href="patient1234/prescription831.HL7"'}
  end
end
