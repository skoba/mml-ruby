describe MML::RelatedDoc do
  let(:related_doc) {MML::RelatedDoc.new(value: '11D1AC5400A0C94A814796045F768ED5', relation: 'detail')}

  it 'is an instance of MML::RelatedDoc' do
    expect(related_doc).to be_an_instance_of MML::RelatedDoc
  end

  it 'value should be assigned properly' do
    expect(related_doc.value).to eq '11D1AC5400A0C94A814796045F768ED5'
  end

  it 'relation should be assigned properly' do
    expect(related_doc.relation).to eq 'detail'
  end
end
