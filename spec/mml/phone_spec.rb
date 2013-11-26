describe MML::Phone do
  let(:phone) { MML::Phone.new(telEquipType: 'PH', area: '075', city: '874', number: '7030', full: '078-874-7030(123)', extension: '123', country: '81', memo: 'daytime') }

  it 'should be an instance of MML::Phone' do
    expect(phone).to be_an_instance_of MML::Phone
  end

  it 'equipType should be properly assigned' do
    expect(phone.telEquipType).to eq 'PH'
  end

  it 'area number should be assigned properly' do
    expect(phone.area).to eq '075'
  end

  it 'city number should be assigned properly' do
    expect(phone.city).to eq '874'
  end

  it 'number should be assigned properly' do
    expect(phone.number).to eq'7030'
  end

  it 'extension should be assigned properly' do
    expect(phone.extension).to eq '123'
  end

  it 'full should be assigned properly' do
    expect(phone.full).to eq '078-874-7030(123)'
  end
  it 'country code should be assigned properly' do
    expect(phone.country).to eq '81'
  end

  it 'memo should be assigned properly' do
    expect(phone.memo).to eq 'daytime'
  end

  context '#xml' do
    subject { phone.to_xml }

    it {should match '<mmlPh:Phone mmlPh:telEquipType="PH">'}
    it {should match '<mmlPh:area>075</mmlPh:area>'}
    it {should match '<mmlPh:city>874</mmlPh:city>'}
    it {should match '<mmlPh:number>7030</mmlPh:number>'}
    it {should match '<mmlPh:extension>123</mmlPh:extension>'}
    it {should match '<mmlPh:full>078-874-7030\(123\)</mmlPh:full>'}
    it {should match '<mmlPh:country>81</mmlPh:country>'}
    it {should match '<mmlPh:memo>daytime</mmlPh:memo>'}
    it {should match '</mmlPh:Phone>'}
  end
end
