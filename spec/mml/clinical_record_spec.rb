describe MML::ClinicalRecord do
  let(:ext_ref) {MML::ExtRef.new(href: 'img://file/angio/')}
  let(:related_doc) {MML::RelatedDoc.new(value: '11D1AC5400A0C94A814796045F768ED5', relation: 'detail')}
  let(:clinical_record) {MML::ClinicalRecord.new(value: 'Emergency coronary angiography was carried out.', date: '2013-12-20', extRef: [ext_ref], relatedDoc: [related_doc])}

  it 'is an instance of MML::ClinicalRecord' do
    expect(clinical_record).to be_an_instance_of MML::ClinicalRecord
  end

  it 'value should be assigned properly' do
    expect(clinical_record.value).to eq 'Emergency coronary angiography was carried out.'
  end

  it 'value is mandatory' do
    expect {clinical_record.value = nil}.to raise_error ArgumentError
  end

  it 'date should be assigned properly' do
    expect(clinical_record.date).to eq '2013-12-20'
  end

  it 'date is optional' do
    expect {clinical_record.date = nil}.not_to raise_error
  end

  it 'extRef should be assigned properly' do
    expect(clinical_record.extRef[0].href).to eq 'img://file/angio/'
  end

  it 'relatedDoc should be assigned properly' do
    expect(clinical_record.relatedDoc[0].relation).to eq 'detail'
  end
end
