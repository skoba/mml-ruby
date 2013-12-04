describe MML::BaseClinic do
  let(:allergy_item) {MML::AllergyItem.new(factor: 'crab', severity: 'mild', identifiedDate: 'since almost 20 years ago', memo: 'no reaction to shrimp')}
  let(:other_blood_type) {MML::OtherBloodType.new(typeName: 'MNS blood type', typeJudgement: 'MN', description: 'examination at 2 years ago')}
  let(:bloodtype) {MML::BloodType.new(abo: 'a', rh: 'rhD+', others: [other_blood_type], memo: 'after BMT')}
    let(:infection_item) {MML::InfectionItem.new(factor: 'Influenza', examValue: 'A+B-', identifiedDate: '2013-12-03', memo: 'drug resistance(-)')}
  let(:base_clinic) {MML::BaseClinic.new(allergy: [allergy_item], bloodtype: bloodtype, infection: [infection_item])}

  it 'is an instance of MML::BaseClinic' do
    expect(base_clinic).to be_an_instance_of MML::BaseClinic
  end

  it 'allergy item should be assigned properly' do
    expect(base_clinic.allergy[0].factor).to eq 'crab'
  end

  it 'blood type should be assigned properly' do
    expect(base_clinic.bloodtype.abo).to eq 'a'
  end

  it 'infection should be assigned properly' do
    expect(base_clinic.infection[0].factor).to eq 'Influenza'
  end

  describe '#to_xml' do
    subject {base_clinic.to_xml}

    it {should match '<mmlBc:BaseClinicModule>'}
    it {should match '<mmlBc:allergy>'}
    it {should match '<mmlBc:allergyItem>'}
    it {should match '<mmlBc:factor>crab</mmlBc:factor>'}
    it {should match '<mmlBc:severity>mild</mmlBc:severity>'}
    it {should match '<mmlBc:identifiedDate>since almost 20 years ago</mmlBc:identifiedDate>'}
    it {should match '<mmlBc:memo>no reaction to shrimp</mmlBc:memo>'}
    it {should match '</mmlBc:allergyItem>'}
    it {should match '</mmlBc:allergy>'}
    it {should match '<mmlBc:bloodtype>'}
    it {should match '<mmlBc:abo>a</mmlBc:abo>'}
    it {should match '<mmlBc:rh>rhD\+</mmlBc:rh>'}
    it {should match '<mmlBc:others>'}
    it {should match '<mmlBc:other>'}
    it {should match '<mmlBc:typeName>MNS blood type</mmlBc:typeName>'}
    it {should match '<mmlBc:typeJudgement>MN</mmlBc:typeJudgement>'}
    it {should match '<mmlBc:description>examination at 2 years ago</mmlBc:description>'}
    it {should match '</mmlBc:other>'}
    it {should match '</mmlBc:others>'}
    it {should match '<mmlBc:memo>after BMT</mmlBc:memo>'}
    it {should match '</mmlBc:bloodtype>'}
    it {should match '<mmlBc:infection>'}
    it {should match '<mmlBc:infectionItem>'}
    it {should match '<mmlBc:factor>Influenza</mmlBc:factor>'}
    it {should match '<mmlBc:examValue>A\+B-</mmlBc:examValue>'}
    it {should match '<mmlBc:identifiedDate>2013-12-03</mmlBc:identifiedDate>'}
    it {should match '<mmlBc:memo>drug resistance\(-\)</mmlBc:memo>'}
    it {should match '</mmlBc:infectionItem>'}
    it {should match '</mmlBc:infection>'}
    it {should match '</mmlBc:BaseClinicModule>'}
  end
end
